package com.shop.entity;

import java.io.Serializable;

/**
 * 用户实体类
 * 对应数据库表 zk_user
 * 存储前台用户的注册信息
 * 
 * @author shop
 * @version 1.0
 */
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 用户ID，主键自增 */
    private Integer uid;
    
    /** 用户名，登录账号 */
    private String username;
    
    /** 用户密码 */
    private String password;
    
    /** 真实姓名 */
    private String realname;
    
    /** 电子邮箱 */
    private String email;
    
    /** 联系电话 */
    private String phone;
    
    /** 收货地址 */
    private String addr;

    /**
     * 无参构造函数
     */
    public User() {
    }

    /**
     * 全参构造函数
     * @param uid 用户ID
     * @param username 用户名
     * @param password 密码
     * @param realname 真实姓名
     * @param email 电子邮箱
     * @param phone 联系电话
     * @param addr 收货地址
     */
    public User(Integer uid, String username, String password, String realname, String email, String phone, String addr) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.realname = realname;
        this.email = email;
        this.phone = phone;
        this.addr = addr;
    }

    /**
     * 获取用户ID
     * @return 用户ID
     */
    public Integer getUid() {
        return uid;
    }

    /**
     * 设置用户ID
     * @param uid 用户ID
     */
    public void setUid(Integer uid) {
        this.uid = uid;
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
     * 获取真实姓名
     * @return 真实姓名
     */
    public String getRealname() {
        return realname;
    }

    /**
     * 设置真实姓名
     * @param realname 真实姓名
     */
    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
    }

    /**
     * 获取电子邮箱
     * @return 电子邮箱
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置电子邮箱
     * @param email 电子邮箱
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    /**
     * 获取联系电话
     * @return 联系电话
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置联系电话
     * @param phone 联系电话
     */
    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    /**
     * 获取收货地址
     * @return 收货地址
     */
    public String getAddr() {
        return addr;
    }

    /**
     * 设置收货地址
     * @param addr 收货地址
     */
    public void setAddr(String addr) {
        this.addr = addr == null ? null : addr.trim();
    }

    /**
     * 返回用户对象的字符串表示
     * @return 用户信息字符串
     */
    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", realname='" + realname + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", addr='" + addr + '\'' +
                '}';
    }
}
