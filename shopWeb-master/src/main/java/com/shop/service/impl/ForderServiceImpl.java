package com.shop.service.impl;

import com.shop.entity.Forder;
import com.shop.entity.Product;
import com.shop.entity.Sorder;
import com.shop.mapper.ForderMapper;
import com.shop.mapper.ProductMapper;
import com.shop.mapper.SorderMapper;
import com.shop.service.ForderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 订单服务实现类
 * 实现订单相关的业务逻辑操作
 * 
 * @author shop
 * @date 2024-03-24
 */
@Service
@Transactional
public class ForderServiceImpl implements ForderService {

    private static final Logger logger = LoggerFactory.getLogger(ForderServiceImpl.class);

    @Autowired
    private ForderMapper forderMapper;

    @Autowired
    private SorderMapper sorderMapper;

    @Autowired
    private ProductMapper productMapper;

    /**
     * 计算订单总金额
     * 根据购物车中的订单项计算订单总金额
     * 
     * @param forder 订单信息（包含订单项集合）
     * @return 订单总金额
     */
    @Override
    public Double calculateTotal(Forder forder) {
        if (forder == null || forder.getSorderSet() == null) {
            return 0.0;
        }
        double total = 0.0;
        for (Sorder sorder : forder.getSorderSet()) {
            total += sorder.getPrice() * sorder.getNumber();
        }
        return total;
    }

    /**
     * 提交订单
     * 将购物车中的订单信息保存到数据库，包括订单信息和订单项信息
     * 在保存前会检查商品库存是否充足
     * 
     * @param forder 订单信息（包含收货人姓名、电话、地址等）
     * @param sessionForder 购物车中的订单信息（包含订单项集合和总金额）
     * @return 影响的行数
     * @throws Exception 商品库存不足时抛出
     */
    @Override
    public int insertOrder(Forder forder, Forder sessionForder) throws Exception {
        logger.debug("创建订单: {}", forder.getName());

        Set<Sorder> sorderSet = sessionForder.getSorderSet();
        Set<Product> productSet = new HashSet<>();

        // 收集订单中的商品信息并检查库存
        for (Sorder sorder : sorderSet) {
            Product product = productMapper.selectByPrimaryKey(sorder.getPid());
            product.setNumber(sorder.getNumber());
            productSet.add(product);
        }

        // 检查库存是否充足
        for (Product product : productSet) {
            Product dbProduct = productMapper.selectByPrimaryKey(product.getPid());
            if (dbProduct.getNumber() < product.getNumber()) {
                logger.warn("商品库存不足: {}", product.getPname());
                throw new RuntimeException("商品 " + product.getPname() + " 库存不足");
            }
        }

        // 保存订单信息
        int result = forderMapper.insert(forder);
        logger.info("订单创建成功，订单ID: {}", forder.getFid());

        // 保存订单项信息
        for (Sorder sorder : sorderSet) {
            sorder.setFid(forder.getFid());
            sorderMapper.insert(sorder);
        }

        // 扣减商品库存
        productMapper.subProductNumber(productSet);
        logger.info("商品库存扣减成功");

        return result;
    }

    /**
     * 查询所有订单列表
     * 按订单创建时间倒序排列
     * 
     * @return 订单列表
     */
    @Override
    public List<Forder> selectList() {
        logger.debug("查询所有订单");
        return forderMapper.selectList();
    }

    /**
     * 根据订单ID删除订单
     * 删除订单及其关联的订单项
     * 
     * @param fid 订单ID
     * @return 影响的行数
     * @throws Exception 删除失败时抛出
     */
    @Override
    public int deleteByPrimaryKey(Integer fid) throws Exception {
        logger.debug("删除订单: {}", fid);

        // 先删除订单项
        sorderMapper.deleteByFid(fid);
        // 再删除订单
        int result = forderMapper.deleteByPrimaryKey(fid);
        logger.info("订单删除成功: {}", fid);

        return result;
    }

    /**
     * 更新订单状态
     * 更新订单的发货状态
     * 
     * @param fid 订单ID
     * @param status 订单状态（0-未发货，1-已发货，2-已完成）
     * @return 影响的行数
     */
    @Override
    public int updateStatus(Integer fid, Integer status) {
        logger.debug("更新订单状态，订单ID: {}, 状态: {}", fid, status);
        int result = forderMapper.updateStatus(fid, status);
        logger.info("订单状态更新成功: {}", fid);
        return result;
    }
}
