<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page session="false" %>

<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('USERID')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'Logout'}"/>

<header class="header-main">
    <nav class="header-navigation">
        <a href="<c:url value="/"/>" class="header-logo">
            <object data="<c:url value='/image/main_logo.svg' />" width="102" height="64"></object>
        </a>

        <ul class="header-nav-list">
            <li><a href="<c:url value='/' />">홈</a></li>
            <li><a href="<c:url value='/community' />">커뮤니티</a></li>
            <li><a href="<c:url value='/item/item' />">상점</a></li>
            <li><a href="<c:url value='/mypage' />">마이페이지</a></li>
        </ul>

        <form id="search-form" class="header-search-form"
              action="<c:url value="/contents/search/${sc.keyword}"/>" method="get">
            <select class="header-search-option" name="option">
                <option value="total">통합검색</option>
                <option value="ttl">제목/부제목</option>
                <option value="cast" }>감독/출연진</option>
                <option value="genre">장르별</option>
            </select>
            <label class="header-input-wrapper">
                <input id="search-content" type="text" name="keyword" class="header-search-input"
                       placeholder="검색어를 입력해주세요." autocomplete="off">
            </label>
        </form>

        <a href="<c:url value="/login/login"/>"><b>${loginOut}</b></a>
    </nav>
    <script>
      let form = $("search-form")
      let searchInput = $("#search-content")
      searchInput.keypress(function (e) {
        if (e.keyCode == 13) {
          if (searchInput.val().length === 0) return false;
          form.submit();
        }
      })
    </script>
</header>