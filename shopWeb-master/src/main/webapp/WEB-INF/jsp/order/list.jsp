<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>订单管理 - 商城后台管理系统</title>
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
        }
        .sidebar a.active {
            background: #667eea;
        }
        .main-content {
            flex: 1;
            padding: 30px;
        }
        .page-header {
            margin-bottom: 20px;
        }
        .page-header h2 {
            color: #333;
        }
        .table-container {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        th {
            background: #f8f9fa;
            font-weight: bold;
            color: #333;
        }
        tr:hover {
            background: #f8f9fa;
        }
        .btn {
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 12px;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
            margin: 2px;
        }
        .btn-success {
            background: #27ae60;
            color: white;
        }
        .btn-success:hover {
            background: #219a52;
        }
        .btn-danger {
            background: #e74c3c;
            color: white;
        }
        .btn-danger:hover {
            background: #c0392b;
        }
        .btn-info {
            background: #3498db;
            color: white;
        }
        .btn-info:hover {
            background: #2980b9;
        }
        .status-badge {
            padding: 5px 10px;
            border-radius: 3px;
            font-size: 12px;
        }
        .status-0 {
            background: #f39c12;
            color: white;
        }
        .status-1 {
            background: #3498db;
            color: white;
        }
        .status-2 {
            background: #27ae60;
            color: white;
        }
        .price {
            color: #e74c3c;
            font-weight: bold;
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
            <a href="${pageContext.request.contextPath}/admin/">首页</a>
            <a href="${pageContext.request.contextPath}/product/list">商品管理</a>
            <a href="${pageContext.request.contextPath}/order/list" class="active">订单管理</a>
        </div>
        
        <div class="main-content">
            <div class="page-header">
                <h2>订单列表</h2>
            </div>
            
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>订单号</th>
                            <th>收货人</th>
                            <th>电话</th>
                            <th>地址</th>
                            <th>总金额</th>
                            <th>订单状态</th>
                            <th>下单时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="order">
                            <tr>
                                <td>${order.fid}</td>
                                <td>${order.name}</td>
                                <td>${order.phone}</td>
                                <td>${order.address}</td>
                                <td class="price">¥${order.total}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${order.status == 0}">
                                            <span class="status-badge status-0">待发货</span>
                                        </c:when>
                                        <c:when test="${order.status == 1}">
                                            <span class="status-badge status-1">已发货</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status-badge status-2">已完成</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${order.date}</td>
                                <td>
                                    <c:if test="${order.status == 0}">
                                        <a href="${pageContext.request.contextPath}/order/updatestatus?fid=${order.fid}&status=1" class="btn btn-success">发货</a>
                                    </c:if>
                                    <c:if test="${order.status == 1}">
                                        <a href="${pageContext.request.contextPath}/order/updatestatus?fid=${order.fid}&status=2" class="btn btn-info">完成</a>
                                    </c:if>
                                    <a href="${pageContext.request.contextPath}/sorder/listbyfid?fid=${order.fid}" class="btn btn-info">详情</a>
                                    <a href="${pageContext.request.contextPath}/order/delete?fid=${order.fid}" class="btn btn-danger" onclick="return confirm('确定要删除该订单吗？')">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
