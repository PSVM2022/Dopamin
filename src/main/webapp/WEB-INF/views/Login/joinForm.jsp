<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<html lang="ko">

<head>
    <title>도파민!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="<c:url value='/image/favicon.png' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/default.css' />">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
          integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR&family=Noto+Serif&display=swap');

        .msg {
            height: 30px;
            text-align: center;
            font-size: 16px;
            color: red;
            margin-bottom: 20px;
        }
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
            <label for="user_id">아이디</label>
            <input type="text" id="user_id" name="user_id"/>
            <div id="user_id_msg" class="msg"></div>
            <div id="user_id_msg2" class="msg"></div>
            <button type="button" id="idDuplCheck">아이디 중복 체크</button>
            <div id="idDupleCheckMsg" class="msg"></div>
            <label for="user_pwd">비밀번호</label>
            <input type="password" id="user_pwd" name="user_pwd"/>
            <div id="user_pwd_msg" class="msg"></div>

            <label for="pwdCheck">비밀번호 재확인</label>
            <input type="password" id="pwdCheck" name="pwdCheck"/>
            <div id="pwd_check_msg">

            </div>

            <br>
            <label for="f_nm">성</label>
            <input type="text" id="f_nm" name="f_nm"/>
            <div id="f_nm_msg" class="msg"></div>

            <label for="l_nm">이름</label>
            <input type="text" id="l_nm" name="l_nm"/>
            <div id="l_nm_msg" class="msg"></div>

            <br>
            <label for="phone_num">전화번호(ex)010-1234-1234)</label>
            <input type="text" id="phone_num" name="phone_num"/>
            <div id="phone_num_msg" class="msg"></div>
            <br>

            <label for="cnty">나라</label>
            <input type="text" id="cnty" name="cnty"/>
            <div id="cnty_msg" class="msg"></div>
            <br>

                <%--            <label for="email">email</label>--%>
                <%--            <input type="email" id="email" name="email"/>--%>
                <%--            <button type="button">이메일 인증</button>--%>
                <%--            <div id="email_msg" class="msg"></div>--%>
                <%--            <br>--%>
                <div class="form-group email-form">
                    <label for="userEmail1">이메일</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일">
                        <select class="form-control" name="userEmail2" id="userEmail2">
                            <option name="@naver.com">@naver.com</option>
                            <option value="@daum.net">@daum.net</option>
                            <option value="@gmail.com">@gmail.com</option>
                            <option value="@hanmail.com">@hanmail.com</option>
                        </select>
                    </div>

                    <div class="input-group-addon">
                        <button type="button" class="btn btn-primary" id="emailCheckBtn">본인인증</button>
                    </div>
                    <div class="mail-check-box">
                        <input class="form-control mail-check-input" placeholder="인증번호 입력" disabled="disabled"
                               maxlength="6">
                    </div>
                </div>
                <span id="mail-check-warn"></span>
            </div>

            <label for="nic">닉네임</label>
            <input type="text" id="nic" name="nic"/>
            <div id="nic_msg" class="msg"></div>
            <br>

            <label for="year">생년월일</label>
            <input type="text" id="year" name="year"/>년<input type="text" id="month" name="month"/>월<input type="text"
                                                                                                           id="day" name="day"/>일
            <div id="btdt_msg" class="msg"></div>
            <br>
            <label for="sex">성별</label>
            <select autofocus id="sex" name="sex">
                <option value="0">남자</option>
                <option value="1">여자</option>
            </select>
            <div id="sex_msg" class="msg"></div>
            <button type="submit" id="joinBtn">회원가입</button>

        </div>

        <i class="fa-brands fa-instagram"></i>
        <i class="fa-brands fa-facebook"></i>
        <i class="fa-brands fa-youtube"></i>
        <div class="content-preview">
            class속성이 responsive-content인 div태크 하단부터 태그를 넣어 내용을 작성하시면 됩니다.
        </div>
        <div class="content-teenager-girl-movie"></div>

    </div>

    <div class="footer">
        <div>about</div>
        <div>2022 PSVM팀</div>
    </div>

    <script>
        function pwdCheck() {
            let pwd = document.getElementById('user_pwd');
            let pwdCheck = document.getElementById('pwdCheck');
            let pwd_check_msg = document.getElementById('pwd_check_msg');
            if (pwd.value == pwdCheck.value) {
                pwd_check_msg.innerHTML = "비밀번호 일치";
            } else {
                pwd_check_msg.style.color = "#ff0000"
                pwd_check_msg.innerHTML = "비밀번호 불일치";
            }
        }

        //이메일 인증 버튼
        $("#emailCheckBtn").click(function () {
            let useremail1 = $('[name="userEmail1"]').val();
            let useremail2 = $('[name="userEmail2"]').val();
            console.log(useremail1);
            console.log(useremail2);
            const email =$('#userEmail1').val() + $('#userEmail2').val();//이메일
            // const email =useremail1 + useremail2;//이메일
            console.log("client 이메일=" + email);

            const checkInput = $(".mail-check-input") //인증번호 입력칸
            $.ajax({
                type: 'GET',
                url: '/psvm/join/mailCheck?email='+email,
                success: function (data) {
                    console.log("data=" + data)
                    //응답오면 인증번호 입력칸 활성화.
                    checkInput.attr('disabled', false);
                    let authCode = data;
                    alert("인증번호가 전송되었습니다.")
                }
            });//end ajax
        });
        $(".mail-check-input").blur(function (){
            const inputCode = $(this).val();
            const $resultMsg = $('#mail-check-warn');

            if(inputCode === code){
                $resultMsg.html("인증번호가 일치합니다.");
                $resultMsg.css('color','green');
                $('#mail-Check-Btn').attr('disabled',true);
                $('#userEamil1').attr('readonly',true);
                $('#userEamil2').attr('readonly',true);
                $('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
                $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
            }else{

        // let user_id = {"user_id":$("#user_id").val()};

        $("#idDuplCheck").click(function () {
            let userId = $("#user_id").val();
            let json = {userId: $("#user_id").val()};
            console.log(json);
            $.ajax({
                type: 'POST',
                url: '/psvm/join/idduplck',
                headers: {"content-type": "application/json"},
                dataType: 'text',
                data: json,
                success: function (result) {
                    msg = JSON.parse(result);
                    console.log(result.ID_CHECK)
                    console.log(msg.ID_CHECK);
                    // if(msg.ID_CHECK == "ID_DUPLE_OK"){
                    //     alert("사용가능한 아이디입니다.")
                    //     $("#id_duple_check").html("사용 가능한 아이디입니다.")
                    // }else{
                    //     $("#id_duple_check").html("중복된 아이디입니다.")
                    // }
                },
                error: function () {
                    alert("error")
                }
            }); // $.ajax()

        //회원가입 버튼
        $("#joinBtn").click(function(){
            //비밀번호 확인
            let pwd = document.getElementById('user_pwd');
            let pwdCheck = document.getElementById('pwdCheck');
            let pwd_check_msg = document.getElementById('pwd_check_msg');
            if(pwd.value != pwdCheck.value){
                pwd_check_msg.style.color = "#ff0000"
                pwd_check_msg.innerHTML = "비밀번호 불일치";
                return;
            }else{
                pwd_check_msg.innerHTML = "";
            }

            let btdt = $('#year').val() + $('#month').val() + $('#day').val();
            let userDto = {"user_id": $('#user_id').val(), "user_pwd": $('#user_pwd').val(), "f_nm": $('#f_nm').val(), "l_nm":$('#l_nm').val(), "phone_num" : $('#phone_num').val(),
                "cnty":$('#cnty').val(), "email":$('#email').val(), "nic" : $('#nic').val(), "btdt":btdt, "sex": $('#sex').val()};
            $.ajax({
                type:'POST',
                url: '<c:url value="/join/join"/>',
                headers : { "content-type": "application/json"},
                dataType : 'text',
                data : JSON.stringify(userDto),
                success : function(response){
                    let result = JSON.parse(response);
                    //회원가입 성공하면
                    if(result.successJoin!==undefined){
                        alert(result.successJoin);
                        location.href="/psvm/login/login";
                    }
                    console.log(result)
                    console.log(result.user_id)
                    console.log(result.user_pwd)
                    console.log(result.f_nm)
                    console.log(result.l_nm)
                    console.log(result.phone_num)
                    console.log(result.cnty)
                    console.log(result.email)
                    console.log(result.nic)
                    console.log(result.btdt)
                    console.log(result.sex)
                    console.log(result.id_dupl_err);
                    $("#user_id_msg").html(result.user_id=(result.user_id!==undefined ? result.user_id : ""));
                    $("#user_id_msg").html(result.user_id=(result.id_dupl_err!==undefined ? result.id_dupl_err : ""));
                    $("#user_pwd_msg").html(result.user_pwd=(result.user_pwd!==undefined ? result.user_pwd : ""));
                    $("#f_nm_msg").html(result.f_nm=(result.f_nm!==undefined ? result.f_nm : ""));
                    $("#l_nm_msg").html(result.l_nm=(result.l_nm!==undefined ? result.l_nm : ""));
                    $("#phone_num_msg").html(result.phone_num=(result.phone_num!==undefined ? result.phone_num : ""));
                    $("#cnty_msg").html(result.cnty=(result.cnty!==undefined ? result.cnty : ""));
                    $("#email_msg").html(result.email=(result.email!==undefined ? result.email : ""));
                    $("#nic_msg").html(result.nic=(result.nic!==undefined ? result.nic : ""));
                    $("#btdt_msg").html(result.btdt=(result.btdt!==undefined ? result.btdt : ""));
                    $("#sex_msg").html(result.sex=(result.sex!==undefined ? result.sex : ""));
                },
                error   : function(){ alert("error") }
            });
        });
    </script>

</body>

</html>