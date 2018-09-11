<%--
  Created by IntelliJ IDEA.
  User: 邱烨
  Date: 2018/9/10
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="frm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/findUp" method="post">
<table border="1">
    <c:forEach items="${projectinfoList}" var="projectinfoList">
    <tr>
        <input hidden="hidden" value="${projectinfoList.id}" name="id"/>
        <th>项目编号</th><td>${projectinfoList.id}</td>
    </tr>
        <tr>
        <th>项目名称</th><td>${projectinfoList.projectName}</td>
        </tr>
        <tr>
        <th>申报开始日期</th><td><frm:formatDate value="${projectinfoList.startDate}" pattern="yyyy-MM-dd"></frm:formatDate></td>
        </tr>
        <tr>
            <th>申报结束日期</th><td><frm:formatDate value="${projectinfoList.endDate}" pattern="yyyy-MM-dd"></frm:formatDate></td>
        </tr>
        <tr>
            <th>申报状态</th><td>
                <select name="status">
                    <c:if test="${projectinfoList.status==0}"><option value="0" selected="selected">已申报</option><option value="1">审核中</option><option value="2">已审核</option></c:if>
                    <c:if test="${projectinfoList.status==1}"><option value="0">已申报</option><option value="1" selected="selected">审核中</option><option value="2">已审核</option></c:if>
                </select>
            </td>
    </tr>
        <tr>

            <td>
                <input type="submit" value="审核"><input type="button" value="返回">
            </td>
        </tr>
    </c:forEach>
</table>
</form>
</body>
</html>
