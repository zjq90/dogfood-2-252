package com.shop.controller;

import com.shop.entity.Forder;
import com.shop.entity.Sorder;
import com.shop.entity.User;
import com.shop.service.ForderService;
import com.shop.service.SorderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * 订单控制器
 * 处理订单相关请求，包括创建订单、查询订单列表等
 * 
 * @author shop
 */
@Controller
@RequestMapping("/forder")
public class OrderController {

    private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private ForderService forderService;

    @Autowired
    private SorderService sorderService;

    /**
     * 跳转到确认订单页面
     * 
     * @param session HttpSession
     * @return 订单确认页面
     */
    @GetMapping("/toAddOrder")
    public String toAddOrder(HttpSession session) {
        logger.debug("跳转到确认订单页面");
        
        // 检查用户是否登录
        User loginUser = (User) session.getAttribute("loginUser");
        if (loginUser == null) {
            session.setAttribute("msg", "请先登录");
            return "redirect:/login.jsp";
        }
        
        // 检查购物车是否为空
        @SuppressWarnings("unchecked")
        List<Sorder> cart = (List<Sorder>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            return "redirect:/cart.jsp";
        }
        
        return "order/addOrder";
    }

    /**
     * 提交订单
     * 
     * @param forder 订单信息
     * @param session HttpSession
     * @param model 数据模型
     * @return 结果页面
     */
    @PostMapping("/addOrder")
    public String addOrder(Forder forder, HttpSession session, Model model) {
        logger.info("提交订单，收货人: {}", forder.getName());
        
        // 检查用户是否登录
        User loginUser = (User) session.getAttribute("loginUser");
        if (loginUser == null) {
            session.setAttribute("msg", "请先登录");
            return "redirect:/login.jsp";
        }
        
        // 获取购物车
        @SuppressWarnings("unchecked")
        List<Sorder> cart = (List<Sorder>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            return "redirect:/cart.jsp";
        }
        
        try {
            // 设置订单其他信息
            forder.setUid(loginUser.getUid());
            forder.setDate(new Date());
            forder.setStatus(1); // 已支付状态（简化处理，实际应调用支付接口）
            
            // 计算订单总金额
            double total = 0.0;
            for (Sorder sorder : cart) {
                total += sorder.getPrice() * sorder.getNumber();
            }
            forder.setTotal(total);
            
            // 保存订单和订单项
            forderService.addOrder(forder, cart);
            
            // 清空购物车
            session.removeAttribute("cart");
            
            model.addAttribute("msg", "订单提交成功！订单号：" + forder.getFid());
            logger.info("订单提交成功，订单ID: {}", forder.getFid());
            
        } catch (Exception e) {
            logger.error("订单提交失败", e);
            model.addAttribute("msg", "订单提交失败：" + e.getMessage());
            return "order/addOrder";
        }
        
        return "forward:/WEB-INF/jsp/order/success.jsp";
    }

    /**
     * 后台订单列表
     * 
     * @param model 数据模型
     * @return 订单列表页面
     */
    @GetMapping("/list")
    public String list(Model model) {
        logger.debug("查询后台订单列表");
        List<Forder> list = forderService.listForder();
        model.addAttribute("list", list);
        return "order/list";
    }

    /**
     * 删除订单
     * 
     * @param fid 订单ID
     * @return 重定向到订单列表
     */
    @GetMapping("/delete")
    public String delete(Integer fid) {
        logger.info("删除订单: {}", fid);
        forderService.deleteForder(fid);
        return "redirect:/forder/list";
    }

    /**
     * 查看订单详情
     * 
     * @param fid 订单ID
     * @param model 数据模型
     * @return 订单详情页面
     */
    @GetMapping("/detail")
    public String detail(Integer fid, Model model) {
        logger.debug("查看订单详情: {}", fid);
        Forder forder = forderService.findById(fid);
        List<Sorder> sorderList = sorderService.listSorderByFid(fid);
        model.addAttribute("forder", forder);
        model.addAttribute("sorderList", sorderList);
        return "order/detail";
    }
}
