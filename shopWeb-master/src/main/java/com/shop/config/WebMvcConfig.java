package com.shop.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Web MVC配置类
 * 配置静态资源映射，确保CSS、JS、图片等静态资源能够被正确访问
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    private static final Logger logger = LoggerFactory.getLogger(WebMvcConfig.class);

    /**
     * 配置静态资源映射
     * 添加对CSS、JS、图片等静态资源的访问支持
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        logger.info("=== 配置静态资源映射 ===");
        
        // 配置webapp下的静态资源
        registry.addResourceHandler("/css/**")
                .addResourceLocations("/css/", "classpath:/static/css/");
        
        registry.addResourceHandler("/js/**")
                .addResourceLocations("/js/", "classpath:/static/js/");
        
        registry.addResourceHandler("/image/**")
                .addResourceLocations("/image/", "classpath:/static/image/");
        
        registry.addResourceHandler("/images/**")
                .addResourceLocations("/images/", "classpath:/static/images/");
        
        registry.addResourceHandler("/lib/**")
                .addResourceLocations("/lib/", "classpath:/static/lib/");
        
        // 通用静态资源配置
        registry.addResourceHandler("/static/**")
                .addResourceLocations("/", "classpath:/static/");
    }
}
