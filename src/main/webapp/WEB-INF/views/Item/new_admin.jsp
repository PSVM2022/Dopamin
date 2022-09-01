<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false" %>

<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>

<html lang="ko">
<head>
    <title>도파민!</title>
    <c:import url="/WEB-INF/views/common/default.jsp"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/home.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/item/psvm.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/item/item.css' />">
</head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>
    <div style="display: flex">
        <div>
            <ul id="nav">
                <li><a href="/psvm/item/item_admin">아이템 관리자</a>
                    <ul>
                        <li><a href="/psvm/item/item_admin">아이템 관리</a></li>
                        <li><a href="/psvm/item/register">아이템 등록</a></li>
                    </ul>
                </li>
                <li><a href="#">메인 메뉴</a>
                    <ul>
                        <li><a href="#">1-1</a></li>
                        <li><a href="#">1-2</a></li>
                    </ul>
                </li>
                <li><a href="#">메인 메뉴</a>
                    <ul>
                        <li><a href="#">1-1</a></li>
                        <li><a href="#">1-2</a></li>
                    </ul>
                </li>
                <li><a href="#">메인 메뉴</a>
                    <ul>
                        <li><a href="#">1-1</a></li>
                        <li><a href="#">1-2</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div id="admin_content">
            <span class="admin_title">아이템 관리</span>
            <br>
            <div class="container1">
                <ul class="tabs">
                    <li class="tab-link current" data-tab="tab-1">비공개</li>
                    <li class="tab-link" data-tab="tab-2">공개</li>
                </ul>
                <div id="tab-1" class="tab-content current">
                    <div id="multi1" class="css-2xlufz">
                        <c:forEach var="item" items="${list_0}">
                            <div class="css-r3v8jq">
                                <div class="item_img"><img src=${item.item_img} alt=${item.item_nm} class="css-1e19vwe">
                                </div>
                                <div class="css-lvz7a2" style="display:flex">
                                    <span id="${item.item_id}_nm" class="item_nm">${item.item_nm}</span>
                                    <input id="${item.item_id}_nm_input" class="item_input" value="${item.item_nm}"
                                           style="display:none; width:6rem;">
                                    <span id="${item.item_id}_grd" class="item_grd"
                                          style="margin-left: 7rem;">${item.grd_nm}</span>
                                    <input id="${item.item_id}_grd_input" class="item_input" value="${item.grd_nm}"
                                           style="display:none; width:4rem; margin-left:3rem;">
                                </div>
                                <div id="${item.item_id}_dsc" class="item_dsc css-7kyp67"
                                     style="font-size:12px">${item.item_dsc}
                                    <br>
                                    <br>
                                </div>
                                <textarea id="${item.item_id}_dsc_input" class="item_input" value="${item.item_dsc}"
                                          style="display:none; min-height: 5.4rem; max-height: 5.4rem;"></textarea>
                                <div id="${item.item_id}_price" class="item_price css-t6a2j8">
                                    <img src="https://static.solved.ac/coin/coin-small.svg" alt="Coins"
                                         class="css-16sxkvf">
                                        ${item.item_price}
                                    <br>
                                </div>
                                <div id="${item.item_id}_price_input" class="item_input" style="display:none">
                                    <div class="css-t6a2j8" style="display:inline-flex;">
                                        <img src="https://static.solved.ac/coin/coin-small.svg" alt="Coins"
                                             class="css-16sxkvf" style="margin-left: 5rem; margin-top: 0.3rem;">
                                        <input id="${item.item_id}_price_input1" class="item_input"
                                               value="${item.item_price}" style="display:none; width:4rem;">
                                        <br>
                                    </div>
                                </div>
                                <div class="bottom" data-item_id="${item.item_id}"
                                     style="margin-top: -1rem; margin-left: 3rem; display:flex">
                                    <button class="btn-show">공개</button>
                                    <button id="${item.item_id}_btn_input" class="btn-modify">수정</button>
                                    <button id="${item.item_id}_btn" class="btn-modify-register" style="display:none;">
                                        등록
                                    </button>
                                    <button class="btn-delete">삭제</button>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div id="tab-2" class="tab-content">
                    <div id="multi2" class="css-2xlufz">
                        <c:forEach var="item" items="${list_1}">
                            <div class="css-r3v8jq">
                                <div class="item_img"><img src=${item.item_img} alt=${item.item_nm} class="css-1e19vwe">
                                </div>
                                <div class="css-lvz7a2">
                                    <span class="item_nm">${item.item_nm}</span>
                                    <span class="item_grd">${item.grd_nm}</span>
                                </div>
                                <div class="css-7kyp67">${item.item_dsc}
                                    <br>
                                    <br>
                                </div>
                                <div class="css-t6a2j8">
                                    <img src="https://static.solved.ac/coin/coin-small.svg" alt="Coins"
                                         class="css-16sxkvf">
                                        ${item.item_price}
                                    <br>
                                </div>
                                <div class="bottom" data-item_id="${item.item_id}">
                                    <button class="btn-Noshow" style="margin-top: -1rem;margin-left: 5.4rem;">비공개
                                    </button>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
    $(document).ready(function () {
        $('ul.tabs li').click(function () {
            var tab_id = $(this).attr('data-tab');
            $('ul.tabs li').removeClass('current');
            $('.tab-content').removeClass('current');
            $(this).addClass('current');
            $("#" + tab_id).addClass('current');
        });
        $('#multi2').on("click", ".btn-Noshow", function () {
            let item_id = $(this).parent().attr("data-item_id");
            $.ajax({
                type: 'PATCH',
                url: '/psvm/item/showtonoshow/' + item_id,
                success: function (result) {
                    alert("비공개에 성공했습니다.");
                    location.reload()
                },
                error: function (request, status, error) {
                    var result = JSON.parse(request.responseText);
                    alert(result["message1"]);
                }
            })
        });
        $('#multi1').on("click", ".btn-show", function () {
            let item_id = $(this).parent().attr("data-item_id");
            $.ajax({
                type: 'PATCH',
                url: '/psvm/item/noshowtoshow/' + item_id,
                success: function (result) {
                    alert("공개에 성공했습니다.")
                    location.reload();
                },
                error: function (request, status, error) {
                    var result = JSON.parse(request.responseText);
                    alert(result["message1"]);
                }
            })
        });
        $('#multi1').on("click", ".btn-modify", function () {
            console.log("modify-clicked");
            if (confirm("수정하시겠습니까?")) {
                let item_id = $(this).parent().attr("data-item_id");
                console.log(item_id);
                $('#' + item_id + '_nm_input').css("display", "block");
                $('#' + item_id + '_grd_input').css("display", "block");
                $('#' + item_id + '_dsc_input').css("display", "block");
                $('#' + item_id + '_price_input').css("display", "block");
                $('#' + item_id + '_price_input1').css("display", "block");
                $('#' + item_id + '_btn').css("display", "block");

                $('#' + item_id + '_nm').css("display", "none");
                $('#' + item_id + '_grd').css("display", "none");
                $('#' + item_id + '_dsc').css("display", "none");
                $('#' + item_id + '_price').css("display", "none");
                $('#' + item_id + '_btn_input').css("display", "none");
                $(".item_input css-t6a2j8").css("display", "inline-flex");

                $('#' + item_id + '_btn').click(function () {
                    console.log("modify-register-clicked");
                    let item_id = $(this).parent().attr("data-item_id");
                    let item_nm = $('#' + item_id + '_nm_input').val();
                    let item_grd = $('#' + item_id + '_grd_input').val();
                    let item_dsc = $('#' + item_id + '_dsc_input').val();
                    let item_price = $('#' + item_id + '_price_input1').val();
                    if (item_nm == '') {
                        alert("이름 입력해주세요!");
                        return;
                    }
                    if (item_grd != '1등급' && item_grd != '2등급' && item_grd != '3등급' && item_grd != '4등급'
                        && item_grd != '5등급') {
                        alert("등급 양식은 0등급 입니다.");
                        return;
                    }
                    if (item_dsc == '') {
                        alert("설명을 작성해주세요.");
                        return;
                    }
                    if (item_dsc.length > 30) {
                        alert("설명은 30글자 이하입니다.");
                        return;
                    }
                    if (!$.isNumeric(item_price)) {
                        alert("가격은 숫자만 가능합니다!");
                    }
                    let dto = {
                        "item_id": item_id,
                        "item_nm": item_nm,
                        "item_grd": item_grd,
                        "item_dsc": item_dsc,
                        "item_price": item_price
                    }

                    if (confirm("등록하시겠습니까?")) {
                        //ajax통신
                        $.ajax({
                            type: 'PATCH',
                            url: '/psvm/item/modify',
                            headers: {"content-type": "application/json"},
                            data: JSON.stringify(dto),
                            success: function (data) {
                                alert("아이템이 수정되었습니다.");
                                location.reload();
                            },
                            error: function (request, status, error) {
                                var result = JSON.parse(request.responseText);
                                alert(result["message1"]);
                            }
                        })
                    }
                });
            }
        });
        $('#multi1').on("click", ".btn-delete", function () {
            let item_id = $(this).parent().attr("data-item_id");
            if (confirm("삭제하시겠습니까? 삭제 시, 복구가 불가합니다.")) {
                $.ajax({
                    type: 'DELETE',
                    url: '/psvm/item/remove/' + item_id,
                    success: function (result) {
                        alert(result)
                        location.reload();

                    },
                    error: function (request, status, error) {
                        var result = JSON.parse(request.responseText);
                        alert(result["message1"]);
                    }
                })
            }
        });
        $('#registerButton').click(function () {
            $(location).attr("href", "/psvm/item/register");
        });
    });

    let msg = "${msg}";
    if (msg != "") alert(msg);
</script>
</html>
