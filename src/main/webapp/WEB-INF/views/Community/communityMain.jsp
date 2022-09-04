<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page session="false" %>

<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>

<html lang="ko">
<head>
    <title>커뮤니티 - 도파민</title>
    <c:import url="/WEB-INF/views/common/default.jsp"/>
    <link rel="stylesheet" type="text/css"
          href="<c:url value='/css/page/community/communityMain.css'/>">
</head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>
    <section name="post-embeded-cnts-rank" class="container py-4">
        <div class="p-3 mb-2 rounded-3">
            <div class="container-fluid py-2">
                <div class="row justify-content-center">
                    <div class="rank-title">
                        <h3 class="display-10">실시간 커뮤니티 언급 컨텐츠 순위</h3>
                        <h6>(1시간 주기 - 최종 업데이트 14:00)</h6>
                    </div>

                    <div class="col-3">
                        <div id="carousel" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <a class="carousel-item active" data-bs-interval="5000" href="/">
                                    <img src=" https://an2-img.amz.wtchn.net/image/v2/LNt7XYXK72NUSKdPjXvl7A.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKdmNIUnpJanBiSW1SZk5Ea3dlRGN3TUhFNE1DSmRMQ0p3SWpvaUwzWXlMM04wYjNKbEwybHRZV2RsTHpFMk5Ua3pNVFUwTnpZNE1qWXpOVGd5T0RRaWZRLjVHMF9ES051bVp1R3YxQlRPeFM1OUxMTmxYdDJ6MEl1Mkd6eW1iWDNpRWM"
                                         name="poster1" alt="1st">
                                </a>
                                <a class="carousel-item" href="/">
                                    <img src="https://an2-img.amz.wtchn.net/image/v2/VIhs-V0Y2xudhRxr68wwiw.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKdmNIUnpJanBiSW1SZk5Ea3dlRGN3TUhFNE1DSmRMQ0p3SWpvaUwzWXlMM04wYjNKbEwybHRZV2RsTHpFMk5UazNOemd3TkRRME1EWXlPVGM1T1RnaWZRLlpzQ1AxQy1JZE91blNZTUh6M1JtdXNGa1RrcnJlc2cwN2VkWVAxOG1HdXM"
                                         alt="2nd">
                                </a>
                                <a class="carousel-item" href="/">
                                    <img src="https://an2-img.amz.wtchn.net/image/v2/e8k_5QLsioExL7jY1NRzpQ.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKdmNIUnpJanBiSW1SZk5Ea3dlRGN3TUhFNE1DSmRMQ0p3SWpvaUwzWXlMM04wYjNKbEwybHRZV2RsTHpFMk5qQTROekV3TnpNM01qYzRNRFEyT1RnaWZRLl9oZjB0LXFJUlFaS0JjSlBjODBfRlV2bzVDVjRlOV9HblZ1Z2E0b01fTmM"
                                         alt="3rd">
                                </a>
                                <a class="carousel-item" href="/">
                                    <img src="https://an2-img.amz.wtchn.net/image/v2/YUwgLWf5GjrzQYMDL6wfug.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKdmNIUnpJanBiSW1SZk5Ea3dlRGN3TUhFNE1DSmRMQ0p3SWpvaUwzWXlMM04wYjNKbEwybHRZV2RsTHpFMk5USTJPREUzTXpNeE56SXlNVEE1TmpjaWZRLi1YMnQ4bmxvaTI3U0RDMXZBaVJqSEdXWTFsdEREZjVIbTg1NWhYVHh5M1U"
                                         alt="4th">
                                </a>
                                <a class="carousel-item" href="/">
                                    <img src="https://an2-img.amz.wtchn.net/image/v2/joCUocgvsrbotaKpHVJM1g.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKdmNIUnpJanBiSW1SZk5Ea3dlRGN3TUhFNE1DSmRMQ0p3SWpvaUwzWXlMM04wYjNKbEwybHRZV2RsTHpFMk5UZ3lNREF6TWpFd01ETTFNVEE1TURNaWZRLkIxZ0djdU5MOEJNOVNsUUNaOExJNDhDd1M1QmxWTi0wS25paV9fRG9tWDA"
                                         alt="5th">
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col d-flex align-items-center flex-wrap">
                        <ol class="list-group" start=0>
                            <a class="list-group-item my-2" aria-current="true" href="/">
                                            <span>
                                                <i class="fa-solid fa-arrow-up"></i>
                                                <span>1위</span>
                                                <span>육사오(6/45)</span>
                                            </span>
                            </a>
                            <a class="list-group-item my-2" href="/">
                                            <span>
                                                <i class="fa-solid fa-minus"></i>
                                                <span>2위</span>
                                                <span>헌트</span>
                                            </span>
                            </a>
                            <a class="list-group-item my-2" href="/">
                                            <span>
                                                <i class="fa-solid fa-arrow-up"></i>
                                                <span>3위</span>
                                                <span>불릿 트레인</span>
                                            </span>
                            </a>
                            <a class="list-group-item my-2" href="/">
                                            <span>
                                                <i class="fa-solid fa-arrow-down"></i>
                                                <span>4위</span>
                                                <span>이상한 변호사 우영우</span>
                                            </span>
                            </a>
                            <a class="list-group-item my-2" href="/">
                                            <span>
                                                <i class="fa-solid fa-arrow-down"></i>
                                                <span>5위</span>
                                                <span>탑건: 매버릭</span>
                                            </span>
                            </a>
                        </ol>
                        <ol class="list-group" start=0>
                            <a class="list-group-item my-2" aria-current="true" href="/">
                                            <span>
                                                <i class="fa-solid fa-arrow-up"></i>
                                                <span>6위</span>
                                                <span>서울대작전</span>
                                            </span>
                            </a>
                            <a class="list-group-item my-2" href="/">
                                            <span>
                                                <i class="fa-solid fa-arrow-up"></i>
                                                <span>7위</span>
                                                <span>미 타임(mé time 2022)</span>
                                            </span>
                            </a>
                            <a class="list-group-item my-2" href="/">
                                            <span>
                                                <i class="fa-solid fa-arrow-up"></i>
                                                <span>8위</span>
                                                <span>러빙 어덜츠</span>
                                            </span>
                            </a>
                            <a class="list-group-item my-2" href="/">
                                            <span>
                                                <i class="fa-solid fa-arrow-down"></i>
                                                <span>9위</span>
                                                <span>데이 시프트</span>
                                            </span>
                            </a>
                            <a class="list-group-item my-2" href="/">
                                            <span>
                                                <i class="fa-solid fa-arrow-down"></i>
                                                <span>10위</span>
                                                <span>카터</span>
                                            </span>
                            </a>
                        </ol>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <section name="bbs-preview" class="container">
        <div class="row align-items-stretch">
            <c:forEach var="entry" items="${bbsPreviewMap}" varStatus="status">
                <div class="col-6 mb-4 p-4">
                    <div class="h-100 p-3">

                        <div class="bbs-title-wrapper">
                            <a href="<c:url value='/community/${entry.key.bbsId}'/>">
                                <h4 class="bbs-title">${entry.key.bbsNm}</h4>
                            </a>
                        </div>

                        <div class="bbs-post-list">
                            <c:forEach var="post" items="${entry.value}">
                                <a href="<c:url value='/post/${post.post_id}'/>">
                                    <div id="1" class="post">
                                        <span class="post-title">${post.post_title}</span>
                                        <span class="post-comment-cnt">${post.post_reply_cnt}</span>
                                    </div>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>

            </c:forEach>
        </div>
    </section>
</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>