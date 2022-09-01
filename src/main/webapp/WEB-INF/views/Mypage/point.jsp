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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/point.css'/>">
</head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>
    <section class="container">
        <c:if test="${empty pntList}">
            nothing!
        </c:if>
        <div>
            <table>
                <thead>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="list" items="${pntList}">
                    <tr>
                        <td><fmt:formatDate value="${list.in_date}" pattern="yyyy.MM.dd"/></td>
                        <td>
                            <div class="imgdiv"><img class="point-img" src="${list.item_img}"></div>
                        </td>
                        <td>
                            <div>
                                [${list.grd_nm}] ${list.item_nm}
                            </div>
                        </td>
                        <td>
                            <div>
                                    ${list.pnt_use_id}<br>
                                수량 : 1
                            </div>
                        </td>
                        <td> ${list.use_stat == 0 ? '환불' : '구매' }</td>
                        <td>
                            <c:if test="${list.use_stat == 0}">
                                -${list.pnt}
                            </c:if>
                            <c:if test="${list.use_stat == -1}">
                                ${list.pnt}
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </section>
</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>

</html>
