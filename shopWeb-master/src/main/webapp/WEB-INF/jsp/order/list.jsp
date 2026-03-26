<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>订单列表 - 后台管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <style type="text/css">
        body { padding: 20px; }
        .search_bar { margin-bottom: 20px; }
        .search_bar input[type="text"] { padding: 5px; width: 200px; }
        .search_bar button { padding: 5px 15px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: center; }
        th { background: #f5f5f5; }
        .btn { padding: 3px 10px; margin: 0 3px; text-decoration: none; color: #333; border: 1px solid #ccc; border-radius: 3px; }
        .btn:hover { background: #f5f5f5; }
        .btn-view { color: #0066cc; }
        .btn-delete { color: #cc0000; }
        .status-0 { color: #999; } /* 未支付 */
        .status-1 { color: #0066cc; } /* 已支付 */
        .status-2 { color: #ff9900; } /* 已发货 */
        .status-3 { color: #009933; } /* 已完成 */
        .status-4 { color: #cc0000; } /* 已取消 */
    </style>
</head>
<body>
    <div class="search_bar">
        <span style="font-size: 16px; font-weight: bold;">订单列表</span>
    </div>

    <table>
        <thead>
            <tr>
                <th width="80">订单ID</th>
                <th width="100">收货人</th>
                <th width="120">联系电话</th>
                <th>收货地址</th>
                <th width="100">订单金额</th>
                <th width="80">订单状态</th>
                <th width="150">下单时间</th>
                <th width="150">操作</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="forder">
                <tr>
                    <td>${forder.fid}</td>
                    <td>${forder.name}</td>
                    <td>${forder.phone}</td>
                    <td align="left">${forder.address}</td>
                    <td>¥${forder.total}</td>
                    <td class="status-${forder.status}">
                        <c:choose>
                            <c:when test="${forder.status == 0}">未支付</c:when>
                            <c:when test="${forder.status == 1}">已支付</c:when>
                            <c:when test="${forder.status == 2}">已发货</c:when>
                            <c:when test="${forder.status == 3}">已完成</c:when>
                            <c:when test="${forder.status == 4}">已取消</c:when>
                            <c:otherwise>未知</c:otherwise>
                        </c:choose>
                    </td>
                    <td>${forder.date}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/forder/detail?fid=${forder.fid}" class="btn btn-view">查看详情</a>
                        <a href="${pageContext.request.contextPath}/forder/delete?fid=${forder.fid}" class="btn btn-delete" onclick="return confirm('确定要删除该订单吗？')">删除</a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty list}">
                <tr>
                    <td colspan="8">暂无数据</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</body>
</html>