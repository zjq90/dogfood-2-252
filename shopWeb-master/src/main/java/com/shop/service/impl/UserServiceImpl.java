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
 * 实现用户相关的业务逻辑
 * 
 * @author shop
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserMapper userMapper;

    @Override
    public int checkUsername(String username) {
        logger.debug("检查用户名是否存在: {}", username);
        return userMapper.checkUsername(username);
    }

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

    @Override
    public User findByUsername(String username) {
        logger.debug("根据用户名查询用户: {}", username);
        return userMapper.findByUsername(username);
    }

    @Override
    public int addUser(User user) {
        logger.debug("添加新用户: {}", user.getUsername());
        int result = userMapper.insertSelective(user);
        logger.info("用户添加成功: {}", user.getUsername());
        return result;
    }
}
