package com.shop.service.impl;

import com.shop.entity.Admin;
import com.shop.mapper.AdminMapper;
import com.shop.service.AdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 管理员服务实现类
 * 提供管理员登录验证等业务逻辑实现
 * 
 * @author shop
 * @version 1.0
 */
@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);

    /** 管理员数据访问层 */
    @Autowired
    private AdminMapper adminMapper;

    /**
     * 管理员登录验证
     * 
     * @param username 用户名
     * @param password 密码
     * @return 登录成功返回管理员对象
     * @throws RuntimeException 用户名或密码错误时抛出异常
     */
    @Override
    public Admin login(String username, String password) {
        logger.debug("管理员登录: {}", username);
        Admin admin = adminMapper.findByUsernameAndPassword(username, password);
        if (admin == null) {
            logger.warn("管理员登录失败，用户名或密码错误: {}", username);
            throw new RuntimeException("用户名或密码不正确");
        }
        logger.info("管理员登录成功: {}", username);
        return admin;
    }
}
