<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理中心 - 电商商城</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/left.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
</head>
<body>
    <!-- 头部 -->
    <div id="header">
        <div class="header_title">
            <h1>电商商城后台管理系统</h1>
        </div>
        <div class="header_info">
            <span>欢迎您，${sessionScope.loginAdmin.username}</span>
            <a href="${pageContext.request.contextPath}/admin/logout">退出登录</a>
            <a href="${pageContext.request.contextPath}/" target="_blank">前台首页</a>
        </div>
    </div>

    <!-- 主体 -->
    <div id="main">
        <!-- 左侧菜单 -->
        <div id="left">
            <div class="menu_title">
                <h3>管理菜单</h3>
            </div>
            <ul class="menu_list">
                <li>
                    <a href="javascript:void(0)" class="menu_parent">商品管理</a>
                    <ul class="menu_child">
                        <li><a href="${pageContext.request.contextPath}/product/list" target="mainFrame">商品列表</a></li>
                        <li><a href="${pageContext.request.contextPath}/product/add" target="mainFrame">添加商品</a></li>
                    </ul>
                </li>
                <li>
                    <a href="javascript:void(0)" class="menu_parent">订单管理</a>
                    <ul class="menu_child">
                        <li><a href="${pageContext.request.contextPath}/forder/list" target="mainFrame">订单列表</a></li>
                    </ul>
                </li>
                <li>
                    <a href="javascript:void(0)" class="menu_parent">用户管理</a>
                    <ul class="menu_child">
                        <li><a href="${pageContext.request.contextPath}/user/list" target="mainFrame">用户列表</a></li>
                    </ul>
                </li>
                <li>
                    <a href="javascript:void(0)" class="menu_parent">管理员管理</a>
                    <ul class="menu_child">
                        <li><a href="${pageContext.request.contextPath}/admin/list" target="mainFrame">管理员列表</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/toAdd" target="mainFrame">添加管理员</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <!-- 右侧内容区 -->
        <div id="right">
            <iframe name="mainFrame" src="${pageContext.request.contextPath}/product/list" width="100%" height="100%" frameborder="0"></iframe>
        </div>
    </div>

    <script type="text/javascript">
        $(function() {
            // 菜单折叠效果
            $('.menu_parent').click(function() {
                $(this).toggleClass('open');
                $(this).next('.menu_child').slideToggle();
            });
            // 默认展开第一个菜单
            $('.menu_parent:first').addClass('open');
            $('.menu_child:first').show();
        });
    </script>
</body>
</html>