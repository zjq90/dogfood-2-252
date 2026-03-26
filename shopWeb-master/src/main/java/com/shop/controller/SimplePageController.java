package com.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Simple Page Controller
 * Handle login and register page access without requiring database connection
 */
@Controller
public class SimplePageController {

    private static final Logger logger = LoggerFactory.getLogger(SimplePageController.class);

    /**
     * Direct access to login page
     */
    @GetMapping("/login")
    public String login() {
        logger.debug("Accessing login page directly");
        return "forward:/login.jsp";
    }

    /**
     * Direct access to register page
     */
    @GetMapping("/register")
    public String register() {
        return "forward:/register.jsp";
    }

    /**
     * Direct access to admin login page
     */
    @GetMapping("/adminlogin")
    public String adminLogin() {
        return "forward:/admin/login.jsp";
    }
}
