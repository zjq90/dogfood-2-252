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
 * 处理前台用户登录、登出、注册等请求
 * 
 * <p>功能说明：</p>
 * <ul>
 *   <li>用户登录验证</li>
 *   <li>用户登出操作</li>
 *   <li>用户注册功能</li>
 * </ul>
 * 
 * @author shop
 * @version 1.0
 */
@Controller
@RequestMapping("/user")
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    /** 用户服务接口 */
    @Autowired
    private UserService userService;

    /**
     * 跳转到登录页面
     * 
     * @return 重定向到登录页面
     */
    @GetMapping("/login")
    public String toLogin() {
        return "redirect:/login.jsp";
    }

    /**
     * 用户登录
     * 验证用户名和密码，成功则保存到会话中
     * 
     * @param user 用户对象（包含用户名和密码）
     * @param session HTTP会话对象
     * @return 登录成功重定向到商品列表，失败转发到登录页面
     */
    @PostMapping("/login")
    public String login(User user, HttpSession session) {
        logger.info("用户登录请求: {}", user.getUsername());
        try {
            User existUser = userService.login(user.getUsername(), user.getPassword());
            session.setAttribute("frontuser", existUser.getUsername());
            session.removeAttribute("msg");
            logger.info("用户登录成功: {}", existUser.getUsername());
            return "redirect:/product/frontlist";
        } catch (Exception e) {
            logger.error("用户登录失败: {}", user.getUsername(), e);
            session.setAttribute("msg", "用户或密码错误");
        }
        return "forward:/login.jsp";
    }

    /**
     * 用户登出
     * 清除会话中的用户信息
     * 
     * @param session HTTP会话对象
     * @return 重定向到登录页面
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        String username = (String) session.getAttribute("frontuser");
        logger.info("用户登出: {}", username);
        session.removeAttribute("frontuser");
        return "redirect:/login.jsp";
    }

    /**
     * 跳转到注册页面
     * 
     * @return 重定向到注册页面
     */
    @GetMapping("/register")
    public String toRegister() {
        return "redirect:/register.jsp";
    }

    /**
     * 用户注册
     * 验证用户名是否已存在，不存在则创建新用户
     * 
     * @param user 用户对象（包含注册信息）
     * @param session HTTP会话对象
     * @return 注册成功重定向到登录页面，失败转发到注册页面
     */
    @PostMapping("/register")
    public String register(User user, HttpSession session) {
        logger.info("用户注册请求: {}", user.getUsername());
        try {
            int result = userService.register(user);
            if (result > 0) {
                session.setAttribute("success", "注册成功，请登录");
                logger.info("用户注册成功: {}", user.getUsername());
                return "redirect:/login.jsp";
            } else {
                session.setAttribute("msg", "注册失败，请重试");
            }
        } catch (Exception e) {
            logger.error("用户注册失败: {}", user.getUsername(), e);
            session.setAttribute("msg", e.getMessage());
        }
        return "forward:/register.jsp";
    }
}
