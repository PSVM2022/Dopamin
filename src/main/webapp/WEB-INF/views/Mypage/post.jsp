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
    <script defer src="<c:url value='/js/mypage/post.js'/>"></script>
</head>

<body>

<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>

    <section class="container">
        <h2>Community Post</h2><br>
        <div>
            <table class="revw-table">
                <thead>
                <tr>
                    <th><input type="checkbox" id="allCheck" name="allCheck"></th>
                    <th>#</th>
                    <th>게시판</th>
                    <th>제목</th>
                    <th>등록일</th>
                    <th>조회수</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="post" items="${postDtoList}">
                    <c:choose>
                        <c:when test="${post.post_visib eq 0}">
                            <tr>
                                <th scope="row"><input class="form-check-input" type="checkbox">
                                </th>
                                <td> 가려진 게시물 입니다.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <th><input name="postId" type="checkbox" value="${post.post_id}">
                                </th>
                                <td>${post.post_id}</td>
                                <td>${post.bbs_nm}</td>
                                <td>${post.post_title}[${post.post_reply_cnt}]</td>
                                <td><fmt:formatDate value="${post.up_date}"
                                                    pattern="yyyy.MM.dd"/></td>
                                <td>${post.post_view_cnt}</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div>
            <input type="button" class="revw-btn" value="선택삭제" onclick="deleteValue();">
        </div>
    </section>
</main>
</body>
</html>

