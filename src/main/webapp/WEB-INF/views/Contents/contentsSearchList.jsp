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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/contents/contentslist.css'/>">
</head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>
    <div class="container">
        <!-- Carousel wrapper -->
        <section class="container">
            <c:if test="${totalCnt!=null && totalCnt!=0}">
                <br>
                <div class="result-message"><b>${ph.sc.keyword}</b> 에 대한 검색 결과입니다.</div>
                <br>
            </c:if>
        </section>
    </div>

    <section class="container">
        <div class="contents_container">
            <c:forEach var="i" items="${cntsDtoList}">
                <div class="detail-container" onclick="location.href='/psvm/contents/${i.cnts_id}'">
                    <div id="poster-img" style="margin-bottom: 0.1rem">
                        <img id="poster-image" src="${i.cnts_postr_img}" alt="${i.cnts_title}"/>
                    </div>
                    <div>
                        <span class="contents_title"><b>${i.cnts_title}</b></span><br>
                        <span class="item_nm">${i.cnts_subttl}</span>
                        <span class="item_grd">${i.cnts_op_date} | ${i.cnts_cnty}</span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>

    <div class="paging-container" style="text-align:center">
        <div class="paging" style="margin-bottom: 3rem;">
            <c:if test="${totalCnt==null || totalCnt==0}">
                <br>
                <div>"${ph.sc.keyword}" 에 대한 검색 결과가 없습니다. 다른 검색어를 입력해주세요.</div>
                <br>
            </c:if>
            <c:if test="${totalCnt!=null && totalCnt!=0}">
                <c:if test="${ph.showPrev}">
                    <a class="page"
                       href="<c:url value="/contents/search/${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
                </c:if>
                <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                    <a class="page ${i==ph.sc.page? "paging-active" : ""}"
                       href="<c:url value="/contents/search/${ph.sc.getQueryString(i)}"/>">${i}</a>
                </c:forEach>
                <c:if test="${ph.showNext}">
                    <a class="page"
                       href="<c:url value="/contents/search/${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
                </c:if>
            </c:if>
        </div>
    </div>

</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>