<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false"%>
<html>
<html lang="ko">

<head>
    <title>도파민!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="/image/favicon.png">
    <link rel="stylesheet" type="text/css" href="css/common/normalize.css">
    <link rel="stylesheet" type="text/css" href="css/common/default.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR&family=Noto+Serif&display=swap');
    </style>
</head>

<body>

<div class="topnav">
    <div class="responsive">
        <div class="logo-wrapper">
            <img src="image/logo_example.svg" width="50" height="30">
        </div>
        <a class="topnav-menu" href="#" onclick='alert("홈으로 페이지 전환")'>홈</a>
        <a class="topnav-menu" href="#" onclick='alert("신규작 페이지로 이동")'>신규작</a>
        <a class="topnav-menu" href="#" onclick='alert("인기작 페이지로 이동")'>인기작</a>
        <a class="topnav-menu" href="#" onclick='alert("커뮤니티에서 게시판봐요")'>커뮤니티</a>
        <a class="topnav-menu" href="#" onclick='alert("룰렛 한판 돌려요")'>이벤트</a>
        <a class="topnav-menu" href="<c:url value="/login/login"/>" onclick='alert("로그인 페이지로 이동")'>로그인</a>
    </div>
</div>

<div class="content">
    <div class="responsive-content">
        <div class="content-movie">
            <form method="post" action="<c:url value="/join/join"/>">
                <label for="user_id">아이디</label>
                <input type="text" id="user_id" name="user_id"/>
                <button type="button" id="idDuplCk">아이디 중복 체크</button>
                <div id="id-dupl-msg" style="color: red"></div>

                <label for="user_pwd">비밀번호</label>
                <input type="password" id="user_pwd" name="user_pwd"/>
                <br>
                <label for="pwdCheck">비밀번호 재확인</label>
                <input type="password" id="pwdCheck" name="pwdCheck"/>
                <div id="msg">
                    <c:if test="${not empty param.msg}">
                        <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg,"utf-8")}</i>
                    </c:if>
                </div>

                <br>
                <label for="f_nm">성</label>
                <input type="text" id="f_nm" name="f_nm"/>

                <label for="l_nm">이름</label>
                <input type="text" id="l_nm" name="l_nm"/>
                <br>
                <label for="phone_num">전화번호(ex)010-1234-1234)</label>
                <input type="text" id="phone_num" name="phone_num"/>
                <br>

                <label for="cnty">나라</label>
                <input type="text" id="cnty" name="cnty"/>
                <br>

                <label for="email">email</label>
                <input type="email" id="email" name="email"/>
                <button type="button">이메일 인증</button>
                <br>

                <label for="nic">닉네임</label>
                <input type="text" id="nic" name="nic"/>
                <br>

                <label for="btdt">생년월일</label>
                <input type="text" id="btdt" name="btdt"/>
                <br>

                <label for="sex">성별</label>
                <select autofocus id="sex" name="sex">
                    <option>남자</option>
                    <option>여자</option>
                </select>
                <br>

                <%--    <label>선호 장르를 선택해주세요(최소 1개, 최대 5개)</label>--%>
                <%--    <input type="radio" value="1" name="fav_genre1">액션--%>
                <%--    <input type="radio" value="2" name="fav_genre2">로맨스--%>
                <%--    <input type="radio" value="3" name="fav_genre3">코미디--%>
                <%--    <input type="radio" value="4" name="fav_genre4">공포--%>
                <%--    <input type="radio" value="5" name="fa_genre5">스릴러--%>

                <button type="submit">회원가입</button>
            </form>

        </div>

        <i class="fa-brands fa-instagram"></i>
        <i class="fa-brands fa-facebook"></i>
        <i class="fa-brands fa-youtube"></i>
        <div class="content-preview">
            class속성이 responsive-content인 div태크 하단부터 태그를 넣어 내용을 작성하시면 됩니다.
        </div>
        <div class="content-teenager-girl-movie"></div>

    </div>
</div>


<div class="footer">
    <div>about</div>
    <div>2022 PSVM팀</div>
</div>
<script>
    // $(document).ready(function(){
    //     let user_id = $("#user_id");
    //     alert(user_id);
    //     let idcheck = {"user_id":user_id};
    //     $("#idDuplCk").click(function(){
    //         $.ajax({
    //             type:'POST',       // 요청 메서드
    //             url: '/psvm/join/join/idduplck',  // 요청 URI
    //             headers : { "content-type": "application/json"}, // 요청 헤더
    //             dataType : 'text', // 전송받을 데이터의 타입
    //             data : JSON.stringify(idcheck),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
    //             success : function(response){
    //                 console(response);
    //                 console(response["count"])
    //                 msg = JSON.parse(response);    // 서버로부터 응답이 도착하면 호출될 함수
    //                 alert(msg);       // result는 서버가 전송한 데이터
    //             },
    //             // error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
    //         });
    //
    //     });
    // });

    $("#idDuplCk").click(function(){
        let user_id = $('#user_id').val();
        let id = {"user_id":user_id};
        $.ajax({
            type:'POST',       // 요청 메서드
            url: '/psvm/join/join/idduplck',  // 요청 URI
            headers : { "content-type": "application/json"}, // 요청 헤더
            dataType : 'text', // 전송받을 데이터의 타입
            data : JSON.stringify(id),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
            success : function(response){
                let count = JSON.parse(response);    // 서버로부터 응답이 도착하면 호출될 함수
                if(count==0){
                    document.getElementById("id-dupl-msg").innerText="사용 가능한 아이디입니다.";
                }else{
                    document.getElementById("id-dupl-msg").innerText="사용 불가한 아이디입니다.";
                }       // result는 서버가 전송한 데이터
            },
            // error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
        });

    });

</script>
</body>

</html>