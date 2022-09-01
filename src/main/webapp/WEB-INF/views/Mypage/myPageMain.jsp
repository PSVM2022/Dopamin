<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('USERID')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>

<html lang="ko">
<head>
    <title>도파민!</title>
    <c:import url="/WEB-INF/views/common/default.jsp"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/myPageMain.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/user/myPage2.css'/>">
</head>
<body>

<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>
    <section class="container">
        <div class="user-skin"
             style="background-image: url('${empty myPageDto.item_img ? 'https://dummyimage.com/600x400/ff7800/ffffff&text=_' : myPageDto.item_img}')">
        </div>

        <div class="user-profile">
            <img class="user_profile_img" src="${myPageDto.prf_img}" alt="..."/>
            <h1 class="user_nickname">${myPageDto.nic}님</h1>
            <p class="user_info">
                <c:choose>
                    <c:when test="${empty myPageDto.fav_genre1}">
                        ${myPageDto.nic}님 설문 조사를 참여해주세요! 설문 링크 첨부
                    </c:when>
                    <c:otherwise>
                        ${myPageDto.nic}님은 ${myPageDto.fav_genre1} 장르를
                        좋아하는 ${myPageDto.age}대 ${myPageDto.sex == 0 ? '여성' : '남성'}입니다.
                    </c:otherwise>
                </c:choose>
            </p>
            <p>dopa_point = ${myPageDto.dopa_point}</p>
        </div>

        <div><h2 class="mypage_h2">활동 기록</h2></div>

        <div class="list">
            <div class="list_col">
                <div class="mypage_carda">
                    <div class="mypage_cardb"
                         onclick="location.href='/psvm/mypage/revw'">
                        <div class="mypage-cardc"><i
                                class="fa-solid fa-comment mypage-icon"></i></div>
                        <h2 class="mypage-title">Contents Review</h2>
                        <p class="mypage-subtitle">작성한 컨텐츠 한줄평을 확인하세요!</p>
                    </div>
                </div>
            </div>

            <div class="list_col">
                <div class="mypage_carda">
                    <div class="mypage_cardb"
                         onclick="location.href='/psvm/mypage/revwrt'">
                        <div class="mypage-cardc"><i
                                class="fa-solid fa-thumbs-up mypage-icon"></i></div>
                        <h2 class="mypage-title">Review Like</h2>
                        <p class="mypage-subtitle">좋아요 누른 한줄평을 확인하세요!</p>
                    </div>
                </div>
            </div>

            <div class="list_col">
                <div class="mypage_carda">
                    <div class="mypage_cardb"
                         onclick="location.href='/psvm/mypage/cntswish'">
                        <div class="mypage-cardc"><i
                                class="fa-solid fa-heart mypage-icon"></i></div>
                        <h2 class="mypage-title">Contents Wish</h2>
                        <p class="mypage-subtitle">찜한 컨텐츠를 확인하세요!</p>
                    </div>
                </div>
            </div>

            <div class="list_col">
                <div class="mypage_carda">
                    <div class="mypage_cardb"
                         onclick="location.href='/psvm/mypage/cntsview'">
                        <div class="mypage-cardc"><i
                                class="fa-solid fa-circle-play mypage-icon"></i>
                        </div>
                        <h2 class="mypage-title">Contents View</h2>
                        <p class="mypage-subtitle">조회한 컨텐츠를 확인하세요!</p>
                    </div>
                </div>
            </div>

            <div class="list_col">
                <div class="mypage_carda">
                    <div class="mypage_cardb"
                         onclick="location.href='/psvm/mypage/post'">
                        <div class="mypage-cardc"><i class="fa-solid fa-face-smile mypage-icon"></i>
                        </div>
                        <h2 class="mypage-title">Community Post</h2>
                        <p class="mypage-subtitle">작성한 게시물를 확인하세요!!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="container">
        <h2 class="mypage_h2">회원 정보</h2>

        <div class="list">

            <div class="list_col">
                <div class="mypage_carda">
                    <div class="mypage_cardb" id="userInfo">
                        <div class="mypage-cardc"><i class="fa-solid fa-user mypage-icon"></i></div>
                        <h2 class="mypage-title">Edit User Info</h2>
                        <p class="mypage-subtitle">회원정보를 수정하세요!</p>
                    </div>
                </div>
            </div>

            <div class="list_col">
                <div class="mypage_carda">
                    <div class="mypage_cardb"
                         onclick="location.href='<c:url
                                 value="mypage/point"/>'">
                        <div class="mypage-cardc"><i
                                class="fa-solid fa-coins mypage-icon"></i></div>
                        <h2 class="mypage-title">Points</h2>
                        <p class="mypage-subtitle">포인트 사용 내역을 확인하세요!</p>
                    </div>
                </div>
            </div>

            <div class="list_col">
                <div class="mypage_carda">
                    <div class="mypage_cardb" onclick="location.href='<c:url
                            value="mypage/myItem"/>'">
                        <div class="mypage-cardc"><i
                                class="fa-solid fa-gift mypage-icon"></i></div>
                        <h2 class="mypage-title">My Items</h2>
                        <p class="mypage-subtitle">보유 아이템 목록을 확인하세요!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!--회원 정보 수정 비밀번호 확인 모달 -->
    <div class="modal hidden">
        <div class="bg"></div>
        <div class="modal-box">
            <h5>비밀번호 확인</h5>
            <form action="<c:url value="/mypage/userInfo"/>" method="post"
                  onsubmit="pwdCheck();">
                <input type="password" name="pwd" id="pwd"
                       placeholder="비밀번호 입력">
                <div class="modal-btns">
                    <button type="button" class="closeBtn">닫기</button>
                    <button type="submit">확인</button>
                </div>
            </form>
        </div>
    </div>


</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
    function pwdCheck() {
        console.log("pwd=", $("#pwd").val())
        if ($("#pwd").val() == "") {
            alert("비밀번호를 입력해주세요!")
            event.preventDefault();
        }
    }

    const open = () => {
        console.log("모달창열기")
        document.querySelector(".modal").classList.remove("hidden");
    }
    const close = () => {
        console.log("닫기")
        document.querySelector(".modal").classList.add("hidden");
    }
    document.querySelector("#userInfo").addEventListener("click", open);
    document.querySelector(".closeBtn").addEventListener("click", close);
    document.querySelector(".bg").addEventListener("click", close);

</script>
</html>