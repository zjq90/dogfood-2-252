<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品列表 - 后台管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <style type="text/css">
        body { padding: 20px; }
        .search_bar { margin-bottom: 20px; }
        .search_bar input[type="text"] { padding: 5px; width: 200px; }
        .search_bar button { padding: 5px 15px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: center; }
        th { background: #f5f5f5; }
        img { width: 50px; height: 50px; }
        .btn { padding: 3px 10px; margin: 0 3px; text-decoration: none; color: #333; border: 1px solid #ccc; border-radius: 3px; }
        .btn:hover { background: #f5f5f5; }
        .btn-edit { color: #0066cc; }
        .btn-delete { color: #cc0000; }
    </style>
</head>
<body>
    <div class="search_bar">
        <form action="${pageContext.request.contextPath}/product/find" method="post">
            <input type="text" name="pname" placeholder="输入商品名称搜索" value="${param.pname}">
            <button type="submit">搜索</button>
            <a href="${pageContext.request.contextPath}/product/add" class="btn">添加商品</a>
        </form>
    </div>

    <table>
        <thead>
            <tr>
                <th width="80">ID</th>
                <th width="100">图片</th>
                <th>商品名称</th>
                <th width="100">销售价</th>
                <th width="100">成本价</th>
                <th width="80">库存</th>
                <th width="80">是否热门</th>
                <th width="150">上架时间</th>
                <th width="150">操作</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="product">
                <tr>
                    <td>${product.pid}</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/image/${product.pic}" alt="${product.pname}" onerror="this.src='${pageContext.request.contextPath}/image/default.jpg'">
                    </td>
                    <td align="left">${product.pname}</td>
                    <td>¥${product.sprice}</td>
                    <td>¥${product.cprice}</td>
                    <td>${product.number}</td>
                    <td>${product.isHot ? '是' : '否'}</td>
                    <td>${product.pdate}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/product/edit?pid=${product.pid}" class="btn btn-edit">编辑</a>
                        <a href="${pageContext.request.contextPath}/product/delete?pid=${product.pid}" class="btn btn-delete" onclick="return confirm('确定要删除该商品吗？')">删除</a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty list}">
                <tr>
                    <td colspan="9">暂无数据</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</body>
</html>