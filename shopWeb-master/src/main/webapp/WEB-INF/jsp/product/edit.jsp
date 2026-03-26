<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑商品 - 商城后台管理系统</title>
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
        .form-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: bold;
        }
        .form-group input[type="text"],
        .form-group input[type="number"],
        .form-group input[type="file"],
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s;
        }
        .form-group input:focus,
        .form-group textarea:focus,
        .form-group select:focus {
            outline: none;
            border-color: #667eea;
        }
        .form-group textarea {
            height: 100px;
            resize: vertical;
        }
        .form-group .checkbox {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .form-group .checkbox input {
            width: 18px;
            height: 18px;
        }
        .current-img {
            margin-top: 10px;
        }
        .current-img img {
            max-width: 150px;
            max-height: 150px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s;
            text-decoration: none;
        }
        .btn-primary {
            background: #667eea;
            color: white;
        }
        .btn-primary:hover {
            background: #5a6fd6;
        }
        .btn-default {
            background: #95a5a6;
            color: white;
        }
        .btn-default:hover {
            background: #7f8c8d;
        }
        .btn-group {
            display: flex;
            gap: 10px;
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
                <h2>编辑商品</h2>
            </div>
            
            <div class="form-container">
                <form action="${pageContext.request.contextPath}/product/edit" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="pid" value="${product.pid}">
                    
                    <div class="form-group">
                        <label for="pname">商品名称</label>
                        <input type="text" id="pname" name="pname" value="${product.pname}" placeholder="请输入商品名称" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="sprice">市场价（元）</label>
                        <input type="number" id="sprice" name="sprice" step="0.01" min="0" value="${product.sprice}" placeholder="请输入市场价" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="cprice">销售价（元）</label>
                        <input type="number" id="cprice" name="cprice" step="0.01" min="0" value="${product.cprice}" placeholder="请输入销售价" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="number">库存数量</label>
                        <input type="number" id="number" name="number" min="0" value="${product.number}" placeholder="请输入库存数量" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="file">商品图片</label>
                        <input type="file" id="file" name="file" accept="image/*">
                        <c:if test="${not empty product.pic}">
                            <div class="current-img">
                                <p>当前图片：</p>
                                <img src="${pageContext.request.contextPath}/upload/${product.pic}" alt="${product.pname}">
                            </div>
                        </c:if>
                    </div>
                    
                    <div class="form-group">
                        <label for="pdesc">商品描述</label>
                        <textarea id="pdesc" name="pdesc" placeholder="请输入商品描述">${product.pdesc}</textarea>
                    </div>
                    
                    <div class="form-group">
                        <label class="checkbox">
                            <input type="checkbox" name="isHot" value="true" ${product.isHot ? 'checked' : ''}>
                            <span>设为热门商品</span>
                        </label>
                    </div>
                    
                    <div class="btn-group">
                        <button type="submit" class="btn btn-primary">保存</button>
                        <a href="${pageContext.request.contextPath}/product/list" class="btn btn-default">返回列表</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
