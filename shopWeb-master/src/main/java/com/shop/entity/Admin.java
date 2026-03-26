package com.shop.entity;

import java.io.Serializable;

/**
 * 管理员实体类
 * 对应数据库表 zk_admin
 * 存储后台管理员的登录信息
 * 
 * @author shop
 * @version 1.0
 */
public class Admin implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 管理员ID，主键自增 */
    private Integer aid;
    
    /** 管理员用户名 */
    private String username;
    
    /** 管理员密码 */
    private String password;

    /**
     * 无参构造函数
     */
    public Admin() {
    }

    /**
     * 全参构造函数
     * @param aid 管理员ID
     * @param username 用户名
     * @param password 密码
     */
    public Admin(Integer aid, String username, String password) {
        this.aid = aid;
        this.username = username;
        this.password = password;
    }

    /**
     * 获取管理员ID
     * @return 管理员ID
     */
    public Integer getAid() {
        return aid;
    }

    /**
     * 设置管理员ID
     * @param aid 管理员ID
     */
    public void setAid(Integer aid) {
        this.aid = aid;
    }

    /**
     * 获取用户名
     * @return 用户名
     */
    public String getUsername() {
        return username;
    }

    /**
     * 设置用户名
     * @param username 用户名
     */
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    /**
     * 获取密码
     * @return 密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置密码
     * @param password 密码
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    /**
     * 返回管理员对象的字符串表示
     * @return 管理员信息字符串
     */
    @Override
    public String toString() {
        return "Admin{" +
                "aid=" + aid +
                ", username='" + username + '\'' +
                '}';
    }
}
