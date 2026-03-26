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
 * 提供用户登录验证、注册等业务逻辑实现
 * 
 * @author shop
 * @version 1.0
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    /** 用户数据访问层 */
    @Autowired
    private UserMapper userMapper;

    /**
     * 检查用户名是否已存在
     * 
     * @param username 用户名
     * @return 存在返回大于0的数字，不存在返回0
     */
    @Override
    public int checkUsername(String username) {
        logger.debug("检查用户名是否存在: {}", username);
        return userMapper.checkUsername(username);
    }

    /**
     * 用户登录验证
     * 
     * @param username 用户名
     * @param password 密码
     * @return 登录成功返回用户对象
     * @throws RuntimeException 用户名或密码错误时抛出异常
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
     * 
     * @param user 用户信息
     * @return 注册成功返回影响行数
     * @throws RuntimeException 用户名已存在时抛出异常
     */
    @Override
    public int register(User user) {
        logger.debug("用户注册: {}", user.getUsername());
        
        int count = userMapper.checkUsername(user.getUsername());
        if (count > 0) {
            logger.warn("用户名已存在: {}", user.getUsername());
            throw new RuntimeException("用户名已存在，请更换用户名");
        }
        
        int result = userMapper.save(user);
        if (result > 0) {
            logger.info("用户注册成功: {}", user.getUsername());
        } else {
            logger.error("用户注册失败: {}", user.getUsername());
        }
        return result;
    }
}
