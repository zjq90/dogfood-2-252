package com.shop.mapper;

import com.shop.entity.User;
import org.apache.ibatis.annotations.Param;

/**
 * 用户数据访问层
 * 提供用户数据的增删改查操作
 * 
 * @author shop
 * @version 1.0
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
     * 选择性插入用户（非空字段）
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
     * 选择性更新用户（非空字段）
     * @param user 用户对象
     * @return 影响行数
     */
    int updateByPrimaryKeySelective(User user);

    /**
     * 更新用户（全字段）
     * @param user 用户对象
     * @return 影响行数
     */
    int updateByPrimaryKey(User user);

    /**
     * 检查用户名是否存在
     * @param username 用户名
     * @return 存在返回大于0，不存在返回0
     */
    int checkUsername(String username);

    /**
     * 根据用户名和密码查询用户
     * @param username 用户名
     * @param password 密码
     * @return 用户对象
     */
    User findByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

    /**
     * 保存用户信息
     * @param user 用户对象
     * @return 影响行数
     */
    int save(User user);
}
