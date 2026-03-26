package com.shop.controller;

import com.shop.entity.Product;
import com.shop.entity.Sorder;
import com.shop.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * 购物车控制器
 * 处理购物车相关请求，包括添加商品、删除商品、清空购物车等
 * 
 * @author shop
 */
@Controller
@RequestMapping("/sorder")
public class CartController {

    private static final Logger logger = LoggerFactory.getLogger(CartController.class);

    @Autowired
    private ProductService productService;

    /**
     * 添加商品到购物车
     * 
     * @param pid 商品ID
     * @param num 购买数量
     * @param session HttpSession
     * @return 重定向到购物车页面
     */
    @GetMapping("/addCart")
    public String addCart(@RequestParam("pid") Integer pid,
                          @RequestParam(value = "num", defaultValue = "1") Integer num,
                          HttpSession session) {
        logger.info("添加商品到购物车，商品ID: {}, 数量: {}", pid, num);

        // 从Session获取购物车
        List<Sorder> cart = getCartFromSession(session);

        // 查询商品信息
        Product product = productService.findById(pid);
        if (product == null) {
            logger.warn("商品不存在: {}", pid);
            return "redirect:/cart.jsp";
        }

        // 检查购物车中是否已存在该商品
        boolean exists = false;
        for (Sorder sorder : cart) {
            if (sorder.getPid() != null && sorder.getPid().equals(pid)) {
                // 商品已存在，增加数量
                sorder.setNumber(sorder.getNumber() + num);
                exists = true;
                logger.debug("购物车中已存在该商品，更新数量: {}", sorder.getNumber());
                break;
            }
        }

        if (!exists) {
            // 商品不存在，添加新项
            Sorder sorder = new Sorder();
            sorder.setSid(generateSid(cart)); // 生成临时ID
            sorder.setPid(pid);
            sorder.setName(product.getPname());
            sorder.setPrice(product.getSprice());
            sorder.setNumber(num);
            sorder.setProduct(product);
            cart.add(sorder);
            logger.debug("添加新商品到购物车: {}", product.getPname());
        }

        // 更新Session中的购物车
        session.setAttribute("cart", cart);
        logger.info("购物车更新成功，当前商品数量: {}", cart.size());

        return "redirect:/cart.jsp";
    }

    /**
     * 从购物车删除商品
     * 
     * @param sid 订单项临时ID
     * @param session HttpSession
     * @return 重定向到购物车页面
     */
    @GetMapping("/removeCart")
    public String removeCart(@RequestParam("sid") Integer sid, HttpSession session) {
        logger.info("从购物车删除商品，订单项ID: {}", sid);

        List<Sorder> cart = getCartFromSession(session);
        cart.removeIf(sorder -> sorder.getSid() != null && sorder.getSid().equals(sid));

        session.setAttribute("cart", cart);
        logger.info("删除成功，购物车剩余商品数量: {}", cart.size());

        return "redirect:/cart.jsp";
    }

    /**
     * 清空购物车
     * 
     * @param session HttpSession
     * @return 重定向到购物车页面
     */
    @GetMapping("/clearCart")
    public String clearCart(HttpSession session) {
        logger.info("清空购物车");
        session.removeAttribute("cart");
        return "redirect:/cart.jsp";
    }

    /**
     * 从Session获取购物车，如果不存在则创建新的
     */
    @SuppressWarnings("unchecked")
    private List<Sorder> getCartFromSession(HttpSession session) {
        Object cartObj = session.getAttribute("cart");
        if (cartObj == null) {
            logger.debug("购物车不存在，创建新购物车");
            return new ArrayList<>();
        }
        try {
            return (List<Sorder>) cartObj;
        } catch (ClassCastException e) {
            logger.error("购物车数据类型错误，创建新购物车", e);
            return new ArrayList<>();
        }
    }

    /**
     * 生成临时的订单项ID（用于Session中的购物车）
     */
    private Integer generateSid(List<Sorder> cart) {
        if (cart.isEmpty()) {
            return 1;
        }
        int max = 0;
        for (Sorder sorder : cart) {
            if (sorder.getSid() != null && sorder.getSid() > max) {
                max = sorder.getSid();
            }
        }
        return max + 1;
    }
}
