<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<section name="bbs" class="container py-3">
    <table class="bbs-page">
        <colgroup class="bbs-define-col">
            <col>
            <col>
            <col>
            <col>
            <col>
            <col>
        </colgroup>
        <thead>
        <tr>
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">글쓴이</th>
            <th scope="col">좋아요</th>
            <th scope="col">날짜</th>
            <th scope="col">조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="post" items="${postList}">
            <tr class="bbs-post">
                <td>
                    <c:choose>
                        <c:when test="${post.post_prior ne 1}"><b>공지</b></c:when>
                        <c:otherwise>${post.post_id}</c:otherwise>
                    </c:choose>
                </td>
                <td class="bbs-post-title">
                    <a href="<c:url value="/post/${post.post_id}?page=${ph.sc.page}"/>">
                        <c:choose>
                            <c:when test="${post.post_prior ne 1}"><b>${post.post_title}</b></c:when>
                            <c:otherwise>${post.post_title}</c:otherwise>
                        </c:choose>
                        <span class="post-comment-cnt">${post.post_reply_cnt}</span>
                    </a>
                </td>
                <td>${post.user_id}</td>
                <td>0</td>
                <td id='postTime_<c:out value="${post.post_id}"/>'></td>
                <td>${post.post_view_cnt}</td>
            </tr>
            <script>$('#postTime_<c:out value="${post.post_id}"/>').text(
                parseTime('<c:out value="${post.in_date}"/>'))</script>
        </c:forEach>
        </tbody>
    </table>
    <div class="button-wrapper">
        <button id="writeBtn" class="write-button"
                onclick='location.href="<c:url value="/community/write/${bbsId}"/>"'>
            <i class="fa-solid fa-pencil"></i> 글쓰기
        </button>
    </div>
    <div class="pagination">
        <c:if test="${ph.showPrev}">
            <a href="<c:url value="/community/${bbsId}?page=${ph.beginPage - 1}"/>">
                <i class="fa-solid fa-caret-left"></i>
            </a>
        </c:if>

        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
            <a
                    <c:if test="${i eq ph.sc.page}">class="active"</c:if>
                    href="<c:url value="/community/${bbsId}?page=${i}"/>">${i}</a>
        </c:forEach>

        <c:if test="${ph.showNext}">
            <a href="<c:url value="/community/${bbsId}?page=${ph.endPage + 1}"/>">
                <i class="fa-solid fa-caret-right"></i>
            </a>
        </c:if>

    </div>

    <div class="search-container">
        <form action="/" class="search-form" method="get">
            <select class="search-option" name="option">
                <option value="all">제목+내용</option>
                <option value="subject">제목</option>
                <option value="content">내용</option>
                <option value="comment">댓글</option>
                <option value="writer">닉네임</option>
            </select>

            <input type="text" name="keyword" class="search-input" type="text" value=""
                   placeholder="검색" autocomplete="off">
            <input type="submit" class="search-button" value="검색">
        </form>

    </div>
</section>