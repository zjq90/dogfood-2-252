<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户注册 - 电商商城</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
</head>
<body>
    <div class="register_wrapper">
        <div class="register_box">
            <div class="register_title">
                <h2>用户注册</h2>
            </div>
            <div class="register_form">
                <form action="${pageContext.request.contextPath}/user/register" method="post" id="registerForm">
                    <div class="form_item">
                        <label>用户名：</label>
                        <input type="text" name="username" id="username" placeholder="请输入用户名" required>
                    </div>
                    <div class="form_item">
                        <label>密码：</label>
                        <input type="password" name="password" id="password" placeholder="请输入密码" required>
                    </div>
                    <div class="form_item">
                        <label>确认密码：</label>
                        <input type="password" name="repassword" id="repassword" placeholder="请再次输入密码" required>
                    </div>
                    <div class="form_item">
                        <label>真实姓名：</label>
                        <input type="text" name="realname" id="realname" placeholder="请输入真实姓名">
                    </div>
                    <div class="form_item">
                        <label>邮箱：</label>
                        <input type="email" name="email" id="email" placeholder="请输入邮箱">
                    </div>
                    <div class="form_item">
                        <label>手机号：</label>
                        <input type="tel" name="phone" id="phone" placeholder="请输入手机号">
                    </div>
                    <div class="form_item">
                        <label>地址：</label>
                        <input type="text" name="addr" id="addr" placeholder="请输入收货地址">
                    </div>
                    <div class="form_item">
                        <button type="submit" class="register_btn">注 册</button>
                    </div>
                    <div class="form_item">
                        <span class="error_msg">${msg}</span>
                    </div>
                    <div class="form_item">
                        <a href="${pageContext.request.contextPath}/login.jsp" class="login_link">已有账号？立即登录</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(function() {
            $('#registerForm').submit(function() {
                var username = $('#username').val();
                var password = $('#password').val();
                var repassword = $('#repassword').val();
                
                if (!username || username.trim() == '') {
                    alert('请输入用户名');
                    return false;
                }
                if (!password || password.trim() == '') {
                    alert('请输入密码');
                    return false;
                }
                if (password != repassword) {
                    alert('两次输入的密码不一致');
                    return false;
                }
                return true;
            });
        });
    </script>
</body>
</html>