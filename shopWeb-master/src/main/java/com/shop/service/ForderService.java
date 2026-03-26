package com.shop.service;

import com.shop.entity.Forder;
import com.shop.entity.Sorder;

import java.util.List;

/**
 * 订单服务接口
 * 提供订单相关的业务逻辑，包括创建订单、查询订单、删除订单等
 * 
 * @author shop
 */
public interface ForderService {

    /**
     * 计算订单总金额
     * @param forder 订单对象
     * @return 总金额
     */
    Double calculateTotal(Forder forder);

    /**
     * 插入订单（旧方法，保留兼容）
     */
    @Deprecated
    int insertOrder(Forder forder, Forder sessionForder) throws Exception;

    /**
     * 创建新订单
     * @param forder 订单信息
     * @param cart 购物车商品列表
     * @throws Exception 异常信息
     */
    void addOrder(Forder forder, List<Sorder> cart) throws Exception;

    /**
     * 查询所有订单
     * @return 订单列表
     */
    List<Forder> selectList();

    /**
     * 查询所有订单（新方法名）
     * @return 订单列表
     */
    List<Forder> listForder();

    /**
     * 根据ID查询订单
     * @param fid 订单ID
     * @return 订单对象
     */
    Forder findById(Integer fid);

    /**
     * 根据主键删除订单
     * @param fid 订单ID
     * @throws Exception 异常信息
     */
    int deleteByPrimaryKey(Integer fid) throws Exception;

    /**
     * 删除订单（新方法名）
     * @param fid 订单ID
     */
    void deleteForder(Integer fid);

    /**
     * 更新订单状态
     * @param fid 订单ID
     * @param status 订单状态
     * @return 影响行数
     */
    int updateStatus(Integer fid, Integer status);
}
