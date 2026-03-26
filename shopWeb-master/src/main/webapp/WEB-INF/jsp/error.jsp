<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>错误提示 - 商城后台管理系统</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <style>
        .error-container {
            max-width: 600px;
            margin: 100px auto;
            padding: 40px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        .error-icon {
            font-size: 60px;
            color: #ff4d4f;
            margin-bottom: 20px;
        }
        .error-title {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }
        .error-content {
            font-size: 16px;
            color: #666;
            margin-bottom: 30px;
        }
        .error-actions a {
            display: inline-block;
            margin: 0 10px;
            padding: 10px 30px;
            background: #1890ff;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
        }
        .error-actions a:hover {
            background: #40a9ff;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-icon">✗</div>
        <div class="error-title">操作失败</div>
        <div class="error-content">${msg}</div>
        <div class="error-actions">
            <a href="javascript:history.back()">返回上一页</a>
            <a href="${pageContext.request.contextPath}/admin/">返回首页</a>
        </div>
    </div>
</body>
</html>
