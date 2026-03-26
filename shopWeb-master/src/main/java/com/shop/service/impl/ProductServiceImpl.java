package com.shop.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shop.entity.Product;
import com.shop.mapper.ProductMapper;
import com.shop.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 商品服务实现类
 * 实现商品相关的业务逻辑操作
 * 
 * @author shop
 * @date 2024-03-24
 */
@Service
@Transactional
public class ProductServiceImpl implements ProductService {

    private static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);

    @Autowired
    private ProductMapper productMapper;

    /**
     * 查询所有商品列表
     * 
     * @return 商品列表
     */
    @Override
    public List<Product> listProduct() {
        logger.debug("查询所有商品列表");
        return productMapper.listProduct();
    }

    /**
     * 添加商品
     * 
     * @param product 商品信息
     * @return 影响的行数
     */
    @Override
    public int addProduct(Product product) {
        logger.debug("添加商品: {}", product.getPname());
        int result = productMapper.insert(product);
        logger.info("添加商品成功，ID: {}", product.getPid());
        return result;
    }

    /**
     * 删除商品
     * 
     * @param pid 商品ID
     * @return 影响的行数
     */
    @Override
    public int deleteProduct(Integer pid) {
        logger.debug("删除商品: {}", pid);
        int result = productMapper.deleteByPrimaryKey(pid);
        logger.info("删除商品成功: {}", pid);
        return result;
    }

    /**
     * 根据ID查询商品
     * 
     * @param pid 商品ID
     * @return 商品信息
     */
    @Override
    public Product findById(Integer pid) {
        logger.debug("根据ID查询商品: {}", pid);
        return productMapper.selectByPrimaryKey(pid);
    }

    /**
     * 更新商品信息
     * 
     * @param product 商品信息
     * @return 影响的行数
     */
    @Override
    public int updateProduct(Product product) {
        logger.debug("更新商品: {}", product.getPid());
        int result = productMapper.updateByPrimaryKey(product);
        logger.info("更新商品成功: {}", product.getPid());
        return result;
    }

    /**
     * 根据名称搜索商品
     * 
     * @param pname 商品名称关键字
     * @return 商品列表
     */
    @Override
    public List<Product> findByName(String pname) {
        logger.debug("根据名称查询商品: {}", pname);
        return productMapper.findByPname(pname);
    }

    /**
     * 分页查询商品
     * 
     * @param pageNum 页码
     * @param pageSize 每页数量
     * @return 分页信息
     */
    @Override
    public PageInfo<Product> pageInfo(int pageNum, int pageSize) {
        logger.debug("分页查询商品，页码: {}, 每页数量: {}", pageNum, pageSize);
        PageHelper.startPage(pageNum, pageSize);
        List<Product> list = productMapper.listProduct();
        return new PageInfo<>(list);
    }

    /**
     * 查询最新商品
     * 按上架时间倒序排列，取前10条
     * 
     * @return 最新商品列表
     */
    @Override
    public List<Product> findNewProducts() {
        logger.debug("查询最新商品");
        return productMapper.frontlistNew();
    }

    /**
     * 查询热门商品
     * 查询标记为热门的商品，取前5条
     * 
     * @return 热门商品列表
     */
    @Override
    public List<Product> findHotProducts() {
        logger.debug("查询热门商品");
        return productMapper.frontlistHot();
    }
}
