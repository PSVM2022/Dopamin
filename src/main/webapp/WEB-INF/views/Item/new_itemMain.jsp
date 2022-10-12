<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page session="false" %>

<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>

<html lang="ko">
<head>
    <title>도파민!</title>
    <c:import url="/WEB-INF/views/common/default.jsp"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/home.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/item/psvm.css'/>">
    <script defer src="<c:url value='/js/item/new_itemMain.js'/>"></script>
</head>

<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<div class="container">
    <div id="main_bar" style="justify-content: center;text-align: center;">
        <div class="dropdown" style="margin-left: -1rem;">
            <span class="item_menu" onclick="location.href='/psvm/item/item'" style="cursor:hand"
                  onfocus="blur();">상점</span>
            <div class="dropdown-content">
                <div class="category">
                    <a href="/psvm/item/list/스킨" class="skin">스킨</a>
                </div>
                <div class="category">
                    <a href="/psvm/item/list/꾸미기" class="skin">꾸미기</a>
                </div>
            </div>
        </div>
        <span class="item_menu" onclick="location.href='/psvm/item/cart'" style="cursor:hand"
              onfocus="blur();">장바구니</span>
        <span class="item_menu">포인트사용내역</span>
        <span class="item_menu" onclick="location.href='/psvm/item/chargePoint'" style="cursor:hand"
              onfocus="blur();">충전샵</span>
        <span class="item_menu">마이페이지</span>
    </div>
</div>
<main>
    <div id="item_ main_container">
        <%--    <a href="/psvm/item/cart_main">장바구니</a>--%>
        <div class="banner">
            <div id="rullet"><img src="https://i.ytimg.com/vi/i7aqOvCzaq8/maxresdefault.jpg"
                                  style="width: 70rem; height: 28rem;">
                <img src="https://avatars.githubusercontent.com/u/110664772?s=64&v=4"
                     style="margin-top: -27.2rem; margin-left: 1.6rem; width: 7.6rem; height: 5.5rem;">
            </div>
        </div>
        <div id="section" style="display: flex;justify-content: center;padding: 0rem 0;">
        </div>
    </div>
</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
