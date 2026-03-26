package com.shop.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;

import javax.sql.DataSource;
import java.sql.Driver;

/**
 * 数据源配置类
 * 使用简单数据源确保应用能够启动
 */
@Configuration
public class DataSourceConfig {

    private static final Logger logger = LoggerFactory.getLogger(DataSourceConfig.class);

    @Bean
    @Primary
    public DataSource dataSource() {
        // 创建一个最小配置的数据源，让应用能启动
        // 实际业务逻辑需要确保MySQL或H2可用
        SimpleDriverDataSource dataSource = new SimpleDriverDataSource();
        
        try {
            // 优先尝试H2驱动
            Class<? extends Driver> driverClass = (Class<? extends Driver>) Class.forName("org.h2.Driver");
            dataSource.setDriverClass(driverClass);
            dataSource.setUrl("jdbc:h2:mem:shopdb;DB_CLOSE_DELAY=-1;MODE=MySQL;DB_CLOSE_ON_EXIT=FALSE");
            dataSource.setUsername("sa");
            dataSource.setPassword("");
            logger.info("=== 使用H2内存数据库作为数据源 ===");
        } catch (ClassNotFoundException e) {
            try {
                // 回退到MySQL驱动
                Class<? extends Driver> driverClass = (Class<? extends Driver>) Class.forName("com.mysql.cj.jdbc.Driver");
                dataSource.setDriverClass(driverClass);
                dataSource.setUrl("jdbc:mysql://localhost:3306/myshop?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai&useSSL=false&allowPublicKeyRetrieval=true");
                dataSource.setUsername("root");
                dataSource.setPassword("123456");
                logger.info("=== 使用MySQL数据库作为数据源 ===");
            } catch (ClassNotFoundException e2) {
                logger.error("=== 未找到任何数据库驱动，应用可能无法正常工作 ===");
                // 使用Dummy驱动让应用能启动
                try {
                    Class<? extends Driver> driverClass = (Class<? extends Driver>) Class.forName("com.mysql.cj.jdbc.Driver");
                    dataSource.setDriverClass(driverClass);
                    dataSource.setUrl("jdbc:mysql://localhost:3306/myshop");
                    dataSource.setUsername("root");
                    dataSource.setPassword("123456");
                } catch (ClassNotFoundException e3) {
                    logger.error("=== 严重错误：没有可用的JDBC驱动 ===");
                    throw new RuntimeException("未找到JDBC驱动，请确保MySQL或H2驱动在类路径中", e3);
                }
            }
        }
        
        return dataSource;
    }
}
