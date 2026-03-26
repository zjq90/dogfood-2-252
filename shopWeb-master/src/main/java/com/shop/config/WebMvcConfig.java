package com.shop.config;

import com.shop.interceptor.AdminInterceptor;
import com.shop.interceptor.OrderInterceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Spring MVC配置类
 * 用于配置拦截器、静态资源映射等
 * 
 * @author shop
 * @version 1.0
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    private static final Logger logger = LoggerFactory.getLogger(WebMvcConfig.class);

    @Value("${file.upload.path}")
    private String uploadPath;

    /**
     * 添加拦截器配置
     * 配置后台管理拦截器和订单拦截器
     * 
     * @param registry 拦截器注册器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        logger.info("配置拦截器...");

        registry.addInterceptor(new AdminInterceptor())
                .addPathPatterns("/admin/**")
                .excludePathPatterns("/admin/login", "/admin/logout", "/error");

        registry.addInterceptor(new OrderInterceptor())
                .addPathPatterns("/forder/**")
                .excludePathPatterns("/error");

        logger.info("拦截器配置完成");
    }

    /**
     * 添加静态资源映射
     * 配置上传文件目录和静态资源的访问路径
     * 
     * @param registry 资源处理注册器
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        logger.info("配置静态资源映射...");

        registry.addResourceHandler("/upload/**")
                .addResourceLocations("file:" + uploadPath);

        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");

        registry.addResourceHandler("/css/**")
                .addResourceLocations("classpath:/static/css/");

        registry.addResourceHandler("/js/**")
                .addResourceLocations("classpath:/static/js/");

        registry.addResourceHandler("/image/**")
                .addResourceLocations("classpath:/static/image/");

        registry.addResourceHandler("/images/**")
                .addResourceLocations("classpath:/static/images/");

        registry.addResourceHandler("/bank_img/**")
                .addResourceLocations("classpath:/static/bank_img/");

        logger.info("静态资源映射配置完成，上传目录: {}", uploadPath);
    }
}
