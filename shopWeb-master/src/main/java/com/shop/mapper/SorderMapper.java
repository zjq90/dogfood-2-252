package com.shop.mapper;

import com.shop.entity.Sorder;

import java.util.List;

/**
 * 订单项数据访问层
 * 提供订单项表的CRUD操作及自定义查询
 * 
 * @author shop
 */
public interface SorderMapper {

    /**
     * 根据主键删除订单项
     * @param sid 订单项ID
     * @return 影响行数
     */
    int deleteByPrimaryKey(Integer sid);

    /**
     * 插入订单项（全字段）
     * @param sorder 订单项对象
     * @return 影响行数
     */
    int insert(Sorder sorder);

    /**
     * 插入订单项（可选字段）
     * @param sorder 订单项对象
     * @return 影响行数
     */
    int insertSelective(Sorder sorder);

    /**
     * 根据主键查询订单项
     * @param sid 订单项ID
     * @return 订单项对象
     */
    Sorder selectByPrimaryKey(Integer sid);

    /**
     * 根据主键更新订单项（可选字段）
     * @param sorder 订单项对象
     * @return 影响行数
     */
    int updateByPrimaryKeySelective(Sorder sorder);

    /**
     * 根据主键更新订单项（全字段）
     * @param sorder 订单项对象
     * @return 影响行数
     */
    int updateByPrimaryKey(Sorder sorder);

    /**
     * 根据订单ID删除所有订单项
     * @param fid 订单ID
     * @return 影响行数
     */
    int deleteByFid(Integer fid);

    /**
     * 根据订单ID查询所有订单项
     * @param fid 订单ID
     * @return 订单项列表
     */
    List<Sorder> listSorderByFid(Integer fid);
}
