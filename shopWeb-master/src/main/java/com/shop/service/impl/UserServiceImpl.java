package com.shop.service.impl;

import com.shop.entity.User;
import com.shop.mapper.UserMapper;
import com.shop.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 用户服务实现类
 * 实现用户相关的业务逻辑操作
 * 
 * @author shop
 * @date 2024-03-24
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserMapper userMapper;

    /**
     * 检查用户名是否已存在
     * 
     * @param username 用户名
     * @return 存在返回大于0的数，不存在返回0
     */
    @Override
    public int checkUsername(String username) {
        logger.debug("检查用户名是否存在: {}", username);
        return userMapper.checkUsername(username);
    }

    /**
     * 用户登录
     * 验证用户名和密码，登录成功返回用户信息
     * 
     * @param username 用户名
     * @param password 密码
     * @return 用户信息
     * @throws RuntimeException 用户名或密码错误时抛出
     */
    @Override
    public User login(String username, String password) {
        logger.debug("用户登录: {}", username);
        User user = userMapper.findByUsernameAndPassword(username, password);
        if (user == null) {
            logger.warn("用户登录失败，用户名或密码错误: {}", username);
            throw new RuntimeException("用户名或密码不正确");
        }
        logger.info("用户登录成功: {}", username);
        return user;
    }

    /**
     * 用户注册
     * 将新用户信息保存到数据库
     * 
     * @param user 用户信息
     * @return 影响的行数
     */
    @Override
    public int insertUser(User user) {
        logger.debug("用户注册: {}", user.getUsername());
        int result = userMapper.insertSelective(user);
        logger.info("用户注册成功，ID: {}", user.getUid());
        return result;
    }
}
