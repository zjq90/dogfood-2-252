<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>订单提交成功</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: "Microsoft Yahei", Arial, sans-serif;
            background: #f5f5f5;
        }
        .container {
            width: 1200px;
            margin: 50px auto;
            background: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        .success-icon {
            width: 100px;
            height: 100px;
            background: #52c41a;
            border-radius: 50%;
            margin: 0 auto 30px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .success-icon::after {
            content: '';
            width: 50px;
            height: 25px;
            border-left: 5px solid #fff;
            border-bottom: 5px solid #fff;
            transform: rotate(-45deg);
            margin-top: -10px;
        }
        h1 {
            color: #52c41a;
            font-size: 28px;
            margin-bottom: 20px;
        }
        .msg {
            color: #666;
            font-size: 16px;
            margin-bottom: 30px;
        }
        .btn-group {
            margin-top: 30px;
        }
        .btn {
            display: inline-block;
            padding: 12px 40px;
            background: #ff4400;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
            margin: 0 10px;
            transition: background 0.3s;
        }
        .btn:hover {
            background: #e33e00;
        }
        .btn-secondary {
            background: #6c757d;
        }
        .btn-secondary:hover {
            background: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="success-icon"></div>
        <h1>订单提交成功！</h1>
        <p class="msg">${msg}</p>
        <div class="btn-group">
            <a href="${pageContext.request.contextPath}/" class="btn">返回首页</a>
            <a href="${pageContext.request.contextPath}/product/frontlist" class="btn btn-secondary">继续购物</a>
        </div>
    </div>
</body>
</html>
