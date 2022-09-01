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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/revw.css'/>">
</head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>
    <section class="container">
        <h2 class="revw-h2">Contents Good Review</h2><br>
        <div>
            <table class="revw-table">
                <thead>
                <tr>
                    <th width="3%">#</th>
                    <th width="10%">컨텐츠 제목</th>
                    <th width="30%">내용</th>
                    <th width="10%">작성자</th>
                    <th width="10%">등록일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="revw" items="${revwDtoList}">
                    <tr>
                        <td>${revw.revw_id}</td>
                        <td><a class="revw-title"
                               href='<c:url value="/contents/${revw.cnts_id}"/>'>${revw.cnts_title}</a>
                        </td>
                        <td>${revw.revw_body}</td>
                        <td>${revw.user_id}</td>
                        <td><fmt:formatDate value="${revw.up_date}" pattern="yyyy.MM.dd"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </section>
    <c:import url="/WEB-INF/views/common/footer.jsp"/>
</main>
</body>
</html>

