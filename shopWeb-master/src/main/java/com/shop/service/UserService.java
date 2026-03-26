package com.shop.service;

import com.shop.entity.User;

/**
 * 用户服务接口
 * 定义用户相关的业务逻辑操作，包括注册、登录、用户信息管理等
 * 
 * @author shop
 * @date 2024-03-24
 */
public interface UserService {

    /**
     * 检查用户名是否已存在
     * 用于用户注册时验证用户名是否可用
     * 
     * @param username 用户名
     * @return 存在返回大于0的数，不存在返回0
     */
    int checkUsername(String username);

    /**
     * 用户登录
     * 验证用户名和密码，登录成功返回用户信息
     * 
     * @param username 用户名
     * @param password 密码
     * @return 用户信息
     * @throws RuntimeException 用户名或密码错误时抛出
     */
    User login(String username, String password);

    /**
     * 用户注册
     * 将新用户信息保存到数据库
     * 
     * @param user 用户信息
     * @return 影响的行数
     */
    int insertUser(User user);
}
