<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑商品 - 后台管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <style type="text/css">
        body { padding: 20px; }
        .form_title { font-size: 18px; font-weight: bold; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 1px solid #ddd; }
        .form_table { width: 100%; }
        .form_table td { padding: 10px; }
        .form_table td:first-child { width: 100px; text-align: right; padding-right: 15px; }
        .form_table input[type="text"], .form_table input[type="number"] { padding: 5px; width: 300px; }
        .form_table textarea { padding: 5px; width: 400px; height: 100px; }
        .form_table select { padding: 5px; min-width: 150px; }
        .btn { padding: 8px 25px; margin-right: 10px; cursor: pointer; }
        .btn-submit { background: #0066cc; color: #fff; border: none; }
        .btn-back { background: #f5f5f5; border: 1px solid #ddd; text-decoration: none; color: #333; display: inline-block; }
        .current_img { width: 100px; height: 100px; margin-bottom: 10px; }
    </style>
</head>
<body>
    <div class="form_title">编辑商品</div>
    <form action="${pageContext.request.contextPath}/product/edit" method="post" enctype="multipart/form-data">
        <input type="hidden" name="pid" value="${product.pid}">
        <table class="form_table">
            <tr>
                <td>商品名称：</td>
                <td><input type="text" name="pname" value="${product.pname}" required></td>
            </tr>
            <tr>
                <td>销售价格：</td>
                <td><input type="number" name="sprice" step="0.01" value="${product.sprice}" required></td>
            </tr>
            <tr>
                <td>成本价格：</td>
                <td><input type="number" name="cprice" step="0.01" value="${product.cprice}" required></td>
            </tr>
            <tr>
                <td>当前图片：</td>
                <td>
                    <img src="${pageContext.request.contextPath}/image/${product.pic}" alt="${product.pname}" class="current_img" onerror="this.src='${pageContext.request.contextPath}/image/default.jpg'">
                    <br>
                    <input type="file" name="file" accept="image/*">
                    <span style="color: #999;">不修改请留空</span>
                </td>
            </tr>
            <tr>
                <td>商品描述：</td>
                <td><textarea name="pdesc">${product.pdesc}</textarea></td>
            </tr>
            <tr>
                <td>是否热门：</td>
                <td>
                    <select name="isHot">
                        <option value="0" ${!product.isHot ? 'selected' : ''}>否</option>
                        <option value="1" ${product.isHot ? 'selected' : ''}>是</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>库存数量：</td>
                <td><input type="number" name="number" value="${product.number}" min="0"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button type="submit" class="btn btn-submit">保存修改</button>
                    <a href="${pageContext.request.contextPath}/product/list" class="btn btn-back">返回</a>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>