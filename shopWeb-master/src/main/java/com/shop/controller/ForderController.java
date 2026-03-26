package com.shop.controller;

import com.shop.entity.Forder;
import com.shop.service.ForderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 订单控制器
 * 处理前台订单提交请求
 * 
 * @author shop
 * @date 2024-03-24
 */
@Controller
@RequestMapping("/forder")
public class ForderController {

    private static final Logger logger = LoggerFactory.getLogger(ForderController.class);

    @Autowired
    private ForderService forderService;

    /**
     * 跳转到订单页面
     * 
     * @return 重定向到订单确认页面
     */
    @GetMapping("/order")
    public String toOrder() {
        return "redirect:/order.jsp";
    }

    /**
     * 提交订单
     * 处理用户提交的订单信息，将购物车中的商品生成正式订单
     * 
     * @param forder 订单信息（包含收货人姓名、电话、地址等）
     * @param session HTTP会话
     * @param request HTTP请求
     * @return 跳转到消息提示页面
     */
    @PostMapping("/order")
    public String order(Forder forder, HttpSession session, HttpServletRequest request) {
        logger.info("提交订单: {}", forder.getName());

        // 获取购物车中的订单信息
        Forder sessionForder = (Forder) session.getAttribute("forder");

        // 检查购物车是否为空
        if (sessionForder == null || sessionForder.getSorderSet() == null || sessionForder.getSorderSet().isEmpty()) {
            logger.warn("购物车为空，无法提交订单");
            request.setAttribute("msg", "购物车为空，无法提交订单");
            return "forward:/msg.jsp";
        }

        try {
            // 设置订单总金额
            forder.setTotal(sessionForder.getTotal());
            
            // 保存订单
            int count = forderService.insertOrder(forder, sessionForder);
            logger.info("订单提交成功，订单ID: {}", forder.getFid());

            request.setAttribute("msg", "提交订单成功");
            // 清空购物车
            session.removeAttribute("forder");

        } catch (Exception e) {
            logger.error("订单提交失败", e);
            request.setAttribute("msg", "商品数量不足或系统错误");
            return "forward:/msg.jsp";
        }

        return "forward:/msg.jsp";
    }
}
