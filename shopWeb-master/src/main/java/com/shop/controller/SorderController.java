package com.shop.controller;

import com.shop.entity.Forder;
import com.shop.entity.Product;
import com.shop.entity.Sorder;
import com.shop.service.ForderService;
import com.shop.service.ProductService;
import com.shop.service.SorderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * 购物车控制器
 * 处理购物车相关请求，包括添加商品、删除商品、清空购物车等操作
 * 
 * @author shop
 * @date 2024-03-24
 */
@Controller
@RequestMapping("/sorder")
public class SorderController {

    private static final Logger logger = LoggerFactory.getLogger(SorderController.class);

    @Autowired
    private SorderService sorderService;

    @Autowired
    private ProductService productService;

    @Autowired
    private ForderService forderService;

    /**
     * 添加商品到购物车
     * 将指定商品添加到当前用户的购物车中
     * 
     * @param product 商品信息（包含商品ID和数量）
     * @param session HTTP会话
     * @return 重定向到购物车页面
     */
    @PostMapping("/add")
    public String addSorder(Product product, HttpSession session) {
        logger.info("添加商品到购物车: {}", product.getPid());

        // 查询商品详细信息
        Product findProduct = productService.findById(product.getPid());
        if (findProduct == null) {
            logger.warn("商品不存在: {}", product.getPid());
            return "redirect:/product/frontlist";
        }
        
        // 设置购买数量
        findProduct.setNumber(product.getNumber());

        // 初始化购物车
        if (session.getAttribute("forder") == null) {
            session.setAttribute("forder", new Forder(new HashSet<>()));
        }

        // 添加商品到购物车
        Forder forder = (Forder) session.getAttribute("forder");
        forder = sorderService.addSorder(forder, findProduct);
        forder.setTotal(forderService.calculateTotal(forder));

        logger.debug("购物车商品数量: {}", forder.getSorderSet().size());
        return "redirect:/car.jsp";
    }

    /**
     * 从购物车删除商品
     * 根据商品ID从购物车中移除指定商品
     * 
     * @param pid 商品ID
     * @param session HTTP会话
     * @return 重定向到购物车页面
     */
    @GetMapping("/delete")
    public String deleteSorder(@RequestParam("pid") Integer pid, HttpSession session) {
        logger.info("从购物车删除商品: {}", pid);

        Forder forder = (Forder) session.getAttribute("forder");
        if (forder == null) {
            return "redirect:/car.jsp";
        }

        Set<Sorder> set = forder.getSorderSet();
        Iterator<Sorder> iterator = set.iterator();

        while (iterator.hasNext()) {
            Sorder sorder = iterator.next();
            if (sorder.getPid().equals(pid)) {
                iterator.remove();
                forder.setTotal(forder.getTotal() - sorder.getPrice() * sorder.getNumber());
            }
        }

        // 如果购物车为空，移除session中的购物车
        if (set.size() <= 0) {
            session.removeAttribute("forder");
        }

        return "redirect:/car.jsp";
    }

    /**
     * 清空购物车
     * 移除购物车中的所有商品
     * 
     * @param session HTTP会话
     * @return 重定向到购物车页面
     */
    @GetMapping("/clear")
    public String clearSorder(HttpSession session) {
        logger.info("清空购物车");
        Forder forder = (Forder) session.getAttribute("forder");
        if (forder != null) {
            forder.getSorderSet().clear();
            forder.setTotal(0.0);
        }
        session.removeAttribute("forder");
        return "redirect:/car.jsp";
    }

    /**
     * 根据订单ID查询订单项列表
     * 用于后台查看订单详情
     * 
     * @param forder 订单信息（包含订单ID）
     * @param model 数据模型
     * @return 订单项列表页面
     */
    @GetMapping("/listbyfid")
    public String listSorder(Forder forder, Model model) {
        logger.debug("查看订单项，订单ID: {}", forder.getFid());
        List<Sorder> byFidListSorder = sorderService.listSorderByFid(forder.getFid());
        model.addAttribute("listSorder", byFidListSorder);
        return "sorder/list";
    }
}
