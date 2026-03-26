<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>后台管理系统首页</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Microsoft YaHei', Arial, sans-serif;
            background: #f5f5f5;
        }
        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header h1 {
            font-size: 20px;
        }
        .header .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .header .user-info a {
            color: white;
            text-decoration: none;
            padding: 5px 15px;
            border: 1px solid white;
            border-radius: 3px;
        }
        .header .user-info a:hover {
            background: white;
            color: #667eea;
        }
        .container {
            display: flex;
            min-height: calc(100vh - 60px);
        }
        .sidebar {
            width: 200px;
            background: #34495e;
            padding: 20px 0;
        }
        .sidebar a {
            display: block;
            color: #ecf0f1;
            text-decoration: none;
            padding: 15px 25px;
            transition: all 0.3s;
        }
        .sidebar a:hover {
            background: #2c3e50;
            padding-left: 30px;
        }
        .sidebar a.active {
            background: #667eea;
        }
        .main-content {
            flex: 1;
            padding: 30px;
        }
        .welcome-box {
            background: white;
            padding: 40px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .welcome-box h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .welcome-box p {
            color: #666;
            margin-bottom: 10px;
        }
        .stats-container {
            display: flex;
            gap: 20px;
            margin-top: 30px;
        }
        .stat-card {
            flex: 1;
            background: white;
            padding: 25px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .stat-card h3 {
            color: #667eea;
            font-size: 32px;
            margin-bottom: 10px;
        }
        .stat-card p {
            color: #666;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>商城后台管理系统</h1>
        <div class="user-info">
            <span>欢迎您，${sessionScope.adminusername}</span>
            <a href="${pageContext.request.contextPath}/admin/logout">退出登录</a>
        </div>
    </div>
    
    <div class="container">
        <div class="sidebar">
            <a href="${pageContext.request.contextPath}/admin/" class="active">首页</a>
            <a href="${pageContext.request.contextPath}/product/list">商品管理</a>
            <a href="${pageContext.request.contextPath}/order/list">订单管理</a>
        </div>
        
        <div class="main-content">
            <div class="welcome-box">
                <h2>欢迎来到商城后台管理系统</h2>
                <p>当前登录用户：${sessionScope.adminusername}</p>
                <p>登录时间：${pageContext.request.session.creationTime}</p>
            </div>
            
            <div class="stats-container">
                <div class="stat-card">
                    <h3>商品管理</h3>
                    <p>添加、编辑、删除商品信息</p>
                </div>
                <div class="stat-card">
                    <h3>订单管理</h3>
                    <p>查看订单、发货处理</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
