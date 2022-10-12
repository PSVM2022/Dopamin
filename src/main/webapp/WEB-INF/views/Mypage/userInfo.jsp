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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/user/userInfo.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/home.css'/>">
    <script defer src="<c:url value='/js/mypage/userInfo.js'/>"></script>
</head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>

    <div class="wrapper">
        <h2><span style="color: #e0994d;">DOMAMIN </span>My Information</h2>
        <div class="userInfo-container">
            <div></div>
            <div class="myprofile">
                <img class="myprofile-element" src="${userDto.prf_img}"
                     alt="${userDto.user_id} 프로필 이미지">
                <button class="profile-mod-btn myprofile-element">프로필 변경</button>
                <div class="user-id myprofile-element">${userDto.user_id}</div>
                <div class="user-email myprofile-element">${userDto.email}</div>
                <button class="pwd-mod-btn myprofile-element">비밀번호 변경</button>
            </div>
            <div class="userInfo-content">
                <table frame="void">
                    <tbody>
                    <tr>
                        <th>성</th>
                        <td>
                            <input type="text" id="f_nm" value="${userDto.f_nm}" disabled/>
                            <div id="f_nm_msg" class="msg"></div>
                        </td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>
                            <input type="text" id="l_nm" value="${userDto.l_nm}" disabled/>
                            <div id="l_nm_msg" class="msg"></div>
                        </td>
                    </tr>
                    <tr>
                        <th>닉네임</th>
                        <td>
                            <input type="text" id="nic" value="${userDto.nic}" disabled/>
                            <div id="nic_msg" class="msg"></div>
                        </td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td>
                            <div class="btdt-wrapper userInfo-show">
                                <c:set var="btdtValue" value="${userDto.btdt}"/>
                                <input id="yearValue" value="${fn:substring(btdtValue,0,4)}"
                                       disabled size=2
                                       style="text-align: center">년
                                <input id="monthValue" value="${fn:substring(btdtValue,4,6)}"
                                       disabled size="1"
                                       style="text-align: center">월
                                <input id="dayValue" value="${fn:substring(btdtValue,6,8)}" disabled
                                       size="1"
                                       style="text-align: center">일
                            </div>
                            <div class="userInfo-mod" style="display: none">
                                <select class="box" id="year">
                                </select>
                                <select class="box" id="month">
                                </select>
                                <select class="box" id="day">
                                </select>
                            </div>
                            <div id="btdt_msg" class="msg"></div>
                        </td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>

                            <input type="text" id="phone_num"
                                   value="${userDto.phone_num}" disabled/>
                            <span style="display: none" class="userInfo-mod">(-없이 입력)</span>
                            <div id="phone_num_msg" class="msg"></div>
                        </td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td>
                            <c:set var="sex" value="${userDto.sex==0 ? '여자' : '남자'}"/>
                            <input id="sexValue" class="userInfo-show" disabled value="${sex}">
                            <select id="sex" style="display: none" class="userInfo-mod">
                                <option value="1">남자</option>
                                <option value="0">여자</option>
                            </select>
                            <div id="sex_msg" class="msg"></div>
                        </td>
                    </tr>
                    <tr>
                        <th>국적</th>
                        <td>
                            <input class="userInfo-show" id="cntyValue" value="${userDto.cnty}"
                                   disabled>
                            <select id="cnty" style="display: none" class="userInfo-mod">
                                <option value="GH">가나</option>
                                <option value="NZ">뉴질란드</option>
                                <option value="KR" selected>대한민국</option>
                                <option value="DK">덴마크</option>
                                <option value="DE">독일</option>
                                <option value="RU">러시아</option>
                                <option value="MX">멕시코</option>
                                <option value="US">미국</option>
                                <option value="BR">브라질</option>
                                <option value="SE">스웨덴</option>
                                <option value="CH">스위스</option>
                                <option value="SG">싱가포르</option>
                                <option value="IS">아이슬란드</option>
                                <option value="IE">아일란드</option>
                                <option value="IN">인도</option>
                                <option value="ID">인도네시아</option>
                                <option value="JP">일본</option>
                                <option value="ZM">잠비아</option>
                                <option value="CN">중국</option>
                                <option value="PT">포르투갈</option>
                                <option value="PL">폴란드</option>
                                <option value="FR">프랑스</option>
                                <option value="PH">필리핀</option>
                                <option value="HU">헝가리</option>
                            </select>
                            <div id="cnty_msg" class="msg"></div>
                        </td>
                    </tr>
                    <tr>
                        <th>MBTI</th>
                        <td>
                            <input class="userInfo-show" id="mbtiValue" value="${userDto.mbti}"
                                   disabled>
                            <select id="mbti" style="display: none" class="userInfo-mod">
                                <option value="ENFJ">ENFJ</option>
                                <option value="ENTJ">ENTJ</option>
                                <option value="ENFP">ENFP</option>
                                <option value="ENTP">ENTP</option>
                                <option value="ESFP">ESFP</option>
                                <option value="ESFJ">ESFJ</option>
                                <option value="ESTP">ESTP</option>
                                <option value="ESTJ">ESTJ</option>
                                <option value="INFP">INFP</option>
                                <option value="INFJ">INFJ</option>
                                <option value="INTP">INTP</option>
                                <option value="ISTP">ISTP</option>
                                <option value="ISFP">ISFP</option>
                                <option value="INFJ">INFJ</option>
                                <option value="ISTJ">ISTJ</option>
                                <option value="INTJ">INTJ</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>선호 장르</th>
                        <td>
                            <input class="userInfo-show" id="fg1Value" value="${userDto.fav_genre1}"
                                   size=9 disabled/>
                            <input class="userInfo-show" id="fg2Value" value="${userDto.fav_genre2}"
                                   size=9 disabled/>
                            <input class="userInfo-show" id="fg3Value" value="${userDto.fav_genre3}"
                                   size=9 disabled/>
                            <input class="userInfo-show" id="fg4Value" value="${userDto.fav_genre4}"
                                   size=9 disabled/>
                            <input class="userInfo-show" id="fg5Value" value="${userDto.fav_genre5}"
                                   size=9 disabled/>

                            <div class="userInfo-mod" style="display: none">
                                <select id="fav_genre1">
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
                                <select id="fav_genre2">
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
                                <select id="fav_genre3">
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
                                <select id="fav_genre4">
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
                                <select id="fav_genre5">
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
                        </td>
                    </tr>
                    </tbody>
                </table>

                <button class="userInfo-btn" id="register-btn">등록</button>

                <button class="userInfo-btn" id="mod-btn">내 정보 수정</button>
            </div>
        </div>
    </div>

    <div class="modal hidden">
        <div class="bg"></div>
        <div class="modal-box">
            <img src="${userDto.prf_img}" alt="${userDto.user_id} 프로필 이미지" id="mod-profile-img">
            <input type="file" onchange="readURL(this)" id="uploadImg">
            <div class="modal-btns">
                <button type="button" class="closeBtn">닫기</button>
                <button id="mod-profileImg">변경</button>
            </div>
        </div>
    </div>


</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>