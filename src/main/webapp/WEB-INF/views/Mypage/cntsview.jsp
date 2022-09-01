<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page session="false" %>

<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('USERID')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>

<html lang="ko">
<head>
    <title>도파민!</title>
    <c:import url="/WEB-INF/views/common/default.jsp"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/cnts.css'/>">
</head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>
    <section class="container">
        <h2>Contents View</h2><br>
        <div>

            <c:choose>
                <c:when test="${empty cntsDtoList}">
                    <div>
                        <div>
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6w87nBO1Els6CpW4xtA5TgpqvYMU3CB_F5g&usqp=CAU"
                                 class="css-qhzw1o-StyledImg">
                            <h3>아직 평가하신 작품이 없어요!</h3>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="cnts-img">
                        <c:forEach var="cnts" items="${cntsDtoList}">
                            <div>
                                <a class="cnts-a" href='<c:url value="/contents/${cnts.cnts_id}"/>'>
                                    <div><img src="${cnts.cnts_postr_img}"></div>
                                    <div>${cnts.cnts_title}</div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
    </section>
</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>