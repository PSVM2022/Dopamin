<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>fastcampus</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
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