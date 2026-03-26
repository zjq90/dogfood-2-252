package com.shop.service;

import com.shop.entity.User;

/**
 * 用户服务接口
 * 提供用户注册、登录、查询等功能
 * 
 * @author shop
 */
public interface UserService {

    /**
     * 检查用户名是否存在
     * @param username 用户名
     * @return 存在返回1，不存在返回0
     */
    int checkUsername(String username);

    /**
     * 用户登录
     * @param username 用户名
     * @param password 密码
     * @return 登录成功返回用户对象，失败抛出异常
     */
    User login(String username, String password);

    /**
     * 根据用户名查询用户
     * @param username 用户名
     * @return 用户对象
     */
    User findByUsername(String username);

    /**
     * 添加新用户（注册）
     * @param user 用户对象
     * @return 影响行数
     */
    int addUser(User user);
}
