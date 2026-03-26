package com.shop.mapper;

import com.shop.entity.User;
import org.apache.ibatis.annotations.Param;

/**
 * 用户数据访问层
 * 提供用户表的CRUD操作及自定义查询
 * 
 * @author shop
 */
public interface UserMapper {

    /**
     * 根据主键删除用户
     * @param uid 用户ID
     * @return 影响行数
     */
    int deleteByPrimaryKey(Integer uid);

    /**
     * 插入用户（全字段）
     * @param user 用户对象
     * @return 影响行数
     */
    int insert(User user);

    /**
     * 插入用户（可选字段）
     * @param user 用户对象
     * @return 影响行数
     */
    int insertSelective(User user);

    /**
     * 根据主键查询用户
     * @param uid 用户ID
     * @return 用户对象
     */
    User selectByPrimaryKey(Integer uid);

    /**
     * 根据主键更新用户（可选字段）
     * @param user 用户对象
     * @return 影响行数
     */
    int updateByPrimaryKeySelective(User user);

    /**
     * 根据主键更新用户（全字段）
     * @param user 用户对象
     * @return 影响行数
     */
    int updateByPrimaryKey(User user);

    /**
     * 检查用户名是否存在
     * @param username 用户名
     * @return 存在返回1，不存在返回0
     */
    int checkUsername(String username);

    /**
     * 根据用户名和密码查询用户（登录）
     * @param username 用户名
     * @param password 密码
     * @return 用户对象
     */
    User findByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

    /**
     * 根据用户名查询用户
     * @param username 用户名
     * @return 用户对象
     */
    User findByUsername(String username);
}
