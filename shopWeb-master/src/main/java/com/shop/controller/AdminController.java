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
 * <p>功能说明：</p>
 * <ul>
 *   <li>管理员登录验证</li>
 *   <li>管理员登出操作</li>
 *   <li>后台首页展示</li>
 * </ul>
 * 
 * @author shop
 * @version 1.0
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

    /** 管理员服务接口 */
    @Autowired
    private AdminService adminService;

    /**
     * 后台首页
     * 检查管理员是否已登录，未登录则跳转到登录页面
     * 
     * @param session HTTP会话对象
     * @return 已登录返回首页视图，未登录返回登录视图
     */
    @GetMapping("/")
    public String index(HttpSession session) {
        if (session.getAttribute("adminusername") == null) {
            session.setAttribute("msg", "用户还没有登录");
            return "login";
        }
        return "index";
    }

    /**
     * 跳转到登录页面
     * 
     * @return 登录页面视图名称
     */
    @GetMapping("/login")
    public String toLogin() {
        return "login";
    }

    /**
     * 管理员登录
     * 验证管理员用户名和密码，成功则保存到会话中
     * 
     * @param admin 管理员对象（包含用户名和密码）
     * @param session HTTP会话对象
     * @return 登录成功重定向到首页，失败重定向到登录页面
     */
    @PostMapping("/login")
    public String login(Admin admin, HttpSession session) {
        logger.info("管理员登录请求: {}", admin.getUsername());
        try {
            Admin existAdmin = adminService.login(admin.getUsername(), admin.getPassword());
            session.setAttribute("adminusername", existAdmin.getUsername());
            session.removeAttribute("msg");
            logger.info("管理员登录成功: {}", existAdmin.getUsername());
            return "redirect:/admin/";
        } catch (Exception e) {
            logger.error("管理员登录失败: {}", admin.getUsername(), e);
            session.setAttribute("msg", "用户或密码错误");
        }
        return "redirect:/admin/login";
    }

    /**
     * 管理员登出
     * 清除会话中的管理员信息
     * 
     * @param session HTTP会话对象
     * @return 重定向到登录页面
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        String username = (String) session.getAttribute("adminusername");
        logger.info("管理员登出: {}", username);
        session.removeAttribute("adminusername");
        return "redirect:/admin/login";
    }
}
