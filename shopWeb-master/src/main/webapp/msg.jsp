<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>提示信息 - 商城系统</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Microsoft YaHei', Arial, sans-serif;
            background: #f5f5f5;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .message-container {
            background: white;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
        }
        .message-container .icon {
            font-size: 60px;
            margin-bottom: 20px;
        }
        .message-container .icon.success {
            color: #27ae60;
        }
        .message-container .icon.error {
            color: #e74c3c;
        }
        .message-container h2 {
            color: #333;
            margin-bottom: 15px;
        }
        .message-container p {
            color: #666;
            margin-bottom: 30px;
        }
        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
            transition: all 0.3s;
        }
        .btn-primary {
            background: #3498db;
            color: white;
        }
        .btn-primary:hover {
            background: #2980b9;
        }
    </style>
</head>
<body>
    <div class="message-container">
        <c:choose>
            <c:when test="${not empty msg && msg.contains('成功')}">
                <div class="icon success">✓</div>
                <h2>操作成功</h2>
            </c:when>
            <c:otherwise>
                <div class="icon error">✗</div>
                <h2>操作失败</h2>
            </c:otherwise>
        </c:choose>
        
        <p>${msg}</p>
        
        <a href="${pageContext.request.contextPath}/product/frontlist" class="btn btn-primary">返回首页</a>
    </div>
</body>
</html>
