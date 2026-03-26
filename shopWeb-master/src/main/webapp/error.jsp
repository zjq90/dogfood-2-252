<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>错误页面 - 电商商城</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <style>
        .error-wrapper {
            width: 600px;
            margin: 100px auto;
            text-align: center;
            padding: 40px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        .error-code {
            font-size: 80px;
            font-weight: bold;
            color: #ff4400;
            margin-bottom: 20px;
        }
        .error-message {
            font-size: 18px;
            color: #666;
            margin-bottom: 30px;
        }
        .error-actions {
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        .btn {
            padding: 10px 25px;
            background: #ff4400;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .btn:hover {
            background: #e33e00;
            color: #fff;
        }
        .btn-secondary {
            background: #6c757d;
        }
        .btn-secondary:hover {
            background: #5a6268;
        }
        .error-details {
            margin-top: 30px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 5px;
            text-align: left;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body style="background: #f5f5f5;">
    <div class="error-wrapper">
        <div class="error-code">500</div>
        <div class="error-message">
            <c:choose>
                <c:when test="${not empty message}">${message}</c:when>
                <c:otherwise>服务器发生错误，请稍后再试</c:otherwise>
            </c:choose>
        </div>
        <div class="error-actions">
            <a href="${pageContext.request.contextPath}/" class="btn">返回首页</a>
            <a href="javascript:history.back()" class="btn btn-secondary">返回上一页</a>
        </div>
        <c:if test="${not empty exception}">
            <div class="error-details">
                <strong>错误详情：</strong>
                <p style="margin-top: 10px; word-break: break-all;">${exception.message}</p>
            </div>
        </c:if>
    </div>
</body>
</html>
