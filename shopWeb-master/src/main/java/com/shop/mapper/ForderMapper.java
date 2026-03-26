package com.shop.mapper;

import com.shop.entity.Forder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 订单数据访问层
 * 提供订单表的CRUD操作及自定义查询
 * 
 * @author shop
 */
public interface ForderMapper {

    /**
     * 根据主键删除订单
     * @param fid 订单ID
     * @return 影响行数
     */
    int deleteByPrimaryKey(Integer fid);

    /**
     * 插入订单（全字段）
     * @param forder 订单对象
     * @return 影响行数
     */
    int insert(Forder forder);

    /**
     * 插入订单（可选字段）
     * @param forder 订单对象
     * @return 影响行数
     */
    int insertSelective(Forder forder);

    /**
     * 根据主键查询订单
     * @param fid 订单ID
     * @return 订单对象
     */
    Forder selectByPrimaryKey(Integer fid);

    /**
     * 查询所有订单
     * @return 订单列表
     */
    List<Forder> selectList();

    /**
     * 根据主键更新订单（可选字段）
     * @param forder 订单对象
     * @return 影响行数
     */
    int updateByPrimaryKeySelective(Forder forder);

    /**
     * 根据主键更新订单（全字段）
     * @param forder 订单对象
     * @return 影响行数
     */
    int updateByPrimaryKey(Forder forder);

    /**
     * 更新订单状态
     * @param fid 订单ID
     * @param status 订单状态（0：未支付，1：已支付，2：已发货，3：已完成，4：已取消）
     * @return 影响行数
     */
    int updateStatus(@Param("fid") Integer fid, @Param("status") Integer status);
}
