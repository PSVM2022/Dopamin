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

<div class="content">
    <div class="responsive-content">
        <div>
            <h2>스킨</h2>
            <br>
            <div>
                <img src="https://dummyimage.com/1200X200/ff00fb/053bff&text=default-skin">
                기본 스킨
            </div>
            <c:forEach var="skin" items="${skinList}">
                <div id="${skin.item_id}" onclick="equipSkin(${skin.item_id},${skin.equip_stat},${skin.list_id})">
                    <img src="${skin.item_img}">
                        ${skin.item_nm}
                </div>

            </c:forEach>
        </div>
        <div>
            <h2>꾸미기</h2>
            <br>
            <img src="https://dummyimage.com/138x102/f5dd05/ff0505&text=default-profile">
            기본 꾸미기
            <c:forEach var="prof" items="${profList}">
                <div>
                    <img src="${prof.item_img}">
                        ${prof.item_nm}
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
    function equipSkin(item_id, equip_stat,list_id) {
        if (equip_stat == -1){
            alert("착용하시면 환불 안됌!")
        }

        $.ajax({
            anyne:true,
            type: 'POST',       // 요청 메서드
            url: '/psvm/mypage/equip',
            data:  {
                "item_id": item_id,
                "equip_stat": equip_stat,
                "list_id": list_id
            },
            //// 요청 URI
            // headers: {"content-type": "application/json"}, // 요청 헤더
            success: function(data) {
                console.log(item_id)
                console.log(equip_stat)
                alert("성공")

            },
            error: function () {
                alert("error")
                console.log(item_id)
                console.log(equip_stat)
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()

    }


</script>

</body>

</html>