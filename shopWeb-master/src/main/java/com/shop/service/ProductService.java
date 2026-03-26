package com.shop.service;

import com.github.pagehelper.PageInfo;
import com.shop.entity.Product;

import java.util.List;

/**
 * 商品服务接口
 * 定义商品相关的业务逻辑操作
 * 
 * @author shop
 * @date 2024-03-24
 */
public interface ProductService {

    /**
     * 查询所有商品列表
     * 
     * @return 商品列表
     */
    List<Product> listProduct();

    /**
     * 添加商品
     * 
     * @param product 商品信息
     * @return 影响的行数
     */
    int addProduct(Product product);

    /**
     * 删除商品
     * 
     * @param pid 商品ID
     * @return 影响的行数
     */
    int deleteProduct(Integer pid);

    /**
     * 根据ID查询商品
     * 
     * @param pid 商品ID
     * @return 商品信息
     */
    Product findById(Integer pid);

    /**
     * 更新商品信息
     * 
     * @param product 商品信息
     * @return 影响的行数
     */
    int updateProduct(Product product);

    /**
     * 根据名称搜索商品
     * 
     * @param pname 商品名称关键字
     * @return 商品列表
     */
    List<Product> findByName(String pname);

    /**
     * 分页查询商品
     * 
     * @param pageNum 页码
     * @param pageSize 每页数量
     * @return 分页信息
     */
    PageInfo<Product> pageInfo(int pageNum, int pageSize);

    /**
     * 查询最新商品
     * 
     * @return 最新商品列表
     */
    List<Product> findNewProducts();

    /**
     * 查询热门商品
     * 
     * @return 热门商品列表
     */
    List<Product> findHotProducts();
}
