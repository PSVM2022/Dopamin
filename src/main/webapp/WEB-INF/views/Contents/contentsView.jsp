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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/contents/contentsview.css'/>">
    <script defer src="<c:url value='/js/contents/contentsView.js'/>"></script>
</head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>
    <section class="container">
        <div id="demo">
            <div class="col-12" style="display:flex;">
                <div class="contents-view">
                    <img class="img-fluid" src="${contentsDto.cnts_postr_img}" alt="${contentsDto.cnts_title}"/>
                </div>
                <div class="contents-value">
                    <div class="ott">
                        <c:if test="${contentsDto.ott1_stat==1 || contentsDto.ott2_stat==1 || contentsDto.ott3_stat==1}">
                            <c:if test="${contentsDto.ott1_stat==1}">
                                <div class="ott1ProImg" onclick="window.open('https://www.netflix.com/browse')"></div>
                            </c:if>
                            <c:if test="${contentsDto.ott2_stat==1}">
                                <div class="ott2ProImg" onclick="window.open('https://watcha.com/')"></div>
                            </c:if>
                            <c:if test="${contentsDto.ott3_stat==1}">
                                <div class="ott3ProImg" onclick="window.open('https://www.disneyplus.com/ko-kr')"></div>
                            </c:if>
                        </c:if>

                        <c:if test="${contentsDto.ott1_stat==0 && contentsDto.ott2_stat==0 && contentsDto.ott3_stat==0}">
                            <p class="text"> 컨텐츠를 시청할 수 있는 OTT 가 없습니다.</p>
                        </c:if>
                    </div>
                    <h2 class="title">${contentsDto.cnts_title} <span class="cnts-action zzim" value="" onclick=wishBtn(${contentsWishDto.cnts_id});><i class="fa-solid fa-heart"></i></span></h2>
                    <span class="cnts-action like" value="좋아요" onclick=alert('좋아요!')><i class="fa-solid fa-thumbs-up"></i>312</span>
                    <span class="cnts-action dislike" value="싫어요" onclick="alert('싫어요!');"><i class="fa-solid fa-thumbs-down"></i>19</span>
                    <h6 class="subttle-text-muted">${contentsDto.cnts_subttl}</h6>
                    <hr>
                    <p class="text">${contentsDto.cnts_op_date} | ${contentsDto.cnts_cnty}</p>
                    <table>
                        <tr>
                            <td><p class="text">${contentsDto.cnts_genre1}&nbsp;&nbsp;</p></td>
                            <td><p class="text">${contentsDto.cnts_genre2}&nbsp;&nbsp;</p></td>
                            <td><p class="text">${contentsDto.cnts_genre3}&nbsp;&nbsp;</p></td>
                            <td><p class="text">${contentsDto.cnts_genre4}&nbsp;&nbsp;</p></td>
                            <td><p class="text">${contentsDto.cnts_genre5}</p></td>
                        </tr>
                    </table>
                    <p class="text">${contentsDto.cnts_rning_t} | ${contentsDto.cnts_g_rated}</>
                    <p class="text">${contentsDto.cnts_director} | ${contentsDto.cnts_actor}</p>
                    <p class="text">${contentsDto.cnts_synop}</p>
                </div>
                <br>
            </div>
            <div>
                <a href="/psvm/contents/${contentsDto.cnts_id}/contentsReview/" class="content-oneLineReview">컨텐츠 한줄평 보러가기</a>
            </div>
        </div>
        </div>

    </section>

    <section class="container py-5"></section>

</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>