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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/user/survey.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/home.css'/>">
    <script defer src="<c:url value='/js/user/survey.js'/>"></script>
    </head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>
    <h2><span style="color:#e0994d;">DOPAMIN </span>설문조사</h2>
    <div class="survey-container">
        <form action="<c:url value="/join/survey"/>" method="post" onsubmit="surveyCheck();">
            <div class="content-preview" style="text-align:center">
                <input type="hidden" name="user_id" value="${loginId}"/>
                <p>본 설문조사는 마이페이지와 영화 추천 기능에 필요한 정보입니다.</p>
                <label for="fav-genres-box" class="survey-label">선호 장르</label>
                <p>선호 장르 최소1개 최대 5개를 선택해주세요. (중복X)</p>
                <div class="fav-genres-box" id="fav-genres-box">
                    <select required
                            name="fav_genre1">
                        <option selected value="" disabled>--선호장르1(필수)--</option>
                        <option value="액션">액션</option>
                        <option value="애니메이션">애니메이션</option>
                        <option value="범죄">범죄</option>
                        <option value="드라마">드라마</option>
                        <option value="코미디">코미디</option>
                        <option value="로맨스">로맨스</option>
                        <option value="스릴러">스릴러</option>
                        <option value="호러">호러</option>
                        <option value="SF">SF</option>
                        <option value="성인">성인</option>
                        <option value="판타지">판타지</option>
                        <option value="어드벤쳐">어드벤쳐</option>
                        <option value="미스터리">미스터리</option>
                        <option value="가족">가족</option>
                        <option value="전쟁">전쟁</option>
                        <option value="사극">사극</option>
                        <option value="다큐멘터리">다큐멘터리</option>
                        <option value="뮤지컬">뮤지컬</option>
                        <option value="서부극">서부극</option>
                        <option value="공연">공연</option>
                        <option value="게임">게임</option>
                        <option value="리얼리티">리얼리티</option>
                        <option value="토크쇼">토크쇼</option>
                        <option value="스포츠">스포츠</option>
                        <option value="유러피안">유러피안</option>
                    </select>
                    <select name="fav_genre2">
                        <option selected value="" disabled>--선호장르2--</option>
                        <option value="액션">액션</option>
                        <option value="애니메이션">애니메이션</option>
                        <option value="범죄">범죄</option>
                        <option value="드라마">드라마</option>
                        <option value="코미디">코미디</option>
                        <option value="로맨스">로맨스</option>
                        <option value="스릴러">스릴러</option>
                        <option value="호러">호러</option>
                        <option value="SF">SF</option>
                        <option value="성인">성인</option>
                        <option value="판타지">판타지</option>
                        <option value="어드벤쳐">어드벤쳐</option>
                        <option value="미스터리">미스터리</option>
                        <option value="가족">가족</option>
                        <option value="전쟁">전쟁</option>
                        <option value="사극">사극</option>
                        <option value="다큐멘터리">다큐멘터리</option>
                        <option value="뮤지컬">뮤지컬</option>
                        <option value="서부극">서부극</option>
                        <option value="공연">공연</option>
                        <option value="게임">게임</option>
                        <option value="리얼리티">리얼리티</option>
                        <option value="토크쇼">토크쇼</option>
                        <option value="스포츠">스포츠</option>
                        <option value="유러피안">유러피안</option>
                    </select>
                    <select name="fav_genre3">
                        <option selected value="" disabled>--선호장르3--</option>
                        <option value="액션">액션</option>
                        <option value="애니메이션">애니메이션</option>
                        <option value="범죄">범죄</option>
                        <option value="드라마">드라마</option>
                        <option value="코미디">코미디</option>
                        <option value="로맨스">로맨스</option>
                        <option value="스릴러">스릴러</option>
                        <option value="호러">호러</option>
                        <option value="SF">SF</option>
                        <option value="성인">성인</option>
                        <option value="판타지">판타지</option>
                        <option value="어드벤쳐">어드벤쳐</option>
                        <option value="미스터리">미스터리</option>
                        <option value="가족">가족</option>
                        <option value="전쟁">전쟁</option>
                        <option value="사극">사극</option>
                        <option value="다큐멘터리">다큐멘터리</option>
                        <option value="뮤지컬">뮤지컬</option>
                        <option value="서부극">서부극</option>
                        <option value="공연">공연</option>
                        <option value="게임">게임</option>
                        <option value="리얼리티">리얼리티</option>
                        <option value="토크쇼">토크쇼</option>
                        <option value="스포츠">스포츠</option>
                        <option value="유러피안">유러피안</option>
                    </select>
                    <select name="fav_genre4">
                        <option selected value="" disabled>--선호장르4--</option>
                        <option value="액션">액션</option>
                        <option value="애니메이션">애니메이션</option>
                        <option value="범죄">범죄</option>
                        <option value="드라마">드라마</option>
                        <option value="코미디">코미디</option>
                        <option value="로맨스">로맨스</option>
                        <option value="스릴러">스릴러</option>
                        <option value="호러">호러</option>
                        <option value="SF">SF</option>
                        <option value="성인">성인</option>
                        <option value="판타지">판타지</option>
                        <option value="어드벤쳐">어드벤쳐</option>
                        <option value="미스터리">미스터리</option>
                        <option value="가족">가족</option>
                        <option value="전쟁">전쟁</option>
                        <option value="사극">사극</option>
                        <option value="다큐멘터리">다큐멘터리</option>
                        <option value="뮤지컬">뮤지컬</option>
                        <option value="서부극">서부극</option>
                        <option value="공연">공연</option>
                        <option value="게임">게임</option>
                        <option value="리얼리티">리얼리티</option>
                        <option value="토크쇼">토크쇼</option>
                        <option value="스포츠">스포츠</option>
                        <option value="유러피안">유러피안</option>
                    </select>
                    <select name="fav_genre5">
                        <option selected value="" disabled>--선호장르5--</option>
                        <option value="액션">액션</option>
                        <option value="애니메이션">애니메이션</option>
                        <option value="범죄">범죄</option>
                        <option value="드라마">드라마</option>
                        <option value="코미디">코미디</option>
                        <option value="로맨스">로맨스</option>
                        <option value="스릴러">스릴러</option>
                        <option value="호러">호러</option>
                        <option value="SF">SF</option>
                        <option value="성인">성인</option>
                        <option value="판타지">판타지</option>
                        <option value="어드벤쳐">어드벤쳐</option>
                        <option value="미스터리">미스터리</option>
                        <option value="가족">가족</option>
                        <option value="전쟁">전쟁</option>
                        <option value="사극">사극</option>
                        <option value="다큐멘터리">다큐멘터리</option>
                        <option value="뮤지컬">뮤지컬</option>
                        <option value="서부극">서부극</option>
                        <option value="공연">공연</option>
                        <option value="게임">게임</option>
                        <option value="리얼리티">리얼리티</option>
                        <option value="토크쇼">토크쇼</option>
                        <option value="스포츠">스포츠</option>
                        <option value="유러피안">유러피안</option>
                    </select>
                </div>
                <label for="mbti-wrapper" class="survey-label">MBTI</label>
                <div id="mbti-wrapper" class="mbti-wrapper">
                    <div class="mbti-box">
                        <input type="radio" name="ei" value="E" id="e"><label for="e"
                                                                              class="mbti-font">E</label><br>
                        <input type="radio" name="ei" value="I" id="i"><label for="i"
                                                                              class="mbti-font">I</label>
                    </div>
                    <div class="mbti-box">
                        <input type="radio" name="ns" value="N" id="n"><label for="n"
                                                                              class="mbti-font">N</label><br>
                        <input type="radio" name="ns" value="S" id="s"><label for="s"
                                                                              class="mbti-font">S</label>
                    </div>
                    <div class="mbti-box">
                        <input type="radio" name="ft" value="F" id="f"><label for="f"
                                                                              class="mbti-font">F</label><br>
                        <input type="radio" name="ft" value="T" id="t"><label for="t"
                                                                              class="mbti-font">T</label>
                    </div>
                    <div class="mbti-box">
                        <input type="radio" name="jp" value="J" id="j"><label for="j"
                                                                              class="mbti-font">J</label><br>
                        <input type="radio" name="jp" value="P" id="p"><label for="p"
                                                                              class="mbti-font">P</label>
                    </div>
                    <input type=hidden value="" name="mbti">
                </div>
            </div>
            <button type="submit" id="submitBtn">제출하기</button>
        </form>
    </div>

</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
