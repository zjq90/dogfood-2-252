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
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 * 用户控制器
 * 处理前台用户注册、登录、登出等请求
 * 
 * @author shop
 * @date 2024-03-24
 */
@Controller
@RequestMapping("/user")
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    /**
     * 跳转到注册页面
     * 显示用户注册表单
     * 
     * @return 注册页面
     */
    @GetMapping("/register")
    public String toRegister() {
        return "register";
    }

    /**
     * 用户注册
     * 处理用户注册请求，验证用户名是否已存在
     * 
     * @param user 用户信息（包含用户名、密码、真实姓名、邮箱、电话、地址等）
     * @param session HTTP会话
     * @return 重定向到登录页面或注册页面
     */
    @PostMapping("/register")
    public String register(User user, HttpSession session) {
        logger.info("用户注册请求: {}", user.getUsername());
        
        // 检查用户名是否已存在
        if (userService.checkUsername(user.getUsername()) > 0) {
            logger.warn("用户名已存在: {}", user.getUsername());
            session.setAttribute("msg", "用户名已存在");
            return "redirect:/register.jsp";
        }

        // 注册用户
        int count = userService.insertUser(user);
        if (count > 0) {
            logger.info("用户注册成功: {}", user.getUsername());
            session.setAttribute("msg", "注册成功，请登录");
            return "redirect:/login.jsp";
        } else {
            logger.error("用户注册失败: {}", user.getUsername());
            session.setAttribute("msg", "注册失败");
            return "redirect:/register.jsp";
        }
    }

    /**
     * 跳转到登录页面
     * 显示用户登录表单
     * 
     * @return 登录页面
     */
    @GetMapping("/login")
    public String toLogin() {
        return "login";
    }

    /**
     * 用户登录
     * 验证用户用户名和密码，登录成功后跳转到首页
     * 
     * @param username 用户名
     * @param password 密码
     * @param session HTTP会话
     * @return 重定向到首页或登录页面
     */
    @PostMapping("/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        HttpSession session) {
        logger.info("用户登录请求: {}", username);
        
        User user = userService.login(username, password);
        if (user != null) {
            session.setAttribute("user", user);
            session.setAttribute("username", user.getUsername());
            logger.info("用户登录成功: {}", username);
            return "redirect:/";
        } else {
            logger.warn("用户登录失败: {}", username);
            session.setAttribute("msg", "用户名或密码错误");
            return "redirect:/login.jsp";
        }
    }

    /**
     * 用户登出
     * 清除用户登录状态，返回首页
     * 
     * @param session HTTP会话
     * @return 重定向到首页
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        String username = (String) session.getAttribute("username");
        logger.info("用户登出: {}", username);
        session.removeAttribute("user");
        session.removeAttribute("username");
        return "redirect:/";
    }
}
