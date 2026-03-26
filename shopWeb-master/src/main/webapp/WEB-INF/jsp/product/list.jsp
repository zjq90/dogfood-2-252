<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品管理 - 商城后台管理系统</title>
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
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .page-header h2 {
            color: #333;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            transition: all 0.3s;
        }
        .btn-primary {
            background: #667eea;
            color: white;
        }
        .btn-primary:hover {
            background: #5a6fd6;
        }
        .btn-success {
            background: #27ae60;
            color: white;
        }
        .btn-danger {
            background: #e74c3c;
            color: white;
        }
        .btn-warning {
            background: #f39c12;
            color: white;
        }
        .search-form {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            display: flex;
            gap: 10px;
        }
        .search-form input {
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 300px;
        }
        .search-form input:focus {
            outline: none;
            border-color: #667eea;
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
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 5px;
        }
        .price {
            color: #e74c3c;
            font-weight: bold;
        }
        .hot-tag {
            background: #e74c3c;
            color: white;
            padding: 2px 8px;
            border-radius: 3px;
            font-size: 12px;
        }
        .actions a {
            margin-right: 5px;
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
            <a href="${pageContext.request.contextPath}/product/list" class="active">商品管理</a>
            <a href="${pageContext.request.contextPath}/order/list">订单管理</a>
        </div>
        
        <div class="main-content">
            <div class="page-header">
                <h2>商品列表</h2>
                <a href="${pageContext.request.contextPath}/product/add" class="btn btn-primary">添加商品</a>
            </div>
            
            <form class="search-form" action="${pageContext.request.contextPath}/product/find" method="post">
                <input type="text" name="pname" placeholder="请输入商品名称搜索...">
                <button type="submit" class="btn btn-primary">搜索</button>
                <a href="${pageContext.request.contextPath}/product/list" class="btn btn-warning">显示全部</a>
            </form>
            
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>图片</th>
                            <th>商品名称</th>
                            <th>市场价</th>
                            <th>销售价</th>
                            <th>库存</th>
                            <th>是否热门</th>
                            <th>上架时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="product">
                            <tr>
                                <td>${product.pid}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty product.pic}">
                                            <img src="${pageContext.request.contextPath}/upload/${product.pic}" alt="${product.pname}" class="product-img">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${pageContext.request.contextPath}/image/product.gif" alt="${product.pname}" class="product-img">
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${product.pname}</td>
                                <td><del>¥${product.sprice}</del></td>
                                <td class="price">¥${product.cprice}</td>
                                <td>${product.number}</td>
                                <td>
                                    <c:if test="${product.isHot}">
                                        <span class="hot-tag">热门</span>
                                    </c:if>
                                </td>
                                <td>${product.pdate}</td>
                                <td class="actions">
                                    <a href="${pageContext.request.contextPath}/product/edit?pid=${product.pid}" class="btn btn-success">编辑</a>
                                    <a href="${pageContext.request.contextPath}/product/delete?pid=${product.pid}" class="btn btn-danger" onclick="return confirm('确定要删除该商品吗？')">删除</a>
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
