package com.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 页面控制器
 * 处理静态页面跳转，不依赖数据库连接
 * 确保即使数据库连接失败也能访问登录注册等页面
 * 
 * @author shop
 */
@Controller
@RequestMapping("/page")
public class PageController {

    private static final Logger logger = LoggerFactory.getLogger(PageController.class);

    /**
     * 跳转到登录页面
     */
    @GetMapping("/login")
    public String toLogin() {
        logger.debug("跳转到登录页面");
        return "forward:/login.jsp";
    }

    /**
     * 跳转到注册页面
     */
    @GetMapping("/register")
    public String toRegister() {
        logger.debug("跳转到注册页面");
        return "forward:/register.jsp";
    }

    /**
     * 跳转到管理员登录页面
     */
    @GetMapping("/admin/login")
    public String toAdminLogin() {
        logger.debug("跳转到管理员登录页面");
        return "forward:/admin/login.jsp";
    }
}
