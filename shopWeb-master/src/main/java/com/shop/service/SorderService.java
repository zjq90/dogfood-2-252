package com.shop.service;

import com.shop.entity.Forder;
import com.shop.entity.Product;
import com.shop.entity.Sorder;

import java.util.List;

/**
 * 订单项服务接口
 * 定义订单项相关的业务逻辑操作，包括添加订单项、查询订单项等
 * 
 * @author shop
 * @date 2024-03-24
 */
public interface SorderService {

    /**
     * 添加商品到购物车
     * 将商品转换为订单项并添加到购物车中
     * 
     * @param forder 购物车订单
     * @param product 商品信息
     * @return 更新后的购物车订单
     */
    Forder addSorder(Forder forder, Product product);

    /**
     * 将商品转换为订单项
     * 将商品信息转换为订单项对象
     * 
     * @param product 商品信息
     * @return 订单项对象
     */
    Sorder productToSorder(Product product);

    /**
     * 根据订单ID查询订单项列表
     * 查询指定订单下的所有订单项
     * 
     * @param fid 订单ID
     * @return 订单项列表
     */
    List<Sorder> listSorderByFid(Integer fid);
}
