<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<header class="header">
    <nav class="navigation">
        <a href="<c:url value="/"/>" class="logo">
            <object data="<c:url value='/image/main_logo.svg' />" width="102" height="64"></object>
        </a>

        <ul class="nav-list">
            <li><a href="<c:url value='/' />">홈</a></li>
            <li><a href="<c:url value='/' />">신규작</a></li>
            <li><a href="<c:url value='/' />">인기작</a></li>
            <li><a href="<c:url value='/community' />">커뮤니티</a></li>
            <li><a href="<c:url value='/' />">이벤트</a></li>
            <li><a href="<c:url value='/' />">상점</a></li>
        </ul>

        <form id="search-form" class="search-form"
              action="<c:url value="/contents/search/${sc.keyword}"/>" method="get">
            <select class="search-option" name="option">
                <option value="ttl" ${ph.sc.option=='ttl' || ph.sc.option=='' ? "selected" : ""}>
                    제목/부제목
                </option>
                <option value="cast" ${ph.sc.option=='cast' ? "selected" : ""}>감독/출연진</option>
                <option value="genre" ${ph.sc.option=='genre' ? "selected" : ""}>장르별</option>
            </select>


            <label class="input-wrapper">
                <input id="search-content" type="text" name="keyword" class="search-input"
                       value="${sc.keyword}" placeholder="검색어를 입력해주세요." autocomplete="off">
            </label>
        </form>

        <a href="<c:url value="/login"/>"><b>로그인</b></a>
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