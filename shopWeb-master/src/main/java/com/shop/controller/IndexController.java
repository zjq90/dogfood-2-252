package com.shop.controller;

import com.shop.entity.Product;
import com.shop.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 首页控制器
 * 处理首页相关请求，加载商品数据等
 * 
 * @author shop
 */
@Controller
@RequestMapping("/")
public class IndexController {

    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

    @Autowired
    private ProductService productService;

    /**
     * 网站首页
     * 加载热门商品和最新商品数据
     * 
     * @param model 数据模型
     * @return 首页视图
     */
    @GetMapping("/")
    public String index(Model model) {
        logger.debug("访问首页，加载商品数据");
        
        // 加载热门商品
        List<Product> hotProducts = productService.frontlistHot();
        model.addAttribute("hotProducts", hotProducts);
        logger.debug("加载热门商品数量: {}", hotProducts != null ? hotProducts.size() : 0);
        
        // 加载最新商品
        List<Product> newProducts = productService.frontlistNew();
        model.addAttribute("newProducts", newProducts);
        logger.debug("加载最新商品数量: {}", newProducts != null ? newProducts.size() : 0);
        
        return "forward:/index.jsp";
    }
}
