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
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>

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
    <%--home.css 부분을 빼고 자기 페이지의 css를 넣으세요--%>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/home.css?20210502'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/item/psvm.css?after'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/item/item.css?after' />">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer">
    </script>
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
                    error:function(request,status,error){
                        var result=JSON.parse(request.responseText);
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
                    error:function(request,status,error){
                        var result=JSON.parse(request.responseText);
                        alert(result["message1"]);
                    }
                })
            });
            $('#multi1').on("click", ".btn-modify", function () {
                console.log("modify-clicked");
                if(confirm("수정하시겠습니까?")){
                    let item_id = $(this).parent().attr("data-item_id");
                    console.log(item_id);
                    $('#'+item_id+'_nm_input').css("display", "block");
                    $('#'+item_id+'_grd_input').css("display", "block");
                    $('#'+item_id+'_dsc_input').css("display", "block");
                    $('#'+item_id+'_price_input').css("display", "block");
                    $('#'+item_id+'_price_input1').css("display", "block");
                    $('#'+item_id+'_btn').css("display", "block");

                    $('#'+item_id+'_nm').css("display", "none");
                    $('#'+item_id+'_grd').css("display", "none");
                    $('#'+item_id+'_dsc').css("display", "none");
                    $('#'+item_id+'_price').css("display", "none");
                    $('#'+item_id+'_btn_input').css("display", "none");
                    $(".item_input css-t6a2j8").css("display","inline-flex");

                    $('#'+item_id+'_btn').click(function(){
                        console.log("modify-register-clicked");
                        let item_id = $(this).parent().attr("data-item_id");
                        let item_nm=$('#'+item_id+'_nm_input').val();
                        let item_grd=$('#'+item_id+'_grd_input').val();
                        let item_dsc=$('#'+item_id+'_dsc_input').val();
                        let item_price=$('#'+item_id+'_price_input1').val();
                        if(item_nm==''){
                            alert("이름 입력해주세요!");
                            return;
                        }
                        if(item_grd!='1등급'&&item_grd!='2등급'&&item_grd!='3등급'&&item_grd!='4등급'&&item_grd!='5등급'){
                            alert("등급 양식은 0등급 입니다.");
                            return;
                        }
                        if(item_dsc==''){
                            alert("설명을 작성해주세요.");
                            return;
                        }
                        if(item_dsc.length>30){
                            alert("설명은 30글자 이하입니다.");
                            return;
                        }
                        if(!$.isNumeric(item_price)){
                            alert("가격은 숫자만 가능합니다!");
                        }
                        console.log(item_nm);
                        console.log(item_grd);
                        console.log(item_dsc);
                        console.log(item_price);

                        let dto={"item_id":item_id,"item_nm":item_nm,"item_grd":item_grd,"item_dsc":item_dsc,"item_price":item_price}

                        if(confirm("등록하시겠습니까?")){
                            //ajax통신
                            console.log(dto);
                            $.ajax({
                                type:'PATCH',
                                url:'/psvm/item/modify',
                                headers : { "content-type": "application/json"},
                                data:JSON.stringify(dto),
                                success:function(data){
                                    alert("아이템이 수정되었습니다.");
                                    location.reload();
                                },
                                error:function(request,status,error){
                                    var result=JSON.parse(request.responseText);
                                    alert(result["message1"]);
                                }
                            })
                        }
                    });
                }
            });
            $('#multi1').on("click", ".btn-delete", function () {
                let item_id = $(this).parent().attr("data-item_id");
                if(confirm("삭제하시겠습니까? 삭제 시, 복구가 불가합니다.")){
                    $.ajax({
                        type: 'DELETE',
                        url: '/psvm/item/remove/' + item_id,
                        success: function (result) {
                            alert(result)
                            location.reload();

                        },
                        error: function () {
                            alert("error")
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
</head>

<body>
<div class="container">
    <header
            class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start border-bottom">
        <a href="<c:url value='/'/>"
           class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none px-3">
            <object data="<c:url value='/image/main_logo.svg' />" width="150" height="96"></object>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
            <li><a href="#" class="nav-link px-2 link-secondary">홈</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">신규작</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">인기작</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">커뮤니티</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">이벤트</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">상점</a></li>
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
                                <div class="item_img"><img src=${item.item_img} alt=${item.item_nm} class="css-1e19vwe"></div>
                                <div class="css-lvz7a2" style="display:flex">
                                    <span id="${item.item_id}_nm" class="item_nm">${item.item_nm}</span>
                                    <input id="${item.item_id}_nm_input" class="item_input" value="${item.item_nm}" style="display:none; width:6rem;">
                                    <span id="${item.item_id}_grd" class="item_grd" style="margin-left: 7rem;">${item.grd_nm}</span>
                                    <input id="${item.item_id}_grd_input" class="item_input" value="${item.grd_nm}" style="display:none; width:4rem; margin-left:3rem;" >
                                </div>
                                <div id="${item.item_id}_dsc" class="item_dsc css-7kyp67" style="font-size:12px">${item.item_dsc}
                                    <br>
                                    <br>
                                </div>
                                <textarea id="${item.item_id}_dsc_input" class="item_input" value="${item.item_dsc}" style="display:none; min-height: 5.4rem; max-height: 5.4rem;"></textarea>
                                <div id="${item.item_id}_price" class="item_price css-t6a2j8">
                                    <img src="https://static.solved.ac/coin/coin-small.svg" alt="Coins"
                                         class="css-16sxkvf">
                                        ${item.item_price}
                                    <br>
                                </div>
                                <div id="${item.item_id}_price_input" class="item_input" style="display:none">
                                    <div class="css-t6a2j8" style="display:inline-flex;">
                                        <img src="https://static.solved.ac/coin/coin-small.svg" alt="Coins" class="css-16sxkvf" style="margin-left: 5rem; margin-top: 0.3rem;">
                                        <input id="${item.item_id}_price_input1" class="item_input" value="${item.item_price}" style="display:none; width:4rem;">
                                        <br>
                                    </div>
                                </div>
                                <div class="bottom" data-item_id="${item.item_id}" style="margin-top: -1rem; margin-left: 3rem; display:flex">
                                    <button class="btn-show">공개</button>
                                    <button id="${item.item_id}_btn_input" class="btn-modify">수정</button>
                                    <button id="${item.item_id}_btn" class="btn-modify-register" style="display:none;">등록</button>
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
                                <div class="item_img"><img src=${item.item_img} alt=${item.item_nm} class="css-1e19vwe"></div>
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
                                    <button class="btn-Noshow" style="margin-top: -1rem;margin-left: 5.4rem;">비공개</button>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <%--  <div id="modalWin" class="modal">--%>
                <%--    <!-- Modal content -->--%>
                <%--    <div class="modal-content">--%>
                <%--      <span class="close">&times;</span>--%>
                <%--      <p>--%>
                <%--      <h2> 아이템 수정</h2>--%>
                <%--      <div id="modify-writebox">--%>
                <%--        <div class="commenter commenter-writebox"></div>--%>
                <%--        <div class="modify-writebox-content">--%>
                <%--          <textarea name="" id="" cols="30" rows="5" placeholder="댓글을 남겨보세요"></textarea>--%>
                <%--        </div>--%>
                <%--        <div id="modify-writebox-bottom">--%>
                <%--          <div class="register-box">--%>
                <%--            <a href="#" class="btn" id="btn-write-modify">등록</a>--%>
                <%--          </div>--%>
                <%--        </div>--%>
                <%--      </div>--%>
                <%--      </p>--%>
                <%--    </div>--%>
                <%--  </div>--%>
            </div>
        </div>
    </div>
</main>

</body>

</html>
