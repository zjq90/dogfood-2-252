<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理首页 - 商城系统</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
</head>
<body>
    <div class="admin-container">
        <!-- 顶部导航 -->
        <div class="admin-header">
            <div class="logo">商城后台管理系统</div>
            <div class="user-info">
                欢迎，${sessionScope.adminusername}！
                <a href="${pageContext.request.contextPath}/admin/logout">退出</a>
            </div>
        </div>
        
        <!-- 左侧菜单 -->
        <div class="admin-sidebar">
            <ul class="menu">
                <li class="active">
                    <a href="${pageContext.request.contextPath}/admin/">首页</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/product/list">商品管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/order/list">订单管理</a>
                </li>
            </ul>
        </div>
        
        <!-- 主内容区 -->
        <div class="admin-content">
            <div class="content-header">
                <h2>后台管理首页</h2>
            </div>
            <div class="content-body">
                <div class="dashboard">
                    <div class="dashboard-card">
                        <h3>商品管理</h3>
                        <p>管理商城商品信息，包括添加、编辑、删除商品</p>
                        <a href="${pageContext.request.contextPath}/product/list" class="btn">进入</a>
                    </div>
                    <div class="dashboard-card">
                        <h3>订单管理</h3>
                        <p>查看和处理用户订单，更新订单状态</p>
                        <a href="${pageContext.request.contextPath}/order/list" class="btn">进入</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
