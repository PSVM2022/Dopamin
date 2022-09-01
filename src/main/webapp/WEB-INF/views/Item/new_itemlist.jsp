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
    <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/home.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/item/psvm.css'/>">
</head>

<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<div class="container">
    <!-- 헤더 컨테이너. 이 페이지는 로그아웃 상태의 페이지 -->
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
    <div id="item_main_container">
        <div style='width: 20rem; margin: 2rem 5rem -1.1rem; font-family: "Apple SD Gothic Neo", "Noto Sans KR", sans-serif;'>
            <span style="font-size: 1.6rem;">아이템</span><span
                style="font-size: 1.2rem;"> > ${order} </span></div>
        <div id="section">
            <div class="swiper-container">
                <div class="swiper-wrapper" style="height: 21rem;">
                    <c:forEach var="item" items="${list}">
                        <div class="swiper-slide">
                            <div class="item_details">
                                <div class="detail-container" item_id="${item.item_id}">
                                    <div id="item-img"
                                         style="width: 11rem; height: 9rem; margin: 0 auto;">
                                        <div class="image-wrap" item_id="${item.item_id}">
                                            <img id="item-image" src="${item.item_img}">
                                            <button class="add_cart_btn">담기</button>
                                        </div>
                                    </div>
                                    <div style="padding:0.1rem;">
                                        <span class="item_nm">${item.item_nm}</span>
                                        <span class="item_grd">${item.grd_nm}</span>
                                    </div>
                                    <div class="item_detail_dsc"> ${item.item_dsc}</div>
                                    <span class="item_price">${item.item_price}<span
                                            class="point">P</span></span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="swiper-wrapper" style="height: 21rem;">
                    <c:forEach var="item" items="${list}">
                        <div class="swiper-slide">
                            <div class="item_details">
                                <div class="detail-container" item_id="${item.item_id}">
                                    <div id="item-img"
                                         style="width: 11rem; height: 9rem; margin: 0 auto;">
                                        <div class="image-wrap" item_id="${item.item_id}">
                                            <img id="item-image" src="${item.item_img}">
                                            <button class="add_cart_btn">담기</button>
                                        </div>
                                    </div>
                                    <div style="padding:0.1rem;">
                                        <span class="item_nm">${item.item_nm}</span>
                                        <span class="item_grd">${item.grd_nm}</span>
                                    </div>
                                    <div class="item_detail_dsc"> ${item.item_dsc}</div>
                                    <span class="item_price">${item.item_price}<span
                                            class="point">P</span></span>
                                </div>

                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="swiper-prev" style="left:16rem; top:6rem;">
                <div class="material-icons">chevron_left</div>
            </div>
            <div class="swiper-next" style="right:16rem; top:6rem;">
                <div class="material-icons">chevron_right</div>
            </div>
        </div>
    </div>
    <div id="right_ad"></div>
</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
  $(function () {
    new Swiper('.swiper-container', {
      slidesPerView: 5, //한번에 보여줄 개수
      autoplay: false, // 자동 재생 여부
      loop: true, // 반복 재생 여부
      loopAdditionalSlides: 1,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        prevEl: '.swiper-prev',   //이전 슬라이드를 볼 수 있음
        nextEl: '.swiper-next'    //이후 슬라이드를 볼 수 있음
      }
    });
  })
  $(document).ready(function () {
    $(".item_details").on("click", ".add_cart_btn", function () {
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
    })
  })
</script>
</html>
