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
</head>

<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<div class="container">
    <div id="main_bar" style="justify-content: center;text-align: center;">
        <div class="dropdown" style="margin-left: -1rem;">
            <span class="item_menu" onclick="location.href='/psvm/item/item'" style="cursor:hand"
                  onfocus="blur();">상점</span>
            <div class="dropdown-content">
                <div class="category">
                    <a href="/psvm/item/list/스킨" class="skin">스킨</a>
                </div>
                <div class="category">
                    <a href="/psvm/item/list/꾸미기" class="skin">꾸미기</a>
                </div>
            </div>
        </div>
        <span class="item_menu" onclick="location.href='/psvm/item/cart'" style="cursor:hand"
              onfocus="blur();">장바구니</span>
        <span class="item_menu">포인트사용내역</span>
        <span class="item_menu" onclick="location.href='/psvm/item/chargePoint'" style="cursor:hand"
              onfocus="blur();">충전샵</span>
        <span class="item_menu">마이페이지</span>
    </div>
</div>
<main style="display: flex;">

    <div id="left_ad"></div>
    <div id="item_ main_container" style="width: 85rem;">
        <%--    <a href="/psvm/item/cart_main">장바구니</a>--%>
        <div class="banner">
            <div id="rullet"><img src="https://i.ytimg.com/vi/i7aqOvCzaq8/maxresdefault.jpg"
                                  style="width: 70rem; height: 28rem;">
                <img src="https://avatars.githubusercontent.com/u/110664772?s=64&v=4"
                     style="margin-top: -27.2rem; margin-left: 1.6rem; width: 7.6rem; height: 5.5rem;">
            </div>
        </div>
        <div id="section" style="display: flex;justify-content: center;padding: 0rem 0;">
        </div>
    </div>
    <div id="right_ad"></div>
</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
  $(document).ready(function () {
    let toHtml = function (items) {
      let tmp = '';
      items.forEach(function (item) {

        tmp += '<div class="item_details">';

        tmp += '<div class="detail-container" item_id=' + item.item_id + '>';

        tmp += '<div id="item-img" style="width: 11rem; height: 9rem; margin: 0 auto;">';

        tmp += '<div class="image-wrap" item_id=' + item.item_id + '>';

        tmp += '<img id="item-image" src=' + item.item_img + '>'

        tmp += '<button class="add_cart_btn">담기</button>';

        tmp += '</div>';

        tmp += '</div>';

        tmp += '<div style="padding:0.1rem;">';

        tmp += '<span class="item_nm">' + item.item_nm + '</span>';

        tmp += '<span class="item_grd">' + item.grd_nm + '</span>'

        tmp += '</div>';

        tmp += '<div class="item_detail_dsc">' + item.item_dsc + '</div>';

        tmp += '<span class="item_price">' + item.item_price
            + '<span class="point">P</span></span>';

        tmp += '</div>';

        tmp += '</div>';

      })
      return tmp + '</div>';
    }
    $(document).ready(function () {
      $("#section").on("click", ".add_cart_btn", function () {
        let item_id = $(this).parent().attr("item_id");
        console.log("item_id=" + item_id);
        if (confirm("장바구니에 담으시겠습니까?")) {
          $.ajax({
            type: 'POST',
            url: '/psvm/item/addCart/' + item_id,
            success: function (result) {
              alert("장바구니에 담겼습니다.");
              if (confirm("장바구니로 바로 가시겠습니까?")) {
                location.href = "/psvm/item/cart";
              }
            },
            error: function (request, status, error) {
              var result = JSON.parse(request.responseText);
              alert(result["message1"]);
            }
          })
        }
      });
      $.ajax({
        type: 'GET',
        url: '/psvm/item/main',
        success: function (result) {
          console.log(result);
          //해당 태크가 지우고
          $('#section').html(toHtml(result));
        },
        error: function () {
          alert("잠시후 다시 시도해주세요.");
        }
      });
    })
  })
</script>
</html>
