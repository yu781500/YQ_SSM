<%--
  Created by IntelliJ IDEA.
  User: 于强
  Date: 2018/12/20
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>新增城市</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
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
                    <small>新增城市</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="" name="userForm">
        城市name：<input type="text" name="name"><br><br><br>
        城市countrycode：<input type="text" name="countrycode"><br><br><br>
        城市district：<input type="text" name="district"><br><br><br>
        城市population：<input type="text" name="population"><br><br><br>
        <input type="button" value="添加" onclick="insertCity()">
    </form>

    <script type="text/javascript">
        function insertCity() {
            var form = document.forms[0];
            form.action = "<%=basePath %>city/insertCity";
            form.method = "post";
            form.submit();
        }
    </script>
</div>
</body>
</html>