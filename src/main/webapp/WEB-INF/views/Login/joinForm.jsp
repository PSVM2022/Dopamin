<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page session="false" %>
<%--  getsession(false)==null  기존에 세션이 없음을 의미.즉,로그인되어있지 않음. --%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%-- jsp 작성할 때만 브라우저 캐싱 금지 --%>
<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('USERID')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<html>
<html lang="ko">

<head>
    <title>도파민!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="<c:url value='/image/favicon.png'/>">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR&family=Noto+Serif&display=swap">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/default.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/user/joinForm.css'/>">
    <%--home.css 부분을 빼고 자기 페이지의 css를 넣으세요--%>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/home.css?20210502'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>
<div class="container">
    <!-- 헤더 컨테이너. 이 페이지는 로그아웃 상태의 페이지 -->
    <header
            class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start border-bottom">
        <a href="<c:url value='/'/>"
           class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none px-3">
            <object data="<c:url value='/image/main_logo.svg' />" width="150" height="96"></object>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
            <li><a href="/psvm/" class="nav-link px-2 link-secondary">홈</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">신규작</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">인기작</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">커뮤니티</a></li>
            <li><a href="<c:url value="/mypage"/>" class="nav-link px-2 link-dark">마이페이지</a></li>
            <li><a href="<c:url value="/item/"/>" class="nav-link px-2 link-dark">상점</a></li>
        </ul>

        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
            <input type="search" class="form-control form-control-dark" placeholder="Search..."
                   aria-label="Search">
        </form>

        <div class="text-end">
            <button type="button" class="btn btn-warning me-2">Login</button>
        </div>
    </header>
</div>


<main>
    <div class="join-container">

        <h1><span style="color: #e0994d;">DOPAMIN </span>SIGN UP</h1>
        <div id="join-table">
            <table>
                <tbody>
                <tr>
                    <th>아이디</th>
                    <td><input type="text" id="user_id" placeholder="아이디를 입력해주세요" autofocus/>
                        (4~20자, 영문 및 숫자 조합)
                        <button id="idCheckBtn">아이디 중복 체크</button>
                        <div id="user_id_msg" class="msg"></div>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td>
                        <input type="password" id="user_pwd" name="user_pwd" placeholder="비밀번호를 입력해주세요"/>
                        (8~15자,영문 대소문자,숫자,특수문자 포함)
                        <div id="user_pwd_msg" class="msg"></div>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td><input type="password" id="pwdCheck"/></td>
                </tr>
                <tr>
                    <th>성</th>
                    <td>
                        <input type="text" id="f_nm" name="f_nm"/>
                        <div id="f_nm_msg" class="msg"></div>
                    </td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td>
                        <input type="text" id="l_nm" name="l_nm"/>
                        <div id="l_nm_msg" class="msg"></div>
                    </td>
                </tr>
                <tr>
                    <th>닉네임</th>
                    <td>
                        <input type="text" id="nic" name="nic"/> (한글만 가능)
                        <div id="nic_msg" class="msg"></div>
                    </td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td>
                        <div id="btdt">
                            <select class="box" id="year">
                                <option disabled selected>출생 연도</option>
                            </select>
                            <select class="box" id="month">
                                <option disabled selected>월</option>
                            </select>
                            <select class="box" id="day">
                                <option disabled selected>일</option>
                            </select>
                        </div>
                        <div id="btdt_msg" class="msg"></div>
                    </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>
                        <input type="text" id="phone_num" name="phone_num" placeholder="전화번호를 입력해주세요"/>
                        (-없이 입력)
                        <div id="phone_num_msg" class="msg"></div>
                    </td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td>
                        <select id="sex" name="sex">
                            <option value="2" selected>--선택--</option>
                            <option value="1">남자</option>
                            <option value="0">여자</option>
                        </select>
                        <div id="sex_msg" class="msg"></div>
                    </td>
                </tr>
                <tr>
                    <th>국적</th>
                    <td>
                        <select id="cnty">
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
                    <th>이메일</th>
                    <td>

                        <div id="email">
                            <input type="text" name="userEmail1" id="userEmail1"
                                   placeholder="이메일">
                            <select name="userEmail2" id="userEmail2">
                                <option>@naver.com</option>
                                <option>@daum.net</option>
                                <option>@gmail.com</option>
                                <option>@hanmail.com</option>
                                <option>@yahoo.co.kr</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td>
                        <div>
                            <button type="button" id="mailCheckBtn">인증번호 전송</button>
                        </div>
                        <div id="authNum-box">
                            <input placeholder="인증번호 6자리" maxlength="6" id="authNum">
                            <button id="authNumCheckBtn">확인</button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>

        </div>
        <button type="submit" id="joinBtn">도파민 회원가입</button>
    </div>

