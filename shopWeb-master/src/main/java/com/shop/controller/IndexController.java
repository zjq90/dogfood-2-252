package com.shop.controller;

import com.shop.entity.Product;
import com.shop.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/**
 * 首页控制器
 * 处理首页请求，展示热门商品和最新商品
 * 
 * @author shop
 * @date 2024-03-24
 */
@Controller
public class IndexController {

    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

    @Autowired
    private ProductService productService;

    /**
     * 首页
     * 展示热门商品和最新上架商品
     * 
     * @param model 数据模型
     * @return 首页视图
     */
    @GetMapping("/")
    public String index(Model model) {
        logger.debug("访问首页");
        
        // 查询热门商品
        List<Product> hotProducts = productService.findHotProducts();
        model.addAttribute("hotProducts", hotProducts);
        logger.debug("热门商品数量: {}", hotProducts.size());
        
        // 查询最新商品
        List<Product> newProducts = productService.findNewProducts();
        model.addAttribute("newProducts", newProducts);
        logger.debug("最新商品数量: {}", newProducts.size());
        
        return "index";
    }
}
