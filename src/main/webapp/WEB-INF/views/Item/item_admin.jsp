<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('USERID')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
  <title>도파민!</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="<c:url value='/image/favicon.png' />">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css' />">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/default.css' />">

  <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/item.css?after' />">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
        integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR&family=Noto+Serif&display=swap');
  </style>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>

    $(document).ready(function(){
      $('ul.tabs li').click(function(){
        var tab_id = $(this).attr('data-tab');
        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');
        $(this).addClass('current');
        $("#"+tab_id).addClass('current');
      });
      $('#multi2').on("click",".btn-Noshow",function(){
        let item_id=$(this).parent().attr("data-item_id");
        $.ajax({
          type:'PATCH',
          url:'/psvm/item/showtonoshow/'+item_id,
          success:function(result){
            alert(result)
            location.reload()
          },
          error:function(){
            alert("error")
          }
        })
      });
      $('#multi1').on("click",".btn-show",function(){
        let item_id=$(this).parent().attr("data-item_id");
        $.ajax({
          type:'PATCH',
          url:'/psvm/item/noshowtoshow/'+item_id,
          success:function(result){
            alert(result)
            location.reload();
          },
          error:function(){
            alert("error")
          }
        })
      });
      $('#multi1').on("click",".btn-modify",function(){

      });
      $('#multi1').on("click",".btn-delete",function(){
        let item_id=$(this).parent().attr("data-item_id");
        $.ajax({
          type:'DELETE',
          url:'/psvm/item/remove/'+item_id,
          success:function(result){
            alert(result)
            location.reload();

          },
          error:function(){
            alert("error")
          }
        })
      });
      $('#registerButton').click(function(){
        $(location).attr("href","/psvm/item/register");
      });
    });

    let msg = "${msg}";
    if(msg!="") alert(msg);
  </script>

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
    <a class="topnav-menu" href="/psvm/item/" onclick='alert("충동 구매는 당신의 지갑을 얇게 만들수 있습니다.")'>상점</a>
  </div>
</div>
<button id="registerButton">등록</button>
<h1 class="css-1uk7quv" style="display: flex; align-items: center;">관리자 페이지</h1>
<div class="container">
  <ul class="tabs">
    <li class="tab-link current" data-tab="tab-1">비공개</li>
    <li class="tab-link" data-tab="tab-2">공개</li>
  </ul>
  <div id="tab-1" class="tab-content current">
    <div id="multi1" class="css-2xlufz">
      <c:forEach var="item" items="${list_0}">
        <div class="css-r3v8jq">
          <div class="item_id"><input type="hidden" id="item_id" value="${item.item_id}"></div>
          <div class="item_img"><img src=${item.item_img} alt=${item.item_nm} class="css-1e19vwe"></div>
          <div class="css-lvz7a2"><input id="item_nm" class="css-lvz7a2" value="${item.item_nm}"></div>
          <div class="css-7kyp67">
            <textarea id="item_dsc" class="css-lvz7a2">
                ${item.item_dsc}
            </textarea>
            <br>
            <br>
          </div>
          <div class="css-t6a2j8">
            <img src="https://static.solved.ac/coin/coin-small.svg" alt="Coins" class="css-16sxkvf">
            <input id="item_price" class="css-t6a2j8" value="${item.item_price}">
            <br>
          </div>
          <div class="bottom" data-item_id="${item.item_id}">
            <button class="btn-show">공개</button>
            <button class="btn-modify">수정</button>
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
          <img src=${item.item_img} alt=${item.item_nm} class="css-1e19vwe">
          <div class="css-lvz7a2"></div>
          <div class="css-7kyp67">${item.item_dsc}
            <br>
            <br>
          </div>
          <div class="css-t6a2j8">
            <img src="https://static.solved.ac/coin/coin-small.svg" alt="Coins" class="css-16sxkvf">
              ${item.item_price}
            <br>
          </div>
          <div class="bottom" data-item_id="${item.item_id}">
            <button class="btn-Noshow">비공개</button>
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
</body>
</html>
