<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户登录 - 电商商城</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
</head>
<body>
    <div class="login_wrapper">
        <div class="login_box">
            <div class="login_title">
                <h2>用户登录</h2>
            </div>
            <div class="login_form">
                <form action="${pageContext.request.contextPath}/user/login" method="post" id="loginForm">
                    <div class="form_item">
                        <label>用户名：</label>
                        <input type="text" name="username" id="username" placeholder="请输入用户名" required>
                    </div>
                    <div class="form_item">
                        <label>密码：</label>
                        <input type="password" name="password" id="password" placeholder="请输入密码" required>
                    </div>
                    <div class="form_item">
                        <button type="submit" class="login_btn">登 录</button>
                    </div>
                    <div class="form_item">
                        <span class="error_msg">${msg}</span>
                    </div>
                    <div class="form_item">
                        <a href="${pageContext.request.contextPath}/register.jsp" class="register_link">没有账号？立即注册</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(function() {
            $('#loginForm').submit(function() {
                var username = $('#username').val();
                var password = $('#password').val();
                if (!username || username.trim() == '') {
                    alert('请输入用户名');
                    return false;
                }
                if (!password || password.trim() == '') {
                    alert('请输入密码');
                    return false;
                }
                return true;
            });
        });
    </script>
</body>
</html>