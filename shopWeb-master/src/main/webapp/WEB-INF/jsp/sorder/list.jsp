<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>订单详情 - 商城后台管理系统</title>
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
        .product-img {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 5px;
        }
        .price {
            color: #e74c3c;
            font-weight: bold;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
        }
        .btn-default {
            background: #95a5a6;
            color: white;
        }
        .btn-default:hover {
            background: #7f8c8d;
        }
        .total-info {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
            text-align: right;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .total-info p {
            font-size: 18px;
            color: #333;
        }
        .total-info .price {
            font-size: 24px;
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
                <h2>订单详情</h2>
            </div>
            
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>商品图片</th>
                            <th>商品名称</th>
                            <th>单价</th>
                            <th>数量</th>
                            <th>小计</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="totalPrice" value="0" />
                        <c:forEach items="${listSorder}" var="sorder">
                            <tr>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty sorder.product.pic}">
                                            <img src="${pageContext.request.contextPath}/upload/${sorder.product.pic}" alt="${sorder.name}" class="product-img">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${pageContext.request.contextPath}/image/product.gif" alt="${sorder.name}" class="product-img">
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${sorder.name}</td>
                                <td class="price">¥${sorder.price}</td>
                                <td>${sorder.number}</td>
                                <td class="price">¥${sorder.price * sorder.number}</td>
                            </tr>
                            <c:set var="totalPrice" value="${totalPrice + sorder.price * sorder.number}" />
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
            <div class="total-info">
                <p>订单总计：<span class="price">¥${totalPrice}</span></p>
            </div>
            
            <a href="${pageContext.request.contextPath}/order/list" class="btn btn-default">返回订单列表</a>
        </div>
    </div>
</body>
</html>
