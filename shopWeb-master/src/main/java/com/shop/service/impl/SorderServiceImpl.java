package com.shop.service.impl;

import com.shop.entity.Forder;
import com.shop.entity.Product;
import com.shop.entity.Sorder;
import com.shop.mapper.SorderMapper;
import com.shop.service.SorderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 订单项服务实现类
 * 实现订单项相关的业务逻辑操作
 * 
 * @author shop
 * @date 2024-03-24
 */
@Service
@Transactional
public class SorderServiceImpl implements SorderService {

    private static final Logger logger = LoggerFactory.getLogger(SorderServiceImpl.class);

    @Autowired
    private SorderMapper sorderMapper;

    /**
     * 添加商品到购物车
     * 将商品转换为订单项并添加到购物车中
     * 如果购物车中已存在该商品，则增加数量
     * 
     * @param forder 购物车订单
     * @param product 商品信息
     * @return 更新后的购物车订单
     */
    @Override
    public Forder addSorder(Forder forder, Product product) {
        logger.debug("添加商品到购物车: {}", product.getPname());

        // 将商品转换为订单项
        Sorder sorder = productToSorder(product);

        // 获取购物车中的订单项集合
        Set<Sorder> sorderSet = forder.getSorderSet();
        if (sorderSet == null) {
            sorderSet = new HashSet<>();
            forder.setSorderSet(sorderSet);
        }

        // 检查购物车中是否已存在该商品
        boolean exists = false;
        for (Sorder item : sorderSet) {
            if (item.getPid().equals(product.getPid())) {
                // 已存在则增加数量
                item.setNumber(item.getNumber() + product.getNumber());
                exists = true;
                break;
            }
        }

        // 不存在则添加新订单项
        if (!exists) {
            sorderSet.add(sorder);
        }

        logger.info("商品添加到购物车成功: {}", product.getPname());
        return forder;
    }

    /**
     * 将商品转换为订单项
     * 将商品信息转换为订单项对象，设置商品名称、价格、数量等信息
     * 
     * @param product 商品信息
     * @return 订单项对象
     */
    @Override
    public Sorder productToSorder(Product product) {
        Sorder sorder = new Sorder();
        sorder.setName(product.getPname());
        sorder.setPrice(product.getCprice());
        sorder.setNumber(product.getNumber());
        sorder.setPid(product.getPid());
        sorder.setProduct(product);
        return sorder;
    }

    /**
     * 根据订单ID查询订单项列表
     * 查询指定订单下的所有订单项
     * 
     * @param fid 订单ID
     * @return 订单项列表
     */
    @Override
    public List<Sorder> listSorderByFid(Integer fid) {
        logger.debug("查询订单项，订单ID: {}", fid);
        return sorderMapper.listSorderByFid(fid);
    }
}
