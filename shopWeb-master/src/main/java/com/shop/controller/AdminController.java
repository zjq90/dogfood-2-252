package com.shop.controller;

import com.shop.entity.Admin;
import com.shop.service.AdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * 管理员控制器
 * 处理后台管理员登录、登出等请求
 * 
 * @author shop
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    private AdminService adminService;

    /**
     * 后台首页
     */
    @GetMapping("/index")
    public String index(HttpSession session) {
        if (session.getAttribute("loginAdmin") == null) {
            session.setAttribute("msg", "管理员还没有登录");
            return "redirect:/admin/login.jsp";
        }
        return "admin/index";
    }

    /**
     * 跳转到登录页面
     */
    @GetMapping("/login")
    public String toLogin() {
        return "forward:/admin/login.jsp";
    }

    /**
     * 管理员登录
     */
    @PostMapping("/login")
    public String login(Admin admin, HttpSession session) {
        logger.info("管理员登录请求: {}", admin.getUsername());
        try {
            Admin existAdmin = adminService.login(admin.getUsername(), admin.getPassword());
            session.setAttribute("loginAdmin", existAdmin);
            session.removeAttribute("msg");
            logger.info("管理员登录成功: {}", existAdmin.getUsername());
            return "redirect:/admin/index";
        } catch (Exception e) {
            logger.error("管理员登录失败: {}", admin.getUsername(), e);
            session.setAttribute("msg", "用户名或密码错误");
        }
        return "forward:/admin/login.jsp";
    }

    /**
     * 管理员登出
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        Admin loginAdmin = (Admin) session.getAttribute("loginAdmin");
        if (loginAdmin != null) {
            logger.info("管理员登出: {}", loginAdmin.getUsername());
            session.removeAttribute("loginAdmin");
        }
        return "redirect:/admin/login.jsp";
    }
}
