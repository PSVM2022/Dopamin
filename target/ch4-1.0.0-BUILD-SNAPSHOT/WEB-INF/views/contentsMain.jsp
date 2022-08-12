<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-08-11
  Time: 오후 5:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE>
<html>
<head>
    <meta charset="UTF-8">
    <title>contents main page</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
</head>
<body>
<div>
<h2>컨텐츠 메인 페이지</h2>
<form action="" id = form>
    <input type="text" name="cnts_title" value="${contentsDto.cnts_title}">
    <input type="text" name="cnts_subttl" value="${contentsDto.cnts_subttl}">
    <input type="text" name="cnts_rning_t" value="${contentsDto.cnts_rning_t}">
</form>
</div>
</body>
</html>
