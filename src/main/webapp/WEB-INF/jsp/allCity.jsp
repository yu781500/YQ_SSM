<%--
  Created by IntelliJ IDEA.
  User: 于强
  Date: 2018/12/20
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<% pageContext.setAttribute("path", request.getContextPath()); %>
<html>
<head>
    <title>City列表</title>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    基于SSM框架的管理系统：简单实现增、删、改、查。
                </h1>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>城市列表 —— 显示所有城市</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${path }/city/toInsertCity">新增</a>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>城市id</th>
                    <th>城市name</th>
                    <th>城市countrycode</th>
                    <th>城市district</th>
                    <th>城市population</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="city" items="${requestScope.get('list')}" varStatus="status">
                    <tr>
                        <td>${city.id}</td>
                        <td>${city.name}</td>
                        <td>${city.countrycode}</td>
                        <td>${city.district}</td>
                        <td>${city.population}</td>
                        <td>
                            <a href="${path }/city/toUpdateCity?id=${city.id}">更改</a> |
                            <a href="${path }/city/delete/${city.id}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <tr align="left">
                <td>
                    <div style="line-height: 20px;height: 20px;text-align: center;font-size: 18px ">
                        共 [ ${page.pages} ] 条记录,共 [ ${page.pages/page.size} ] 页

                        <c:if test="${ page.pageNum > 1 }">
                            [ <A href="${path }/city/allCity?pageNum=${page.pageNum-1}">前一页</A> ]
                        </c:if>
                        <c:if test="${ page.pageNum <=1 }">
                            [ 前一页 ]
                        </c:if>
                        ,当前第 [ ${page.pageNum} ] 页
                        <c:if test="${ page.pageNum < page.pages/page.size }">
                            ,[ <A href="${path }/city/allCity?pageNum=${page.pageNum+1}">后一页</A> ]
                        </c:if>
                        <c:if test="${ page.pageNum >= page.pages/page.size }">
                            [ 后一页 ]
                        </c:if>
                    </div>
                </td>
            </tr>
        </div>
    </div>
</div>

</body>
</html>