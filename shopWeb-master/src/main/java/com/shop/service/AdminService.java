package com.shop.service;

import com.shop.entity.Admin;

/**
 * 管理员服务接口
 * 定义管理员相关的业务逻辑操作，包括登录验证等
 * 
 * @author shop
 * @date 2024-03-24
 */
public interface AdminService {

    /**
     * 管理员登录
     * 验证管理员用户名和密码，登录成功返回管理员信息
     * 
     * @param username 用户名
     * @param password 密码
     * @return 管理员信息
     * @throws RuntimeException 用户名或密码错误时抛出
     */
    Admin login(String username, String password);
}
