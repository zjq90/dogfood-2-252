package com.shop.service;

import com.shop.entity.Forder;

import java.util.List;

/**
 * 订单服务接口
 * 定义订单相关的业务逻辑操作，包括订单提交、订单查询、订单状态更新等
 * 
 * @author shop
 * @date 2024-03-24
 */
public interface ForderService {

    /**
     * 计算订单总金额
     * 根据购物车中的订单项计算订单总金额
     * 
     * @param forder 订单信息（包含订单项集合）
     * @return 订单总金额
     */
    Double calculateTotal(Forder forder);

    /**
     * 提交订单
     * 将购物车中的订单信息保存到数据库，包括订单信息和订单项信息
     * 
     * @param forder 订单信息（包含收货人姓名、电话、地址等）
     * @param sessionForder 购物车中的订单信息（包含订单项集合和总金额）
     * @return 影响的行数
     * @throws Exception 商品库存不足时抛出
     */
    int insertOrder(Forder forder, Forder sessionForder) throws Exception;

    /**
     * 查询所有订单列表
     * 按订单创建时间倒序排列
     * 
     * @return 订单列表
     */
    List<Forder> selectList();

    /**
     * 根据订单ID删除订单
     * 删除订单及其关联的订单项
     * 
     * @param fid 订单ID
     * @return 影响的行数
     * @throws Exception 删除失败时抛出
     */
    int deleteByPrimaryKey(Integer fid) throws Exception;

    /**
     * 更新订单状态
     * 更新订单的发货状态
     * 
     * @param fid 订单ID
     * @param status 订单状态（0-未发货，1-已发货，2-已完成）
     * @return 影响的行数
     */
    int updateStatus(Integer fid, Integer status);
}
