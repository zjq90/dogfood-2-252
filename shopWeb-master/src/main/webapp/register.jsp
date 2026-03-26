<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户注册 - 商城系统</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/">
                    <img src="${pageContext.request.contextPath}/image/logo.gif" alt="商城Logo">
                </a>
            </div>
        </div>
        
        <div class="content">
            <div class="login-box">
                <h2>用户注册</h2>
                <form action="${pageContext.request.contextPath}/user/register" method="post">
                    <div class="form-item">
                        <label for="username">用户名：</label>
                        <input type="text" id="username" name="username" required placeholder="请输入用户名">
                    </div>
                    <div class="form-item">
                        <label for="password">密码：</label>
                        <input type="password" id="password" name="password" required placeholder="请输入密码">
                    </div>
                    <div class="form-item">
                        <label for="realname">真实姓名：</label>
                        <input type="text" id="realname" name="realname" placeholder="请输入真实姓名">
                    </div>
                    <div class="form-item">
                        <label for="email">邮箱：</label>
                        <input type="email" id="email" name="email" placeholder="请输入邮箱">
                    </div>
                    <div class="form-item">
                        <label for="phone">电话：</label>
                        <input type="text" id="phone" name="phone" placeholder="请输入电话">
                    </div>
                    <div class="form-item">
                        <label for="addr">地址：</label>
                        <input type="text" id="addr" name="addr" placeholder="请输入收货地址">
                    </div>
                    <c:if test="${not empty msg}">
                        <div class="error-msg">${msg}</div>
                    </c:if>
                    <div class="form-item">
                        <button type="submit" class="btn-login">注册</button>
                    </div>
                    <div class="form-links">
                        <a href="${pageContext.request.contextPath}/login.jsp">已有账号？立即登录</a>
                        <a href="${pageContext.request.contextPath}/">返回首页</a>
                    </div>
                </form>
            </div>
        </div>
        
        <div class="footer">
            <p>&copy; 2024 商城系统 版权所有</p>
        </div>
    </div>
</body>
</html>
