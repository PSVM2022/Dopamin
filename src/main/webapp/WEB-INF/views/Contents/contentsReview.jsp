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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/home.css' />">
    <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
    <script defer src="<c:url value='/js/contents/contentsReview.js'/>"></script>
</head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>
    <section class="container">
        <h4 style="margin-top: 2rem; margin-left: 1rem; margin-bottom: 2rem;">한줄평 모아보기</h4>
        <div class="revw" style="justify-content: center; margin-bottom: 2rem;">
            <c:if test="${reviewDtoList==[]}">
                <br>
                <div>아직 작성된 한줄평이 없습니다. 첫 번째 한줄평을 작성해보세요!</div>
                <!--페이지 고정 사이즈 줄것-->
                <br>
            </c:if>
            <table class="table">
                <thead>
                <tr>
                    <th style="width: 8rem;">작성자</th>
                    <th>한줄평</th>
                    <th>작성일</th>
                </tr>
                </thead>
                <div>
                    <c:forEach var="i" items="${reviewDtoList}">
                        <tr>
                            <td>${i.user_id}</td>
                            <td>${i.revw_body}</td>
                            <td><fmt:formatDate value="${i.in_date}" pattern="yyyy-MM-dd hh:mm:ss"/>
                                <div style="display: flex; width: 11rem;">
                                    <button>좋아요</button>
                                    <button>싫어요</button>
                                    <button>신고</button>
                                </div>
                            </td>
                            <td>
                                <div style="display: flex;">
                                    <input type="button" value="수정" class="updateBtn"
                                           onclick="updateBtn(${i.cnts_id}, ${i.revw_id})">
                                    <input type="button" value="삭제" class="deleteBtn"
                                           onclick="deleteBtn(${i.cnts_id}, ${i.revw_id})">
                                </div>
                            </td>

                        </tr>
                    </c:forEach>
                </div>

            </table>
            <!--한줄평 작성-->
            <hr>
            <div style="display: flex; justify-content: center; margin-top: 2rem; margin-bottom: 2rem;">
                <div><input type="text" name="review" style=" width: 30rem; height: 3rem;"></div>
                <div>
                    <input type="button" value="등록" class="insertBtn"
                           style="width: 6rem; height: 3rem;"
                           onclick="insertBtn(${cnts_id})">
                </div>
            </div>
        </div>
    </section>

</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>