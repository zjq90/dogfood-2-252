package com.shop.mapper;

import com.shop.entity.Admin;
import org.apache.ibatis.annotations.Param;

/**
 * 管理员数据访问层
 * 提供管理员表的CRUD操作及登录验证
 * 
 * @author shop
 */
public interface AdminMapper {

    /**
     * 根据主键删除管理员
     * @param aid 管理员ID
     * @return 影响行数
     */
    int deleteByPrimaryKey(Integer aid);

    /**
     * 插入管理员（全字段）
     * @param admin 管理员对象
     * @return 影响行数
     */
    int insert(Admin admin);

    /**
     * 插入管理员（可选字段）
     * @param admin 管理员对象
     * @return 影响行数
     */
    int insertSelective(Admin admin);

    /**
     * 根据主键查询管理员
     * @param aid 管理员ID
     * @return 管理员对象
     */
    Admin selectByPrimaryKey(Integer aid);

    /**
     * 根据主键更新管理员（可选字段）
     * @param admin 管理员对象
     * @return 影响行数
     */
    int updateByPrimaryKeySelective(Admin admin);

    /**
     * 根据主键更新管理员（全字段）
     * @param admin 管理员对象
     * @return 影响行数
     */
    int updateByPrimaryKey(Admin admin);

    /**
     * 根据用户名和密码查询管理员（登录）
     * @param username 用户名
     * @param password 密码
     * @return 管理员对象
     */
    Admin findByUsernameAndPassword(@Param("username") String username, @Param("password") String password);
}
