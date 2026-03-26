package com.shop.controller;

import com.shop.entity.User;
import com.shop.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * 用户控制器
 * 处理前台用户登录、登出等请求
 * 
 * @author shop
 */
@Controller
@RequestMapping("/user")
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    /**
     * 跳转到登录页面
     */
    @GetMapping("/login")
    public String toLogin() {
        return "redirect:/login.jsp";
    }

    /**
     * 用户登录
     */
    @PostMapping("/login")
    public String login(User user, HttpSession session) {
        logger.info("用户登录请求: {}", user.getUsername());
        try {
            User existUser = userService.login(user.getUsername(), user.getPassword());
            session.setAttribute("loginUser", existUser);
            session.removeAttribute("msg");
            logger.info("用户登录成功: {}", existUser.getUsername());
            return "redirect:/";
        } catch (Exception e) {
            logger.error("用户登录失败: {}", user.getUsername(), e);
            session.setAttribute("msg", "用户名或密码错误");
        }
        return "forward:/login.jsp";
    }

    /**
     * 用户登出
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        if (loginUser != null) {
            logger.info("用户登出: {}", loginUser.getUsername());
            session.removeAttribute("loginUser");
        }
        // 清空购物车
        session.removeAttribute("cart");
        return "redirect:/";
    }

    /**
     * 用户注册
     */
    @PostMapping("/register")
    public String register(User user, HttpSession session) {
        logger.info("用户注册请求: {}", user.getUsername());
        try {
            // 检查用户名是否已存在
            User existUser = userService.findByUsername(user.getUsername());
            if (existUser != null) {
                session.setAttribute("msg", "用户名已存在");
                return "forward:/register.jsp";
            }
            userService.addUser(user);
            logger.info("用户注册成功: {}", user.getUsername());
            session.setAttribute("msg", "注册成功，请登录");
            return "redirect:/login.jsp";
        } catch (Exception e) {
            logger.error("用户注册失败: {}", user.getUsername(), e);
            session.setAttribute("msg", "注册失败，请重试");
        }
        return "forward:/register.jsp";
    }
}
