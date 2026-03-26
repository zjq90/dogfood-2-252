package com.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 全局错误控制器
 * 处理应用中的错误请求
 * 
 * @author shop
 */
@Controller
public class GlobalErrorController implements ErrorController {

    private static final Logger logger = LoggerFactory.getLogger(GlobalErrorController.class);

    private static final String ERROR_PATH = "/error";

    /**
     * 处理错误请求
     */
    @RequestMapping(ERROR_PATH)
    public String handleError(HttpServletRequest request, Model model) {
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        Exception exception = (Exception) request.getAttribute("javax.servlet.error.exception");
        
        logger.error("请求发生错误，状态码：{}，异常：{}", statusCode, exception != null ? exception.getMessage() : "无");
        
        String errorMessage = "服务器发生错误，请稍后再试";
        
        if (statusCode != null) {
            switch (statusCode) {
                case 404:
                    errorMessage = "您访问的页面不存在";
                    break;
                case 500:
                    errorMessage = "服务器内部错误";
                    break;
                case 403:
                    errorMessage = "您没有权限访问该页面";
                    break;
                case 401:
                    errorMessage = "请先登录后再访问";
                    break;
                default:
                    errorMessage = "发生错误，状态码：" + statusCode;
            }
        }
        
        model.addAttribute("message", errorMessage);
        model.addAttribute("exception", exception);
        
        return "forward:/error.jsp";
    }
}
