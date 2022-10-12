//프로필 변경 버튼
$("#mod-profileImg").click(function () {

    console.log("clickclclclclclcl")
    var formData = new FormData();

    formData.append("uploadImg", $("#uploadImg")[0].files[0]);

    if (formData.get("uploadImg") == null) {
        alert("이미지를 업로드해주세요.");
    }

    $.ajax({
        url: '/psvm/mypage/modifyprfimg',
        type: 'POST',
        data: formData,
        success: function (response) {
            location.reload();
        },
        error: function (request, status, error) {
            alert("error");
        },
        contentType: false,
        processData: false,
    })

})

function readURL(input) {
    console.log(input.files)
    console.log(input.files[0])
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById('mod-profile-img').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    } else {
        document.getElementById('mod-profile-img').src = "";
    }
}

$(document).ready(function () {

    $("#register-btn").hide();
    var now = new Date();
    var year = now.getFullYear();
    //한자리 수 앞에 0붙이기 ex) 01,02,03
    var mon = (now.getMonth() + 1) > 9 ? '' + (now.getMonth() + 1) : '0' + (now.getMonth() + 1);
    var day = (now.getDate()) > 9 ? '' + (now.getDate()) : '0' + (now.getDate());
    console.log(mon)
    console.log(day)
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
    $("#year  > option[value=" + $("#yearValue").val() + "]").attr("selected", "true");
    $("#month  > option[value=" + $("#monthValue").val() + "]").attr("selected", "true");
    $("#day  > option[value=" + $("#dayValue").val() + "]").attr("selected", "true");

    if ($("#sexValue").val() == "여자") {
        $("#sex").val(0).attr("selected", true);
    } else {
        $("#sex").val(1).attr("selected", true);
    }

    $("#mbti").val($("#mbtiValue").val()).attr("selected", true);
    $("#fav_genre1").val($("#fg1Value").val()).attr("selected", true);
    $("#fav_genre2").val($("#fg2Value").val()).attr("selected", true);
    $("#fav_genre3").val($("#fg3Value").val()).attr("selected", true);
    $("#fav_genre4").val($("#fg4Value").val()).attr("selected", true);
    $("#fav_genre5").val($("#fg5Value").val()).attr("selected", true);

    let cnties = {
        "GH": "가나",
        "NZ": "뉴질란드",
        "KR": "대한민국",
        "DK": "덴마크",
        "DE": "독일",
        "RU": "러시아",
        "MX": "멕시코",
        "US": "미국",
        "BR": "브라질",
        "SE": "스웨덴",
        "CH": "스위스",
        "SG": "싱가포르",
        "IS": "아이슬란드",
        "IE": "아일란드",
        "IN": "인도",
        "ID": "인도네시아",
        "JP": "일본",
        "ZM": "잠비아",
        "CN": "중국",
        "PT": "포르투갈",
        "PL": "폴란드",
        "FR": "프랑스",
        "PH": "필리핀",
        "HU": "헝가리",
    }

    $("#cnty").val($("#cntyValue").val()).attr("selected", true);
    $("#cntyValue").val(cnties[$("#cntyValue").val()])
    console.log($("#cntyValue").val())

})

//수정하기 버튼
$("#mod-btn").click(function () {
    $("input").attr("disabled", false);
    $(".userInfo-show").hide();
    $(".userInfo-mod").show();
    $("#mod-btn").hide();
    $("#register-btn").show();

});

//등록 버튼
$("#register-btn").click(function () {

    let btdt = $('#year').val() + $('#month').val() + $('#day').val();
    let userDto = {
        "f_nm": $('#f_nm').val(),
        "l_nm": $('#l_nm').val(),
        "nic": $('#nic').val(),
        "btdt": btdt,
        "phone_num": $('#phone_num').val(),
        "sex": $('#sex').val(),
        "cnty": $('#cnty').val(),
        "mbti": $("#mbti").val(),
        "fav_genre1": $('#fav_genre1').val(),
        "fav_genre2": $('#fav_genre2').val(),
        "fav_genre3": $('#fav_genre3').val(),
        "fav_genre4": $('#fav_genre4').val(),
        "fav_genre5": $('#fav_genre5').val(),
    };

    console.log(userDto)
    $.ajax({
        type: 'POST',
        url: '/psvm/mypage/modifyuserinfo',
        headers: {"content-type": "application/json"},
        dataType: 'text',
        data: JSON.stringify(userDto),
        success: function (response) {
            let result = JSON.parse(response);
            alert(result.msg);
            location.reload();
        },
        error: function () {
            alert("에러!!")
        }
    });

});

const open = () => {
    console.log("모달창열기")
    document.querySelector(".modal").classList.remove("hidden");
}
const close = () => {
    console.log("닫기")
    document.querySelector(".modal").classList.add("hidden");
}
document.querySelector(".profile-mod-btn").addEventListener("click", open);
document.querySelector(".closeBtn").addEventListener("click", close);
document.querySelector(".bg").addEventListener("click", close);

