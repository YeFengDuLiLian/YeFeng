<%--
  Created by IntelliJ IDEA.
  User: 邱烨
  Date: 2018/9/10
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="frm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/findAll" method="post">
<div>
    申报状态:<select name="status"><option value="-1">全部</option><option value="1">审核中</option><option value="2">已审核</option><option value="0">已申报</option></select>
    <input type="submit" value="查询"/>
</div>
</form>
<table border="1">
    <tr>
        <th>项目编号</th>
        <th>项目名称</th>
        <th>申报开始日期</th>
        <th>申报结束日期</th>
        <th>申报状态</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${projectinfo.datas}" var="projectinfo">
    <tr>
        <td>${projectinfo.id}</td>
        <td>${projectinfo.projectName}</td>
        <td><frm:formatDate value="${projectinfo.startDate}" pattern="yyyy-MM-dd"></frm:formatDate></td>
        <td><frm:formatDate value="${projectinfo.endDate}" pattern="yyyy-MM-dd"></frm:formatDate></td>
        <td>
        <c:if test="${projectinfo.status == 0}">
            已申报
        </c:if>
        <c:if test="${projectinfo.status == 1}">
            审核中
        </c:if>
        <c:if test="${projectinfo.status == 2}">
            已审核
        </c:if>
        </td>
        <td>
            <c:if test="${projectinfo.status == 0}">
                <a href="/findTiao?id=${projectinfo.id}">审核</a>
            </c:if>
            <c:if test="${projectinfo.status == 1}">
                <a href="/findTiao?id=${projectinfo.id}">审核</a>
            </c:if>
        </td>
    </tr>
    </c:forEach>
</table>

<a href="/findAll?pageNo=1">首页</a>
<a href="/findAll?pageNo=${projectinfo.pageNo-1<0?1:projectinfo.pageNo-1}">上一页</a>
<a href="/findAll?pageNo=${projectinfo.pageNo+1>projectinfo.totalPage?projectinfo.totalPage:projectinfo.pageNo+1}">下一页</a>
<a href="/findAll?pageNo=${projectinfo.totalPage}">尾页</a>
第${projectinfo.pageNo}页,共${projectinfo.totalPage}页
</body>
</html>
