<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
    <title>도파민!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="<c:url value='/image/favicon.png' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/default.css' />">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
          integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR&family=Noto+Serif&display=swap');
    </style>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

    <script type="text/JavaScript">
        function self_introduction($list_id) {
            jQuery('#name_text').val($list_id);
        }
    </script>

</head>
<body>
<div id="menu">
    <ul>
        <li id="logo">PSVM</li>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <%--    <li><a href="<c:url value='/board/list'/>">Board</a></li>--%>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='/item/'/>">상점</a></li>
        <li><a href=""><i class="fa fa-search"></i></a></li>
    </ul>
</div>
<div style="display:flex">
    <div class="flex-container space-evenly">
        <input type = "button" onClick = "self_introduction(1)" value = "Click" />
        <div class="flex-item">1</div>
        <div class="flex-item">2</div>
        <div class="flex-item">3</div>
        <div class="flex-item">4</div>
        <div class="flex-item">5</div>
        <input type = "button" onClick = "self_introduction(2)" value = "Click" />
        <div class="flex-item">6</div>
        <div class="flex-item">7</div>
        <div class="flex-item">8</div>
        <div class="flex-item">9</div>
        <div class="flex-item">10</div>
    </div>
</div>
</body>
</html>