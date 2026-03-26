package com.shop.service;

import com.shop.entity.User;

/**
 * 用户服务接口
 * 提供用户登录验证、注册等业务逻辑
 * 
 * @author shop
 * @version 1.0
 */
public interface UserService {

    /**
     * 检查用户名是否已存在
     * @param username 用户名
     * @return 存在返回大于0的数字，不存在返回0
     */
    int checkUsername(String username);

    /**
     * 用户登录验证
     * @param username 用户名
     * @param password 密码
     * @return 登录成功返回用户对象
     * @throws RuntimeException 用户名或密码错误时抛出异常
     */
    User login(String username, String password);

    /**
     * 用户注册
     * @param user 用户信息
     * @return 注册成功返回影响行数
     */
    int register(User user);
}