</main>

<footer class="footer mt-auto py-3 bg-light">
    <div class="container">
        <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
            <!-- Left -->
            <div class="me-5 d-none d-lg-block">
                <span>Get connected with us on social networks:</span>
            </div>
            <!-- Left -->

            <!-- Right -->
            <div>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-google"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-linkedin"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-github"></i>
                </a>
            </div>
            <!-- Right -->
        </section>
        <!-- Section: Social media -->

        <!-- Section: Links  -->
        <section class="">
            <div class="container text-center text-md-start mt-5">
                <!-- Grid row -->
                <div class="row mt-3">
                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <!-- Content -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            <i class="fas fa-gem me-3"></i>Company name
                        </h6>
                        <p>
                            Here you can use rows and columns to organize your footer content. Lorem
                            ipsum
                            dolor sit amet, consectetur adipisicing elit.
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Products
                        </h6>
                        <p>
                            <a href="#!" class="text-reset">Angular</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">React</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Vue</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Laravel</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Useful links
                        </h6>
                        <p>
                            <a href="#!" class="text-reset">Pricing</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Settings</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Orders</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Help</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                        <p><i class="fas fa-home me-3"></i> New York, NY 10012, US</p>
                        <p>
                            <i class="fas fa-envelope me-3"></i>
                            info@example.com
                        </p>
                        <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
                        <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
                    </div>
                    <!-- Grid column -->
                </div>
                <!-- Grid row -->
            </div>
        </section>
        <!-- Section: Links  -->

        <!-- Copyright -->
        <div class="text-center p-4 copyright">
            © 2021 Copyright:
            <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
        </div>
        <!-- Copyright -->
    </div>
</footer>

