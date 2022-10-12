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
        url: "/psvm/join/idduplicate",
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
        url: '/psvm/join/join',
        headers: {"content-type": "application/json"},
        dataType: 'text',
        data: JSON.stringify(userDto),
        success: function (response) {
            let result = JSON.parse(response);
            if (result.successJoin !== undefined) {
                alert(result.successJoin);
                location.href = "/psvm/login/login";
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
        url: '/psvm/join/email',
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
        url: '/psvm/join/emailauth',
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
