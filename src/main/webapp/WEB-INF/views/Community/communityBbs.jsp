<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page session="false" %>

<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<html lang="ko">

<head>
    <title>${bbsNm} 판 - 도파민</title>
    <c:import url="/WEB-INF/views/common/default.jsp"/>
    <link rel="stylesheet" type="text/css"
          href="<c:url value='/css/page/community/communityBbs.css'/>">
    <script type='text/javascript' src="<c:url value='/js/parseTime.js'/>"></script>
</head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>
    <section name="bbs-rank" class="container py-3">
        <div class="bbs-title">
            <h3><a href="<c:url value='/community/${bbsId}'/>">${bbsNm} 판</a></h3>
        </div>
        <div class="row recommand-post-wrapper">
            <div class="col-6">
                <ul>
                    <li id="1">
                        <a href="/" class="recommand-post">
                            <span class="post-title">가나다라마바사아차자파타</span>
                            <span class="user-name">nickname</span>
                        </a>
                    </li>
                    <li id="2">
                        <a href="/" class="recommand-post">
                            <span class="post-title">가나다라마바사아차바사아차자파타자파타</span>
                            <span class="user-name">nickname</span>
                        </a>
                    </li>
                    <li id="3">
                        <a href="/" class="recommand-post">
                            <span class="post-title">가나다라마바사아차자파타바사아차자파타</span>
                            <span class="user-name">nickname</span>
                        </a>
                    </li>
                    <li id="4">
                        <a href="/" class="recommand-post">
								<span
                                        class="post-title">가나다라마바사아차자파asdfdsafdsafasdfasdfdsafdsafsdafsdafas타바사아차자파타</span>
                            <span class="user-name-">nickname</span>
                        </a>
                    </li>
                    <li id="5">
                        <a href="/" class="recommand-post">
                            <span class="post-title">가나다라마바사아차자파타</span>
                            <span class="user-name">nickname</span>
                        </a>
                </ul>
            </div>
            <div class="col-6 row">
                <div class="col-4 img-wrapper">
                    <img src=" https://an2-img.amz.wtchn.net/image/v2/LNt7XYXK72NUSKdPjXvl7A.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKdmNIUnpJanBiSW1SZk5Ea3dlRGN3TUhFNE1DSmRMQ0p3SWpvaUwzWXlMM04wYjNKbEwybHRZV2RsTHpFMk5Ua3pNVFUwTnpZNE1qWXpOVGd5T0RRaWZRLjVHMF9ES051bVp1R3YxQlRPeFM1OUxMTmxYdDJ6MEl1Mkd6eW1iWDNpRWM"
                         alt="post1">
                </div>
                <div class="col">
                    <div class="recommanded-content-embed-post">
                        <b>
                            <h5>판 언급 횟수 1위 컨텐츠</h5>
                        </b>
                        <h6 class="post-content-name">육사오</h6>
                        <div class="post-content-synopsis">
                            제임스 카메론 감독의
                            비교불가한 연출력과 압도적인 영상미로
                            3D 장르의 신세계를 개척한 &lt;AVATAR&gt; 💙
                            오는 9월, 돌비 비전과 돌비 애트모스로
                            리마스터링 된 &lt;AVATAR&gt;가
                            돌비 시네마로 우리 곁을 다시 찾아옵니다
                            돌비 시네마로 우리 곁을 다시 찾아옵니다
                            돌비 시네마로 우리 곁을 다시 찾아옵니다
                            돌비 시네마로 우리 곁을 다시 찾아옵니다
                            돌비 시네마로 우리 곁을 다시 찾아옵니다
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <c:import url="bbs.jsp"/>
</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>