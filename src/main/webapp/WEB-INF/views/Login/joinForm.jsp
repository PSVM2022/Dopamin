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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/user/joinForm.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/home.css'/>">
</head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>
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
                        <input type="password" id="user_pwd" name="user_pwd"
                               placeholder="비밀번호를 입력해주세요"/>
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
                        <input type="text" id="phone_num" name="phone_num"
                               placeholder="전화번호를 입력해주세요"/>
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
<c:import url="/WEB-INF/views/common/footer.jsp"/>
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
    let
        userDto = {
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
        $("#user_id_msg").html(
            result.user_id = (result.user_id !== undefined ? result.user_id : ""));
        $("#user_pwd_msg").html(
            result.user_pwd = (result.user_pwd !== undefined ? result.user_pwd : ""));
        $("#f_nm_msg").html(result.f_nm = (result.f_nm !== undefined ? result.f_nm : ""));
        $("#l_nm_msg").html(result.l_nm = (result.l_nm !== undefined ? result.l_nm : ""));
        $("#nic_msg").html(result.nic = (result.nic !== undefined ? result.nic : ""));
        $("#btdt_msg").html(result.btdt = (result.btdt !== undefined ? result.btdt : ""));
        $("#phone_num_msg").html(
            result.phone_num = (result.phone_num !== undefined ? result.phone_num : ""));
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
      error: function () {
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
      error: function () {
        alert("다시 시도해주세요.")
      }
    });

  });
</script>
</body>
</html>