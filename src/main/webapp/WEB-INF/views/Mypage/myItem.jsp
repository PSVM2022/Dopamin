<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>

<html lang="ko">

<head>
    <title>도파민!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="<c:url value='/image/favicon.png' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='css/common/default.css' />">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
          integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR&family=Noto+Serif&display=swap');
    </style>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

</head>

<body>

<div class="topnav">
    <div class="responsive">
        <div class="logo-wrapper">
            <img alt="" src="<c:url value='/image/logo_example.svg' />" width="50" height="30">
        </div>
        <a class="topnav-menu" href="#" onclick='alert("홈으로 페이지 전환")'>홈</a>
        <a class="topnav-menu" href="#" onclick='alert("신규작 페이지로 이동")'>신규작</a>
        <a class="topnav-menu" href="#" onclick='alert("인기작 페이지로 이동")'>인기작</a>
        <a class="topnav-menu" href="#" onclick='alert("커뮤니티에서 게시판봐요")'>커뮤니티</a>
        <a class="topnav-menu" href="#" onclick='alert("룰렛 한판 돌려요")'>이벤트</a>
    </div>
</div>
<section class="container py-5">

    <header class="py-5 bg-image-full"
            style="background-image: url('${empty myPageDto.item_img ? 'https://dummyimage.com/600x400/ff7800/ffffff&text=DOPAMIN' : myPageDto.item_img}')">
        <div class="text-center my-5">
            <img class="img-fluid rounded-circle mb-4" src="${myPageDto.prf_img}" alt="..."/>
            <h1 class="text-black fs-3 fw-bolder">${myPageDto.nic}님</h1>
            <p class="text-black mb-0">
                <c:choose>
                    <c:when test="${empty myPageDto.fav_genre1}">
                        ${myPageDto.nic}님 설문 조사를 참여해주세요! 설문 링크 첨부
                    </c:when>
                    <c:otherwise>
                        ${myPageDto.nic}님은 ${myPageDto.genre_nm} 장르를
                        좋아하는 ${myPageDto.age}대 ${myPageDto.sex == 0 ? '여성' : '남성'}입니다.
                    </c:otherwise>
                </c:choose>
            </p>
            <p class="text-black mb-0">dopa_point = ${myPageDto.dopa_point}</p>
        </div>
    </header>
</section>

<div class="content">
    <div class="responsive-content">
        <div>

            <header class="user-skin"
                    style="background-image: url('${empty myPageDto.item_img ? 'https://dummyimage.com/600x400/ff7800/ffffff&text=_' : myPageDto.item_img}')">
            </header>
            <div class="user-profile">
                <img class="user_profile_img" src="${myPageDto.prf_img}" alt="..."/>
                <h1 class="user_nickname">${myPageDto.nic}님</h1>
            </div>
        </div>
        <div>
            <h2>스킨</h2>
            <c:forEach var="skin" items="${skinList}">
                <div id="${skin.item_id}" onclick="equipSkin(${skin.item_id},${skin.equip_stat},${skin.list_id})">
                    <img src="${skin.item_img}">
                        ${skin.item_nm}
                    <c:if test="${skin.equip_stat==1}">착용중</c:if>
                </div>
            </c:forEach>
        </div>
        <div>
            <h2>꾸미기</h2>
            <c:forEach var="prof" items="${profList}">
                <div id="${prof.item_id}" onclick="equipSkin(${prof.item_id},${prof.equip_stat},${prof.list_id})">
                    <img src="${prof.item_img}">
                        ${prof.item_nm}
                    <c:if test="${prof.equip_stat==1}">착용중</c:if>
                </div>
            </c:forEach>
        </div>
        <i class="fa-brands fa-instagram"></i>
        <i class="fa-brands fa-facebook"></i>
        <i class="fa-brands fa-youtube"></i>

    </div>
    <div class="content-teenager-girl-movie"></div>

</div>
</div>


<div class="footer">
    <div>about</div>
    <div>2022 PSVM팀</div>
</div>

<script>
    function equipSkin(item_id, equip_stat, list_id) {

        if (equip_stat == -1) {
            var res = confirm("착용하시면 환불이 불가능합니다. 착용하시겠습니까?")
            if (res == true) {
                $.ajax({
                    anyne: true,
                    type: 'POST',       // 요청 메서드
                    url: '/psvm/mypage/equip',
                    data: {
                        "item_id": item_id,
                        "equip_stat": equip_stat,
                        "list_id": list_id
                    },
                    //// 요청 URI
                    // headers: {"content-type": "application/json"}, // 요청 헤더
                    success: function (data) {
                        console.log(item_id)
                        console.log(equip_stat)
                        location.replace("myItem")

                    },
                    error: function () {
                        alert("error")
                        console.log(item_id)
                        console.log(equip_stat)
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
                alert("착용되었습니다.")

            } else {
                alert("취소하셨습니다.")
            }
        } else if (equip_stat == 0) {
            var res = confirm("착용하시겠습니까?")
            if (res == true) {
                $.ajax({
                    anyne: true,
                    type: 'POST',       // 요청 메서드
                    url: '/psvm/mypage/equip',
                    data: {
                        "item_id": item_id,
                        "equip_stat": equip_stat,
                        "list_id": list_id
                    },
                    //// 요청 URI
                    // headers: {"content-type": "application/json"}, // 요청 헤더
                    success: function (data) {
                        console.log(item_id)
                        console.log(equip_stat)
                        location.replace("myItem")

                    },
                    error: function () {
                        alert("error")
                        console.log(item_id)
                        console.log(equip_stat)
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
                alert("착용되었습니다.")

            } else {
                alert("취소하셨습니다.")
            }
        } else {
            var res = confirm("기본이미지를 착용하시겠습니까?")
            if (res == true) {
                $.ajax({
                    anyne: true,
                    type: 'POST',       // 요청 메서드
                    url: '/psvm/mypage/equip',
                    data: {
                        "item_id": item_id,
                        "equip_stat": equip_stat,
                        "list_id": list_id
                    },
                    //// 요청 URI
                    // headers: {"content-type": "application/json"}, // 요청 헤더
                    success: function (data) {
                        console.log(item_id)
                        console.log(equip_stat)
                        location.replace("myItem")

                    },
                    error: function () {
                        alert("error")
                        console.log(item_id)
                        console.log(equip_stat)
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
                alert("착용되었습니다.")

            } else {
                alert("취소하셨습니다.")
            }
        }


    }


</script>

</body>

</html>