<script>
    $(document).ready(function () {
        $("#authNum-box").hide();
        var now = new Date();
        var year = now.getFullYear();
        var mon = (now.getMonth() + 1) > 9 ? '' + (now.getMonth() + 1) : '0' + (now.getMonth() + 1);
        var day = (now.getDate()) > 9 ? '' + (now.getDate()) : '0' + (now.getDate());
        //년도 selectbox만들기
        for (var i = 1900; i <= year; i++) {
            $('#year').append('<option value="' + i + '">' + i + '년</option>');
        }

        // 월별 selectbox 만들기
        for (var i = 1; i <= 12; i++) {
            var mm = i > 9 ? i : "0" + i;
            $('#month').append('<option value="' + mm + '">' + mm + '월</option>');
        }

        // 일별 selectbox 만들기
        for (var i = 1; i <= 31; i++) {
            var dd = i > 9 ? i : "0" + i;
            $('#day').append('<option value="' + dd + '">' + dd + '일</option>');
        }
        $("#year  > option[value=" + year + "]").attr("selected", "true");
        $("#month  > option[value=" + mon + "]").attr("selected", "true");
        $("#day  > option[value=" + day + "]").attr("selected", "true");
    })


    //아이디 체크 버튼
    $("#idCheckBtn").click(function () {
        $.ajax({
            type: "POST",
            url: "<c:url value='/join/idduplicate'/>",
            data: {id: $("#user_id").val()},
            success: function (res) {
                console.log(res);
                alert(res.msg)
            }
        })
    });

    //회원가입 버튼
    $("#joinBtn").click(function () {
        //비밀번호 확인
        let pwd = document.getElementById('user_pwd');
        let pwdCheck = document.getElementById('pwdCheck');
        if (pwd.value !== pwdCheck.value) {
            alert("비밀번호가 일치하지 않습니다.")
            return;
        }
        if ($("#userEmail1").attr("readonly") == undefined) {
            alert("이메일 본인인증을 해주세요!")
            return;
        }
        let email = $('#userEmail1').val() + $("#userEmail2").val();
        let btdt = $('#year').val() + $('#month').val() + $('#day').val();
        let userDto = {
            "user_id": $('#user_id').val(),
            "user_pwd": $('#user_pwd').val(),
            "f_nm": $('#f_nm').val(),
            "l_nm": $('#l_nm').val(),
            "phone_num": $('#phone_num').val(),
            "cnty": $('#cnty').val(),
            "email": email,
            "nic": $('#nic').val(),
            "btdt": btdt,
            "sex": $('#sex').val()
        };

        console.log(userDto)
        $.ajax({
            type: 'POST',
            url: '<c:url value="/join/join"/>',
            headers: {"content-type": "application/json"},
            dataType: 'text',
            data: JSON.stringify(userDto),
            success: function (response) {
                let result = JSON.parse(response);
                if (result.successJoin !== undefined) {
                    alert(result.successJoin);
                    location.href = "<c:url value="/login/login"/>";
                }
                //{"필드이름": "에러메세지"}
                console.log(result)
                console.log("result.user_id" + result.user_id)
                console.log("result.user_pwd" + result.user_pwd)
                console.log("result.f_nm+" + result.f_nm)
                console.log("result.l_nm" + result.l_nm)
                console.log("result.phone_num" + result.phone_num)
                console.log("result.cnty" + result.cnty)
                console.log("result.email" + result.email)
                console.log("result.nic" + result.nic)
                console.log("result.btdt" + result.btdt)
                console.log("result.sex" + result.sex)
                $("#user_id_msg").html(result.user_id = (result.user_id !== undefined ? result.user_id : ""));
                $("#user_pwd_msg").html(result.user_pwd = (result.user_pwd !== undefined ? result.user_pwd : ""));
                $("#f_nm_msg").html(result.f_nm = (result.f_nm !== undefined ? result.f_nm : ""));
                $("#l_nm_msg").html(result.l_nm = (result.l_nm !== undefined ? result.l_nm : ""));
                $("#nic_msg").html(result.nic = (result.nic !== undefined ? result.nic : ""));
                $("#btdt_msg").html(result.btdt = (result.btdt !== undefined ? result.btdt : ""));
                $("#phone_num_msg").html(result.phone_num = (result.phone_num !== undefined ? result.phone_num : ""));
                $("#sex_msg").html(result.sex = (result.sex !== undefined ? result.sex : ""));
                $("#cnty_msg").html(result.cnty = (result.cnty !== undefined ? result.cnty : ""));
                $("#email_msg").html(result.email = (result.email !== undefined ? result.email : ""));
            },
            error: function () {
                alert("error")
            }
        });
    });

    //인증번호 전송 버튼
    $('#mailCheckBtn').click(function () {

        const email = $('#userEmail1').val() + $('#userEmail2').val();
        console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인

        if ($('#userEmail1').val() == "") {
            alert("이메일을 입력해주세요");
            return;
        }

        $.ajax({
            type: 'POST',
            url: '<c:url value ="/join/email"/>',
            data: {email: email},
            success: function (response) {
                alert(response.msg);
                $("#authNum-box").show();
            },
            error: function (){
                alert("다시 시도해주세요.")
            }
        }); // end ajax
    }); // end send eamil

    //확인 버튼
    $("#authNumCheckBtn").click(function () {
        const authNum = $("#authNum").val();

        $.ajax({
            type: "post",
            url: '<c:url value="/join/emailauth"/>',
            data: {authNum: authNum},
            success: function (response) {
                console.log(response)
                if (response.msg === "SUCCESS") {
                    alert("인증이 완료되었습니다.")
                    $("#authNum-box").hide();
                    $("#userEmail1").attr("readonly", true);
                    $("#userEmail2").attr("readonly", true);
                } else {
                    alert("인증번호가 일치하지않습니다.")
                }
            },
            error: function (){
                alert("다시 시도해주세요.")
            }
        });

    });


</script>


</body>

</html>