<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>

<html lang="ko">
<head>
    <title>도파민!</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/item/psvm.css'/>">
    <c:import url="/WEB-INF/views/common/default.jsp"/>
</head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>
    <section class="container py-5">
        <header class="py-5 bg-image-full" style="height:20rem; background-image: url('${empty myPageDto.item_img ? 'https://dummyimage.com/600x400/ff7800/ffffff&text=DOPAMIN' : myPageDto.item_img}')">
            <div class="text-center my-5">
                <img class="img-fluid rounded-circle mb-4" src="${myPageDto.prf_img}" style="height:20rem;width:20rem;" alt="..."/>
                <h1 class="text-black fs-3 fw-bolder">${myPageDto.nic}님</h1>
                <p class="text-black mb-0">
                    <c:choose>
                        <c:when test="${empty myPageDto.fav_genre1}">
                            ${myPageDto.nic}님 설문 조사를 참여해주세요! 설문 링크 첨부
                        </c:when>
                        <c:otherwise>
                            ${myPageDto.nic}님은 ${myPageDto.genre_nm} 장르를
                            좋아하는 ${myPageDto.age}대 ${myPageDto.sex == 0 ? '여성' : '남성'}입니다.
                        </c:otherwise>
                    </c:choose>
                </p>
                <p class="text-black mb-0">dopa_point = ${myPageDto.dopa_point}</p>
            </div>
        </header>
        <div class="content">
            <div class="responsive-content" style="display: flex; margin-top:16rem;">
                <c:forEach var="skin" items="${skinList}">
                    <div class="item_details">
                        <div class="detail-container" id="${skin.item_id}" onclick="equipSkin(${skin.item_id},${skin.equip_stat},${skin.list_id})" style="height:13rem;">
                            <div id="item-img" style="width: 13rem; height: 10rem; margin: 0 auto;">
                                <div class="image-wrap" item_id="${skin.item_id}">
                                    <img id="item-image" src="${skin.item_img}">
                                    <button class="add_cart_btn" style="margin-left: 7rem; margin-top: -0.6rem;">착용하기</button>
                                </div>
                            </div>
                            <div style="padding:0.1rem;">
                                <span class="item_nm">${skin.item_nm}</span>
                                <c:if test="${skin.equip_stat==1}">착용중</c:if>
                            </div>
                                <%--                <div class="item_detail_dsc"> ${skin.item_dsc}</div>--%>
                                <%--                <span class="item_price">${skin.item_price}<span class="point">P</span></span>--%>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="content">
            <div class="responsive-content" style="display: flex; margin-top:2rem;">
                <c:forEach var="skin" items="${profList}">
                    <div class="item_details">
                        <div class="detail-container" id="${skin.item_id}" onclick="equipSkin(${skin.item_id},${skin.equip_stat},${skin.list_id})" style="height:15rem;" style="height:13rem;">
                            <div id="item-img" style="width: 13rem; height: 10rem; margin: 0 auto;">
                                <div class="image-wrap" item_id="${skin.item_id}">
                                    <img id="item-image" src="${skin.item_img}">
                                    <button class="add_cart_btn" style="margin-left: 7rem; margin-top: 0.5rem;">착용하기</button>
                                </div>
                            </div>
                            <div style="padding:0.1rem;">
                                <span class="item_nm">${skin.item_nm}</span>
                                <c:if test="${skin.equip_stat==1}">착용중</c:if>
                            </div>
                                <%--                <div class="item_detail_dsc"> ${skin.item_dsc}</div>--%>
                                <%--                <span class="item_price">${skin.item_price}<span class="point">P</span></span>--%>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <c:import url="/WEB-INF/views/common/footer.jsp"/>
</main>
</body>
<script>
  function equipSkin(item_id, equip_stat, list_id) {

    if (equip_stat == -1) {
      var res = confirm("착용하시면 환불이 불가능합니다. 착용하시겠습니까?")
      if (res == true) {
        $.ajax({
          anyne: true,
          type: 'POST',       // 요청 메서드
          url: '/psvm/mypage/equip',
          data: {
            "item_id": item_id,
            "equip_stat": equip_stat,
            "list_id": list_id
          },
          //// 요청 URI
          // headers: {"content-type": "application/json"}, // 요청 헤더
          success: function (data) {
            console.log(item_id)
            console.log(equip_stat)
            location.replace("myItem")

          },
          error: function () {
            alert("error")
            console.log(item_id)
            console.log(equip_stat)
          } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
        alert("착용되었습니다.")

      } else {
        alert("취소하셨습니다.")
      }
    } else if (equip_stat == 0) {
      var res = confirm("착용하시겠습니까?")
      if (res == true) {
        $.ajax({
          anyne: true,
          type: 'POST',       // 요청 메서드
          url: '/psvm/mypage/equip',
          data: {
            "item_id": item_id,
            "equip_stat": equip_stat,
            "list_id": list_id
          },
          //// 요청 URI
          // headers: {"content-type": "application/json"}, // 요청 헤더
          success: function (data) {
            console.log(item_id)
            console.log(equip_stat)
            location.replace("myItem")

          },
          error: function () {
            alert("error")
            console.log(item_id)
            console.log(equip_stat)
          } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
        alert("착용되었습니다.")

      } else {
        alert("취소하셨습니다.")
      }
    } else {
      var res = confirm("기본이미지를 착용하시겠습니까?")
      if (res == true) {
        $.ajax({
          anyne: true,
          type: 'POST',       // 요청 메서드
          url: '/psvm/mypage/equip',
          data: {
            "item_id": item_id,
            "equip_stat": equip_stat,
            "list_id": list_id
          },
          //// 요청 URI
          // headers: {"content-type": "application/json"}, // 요청 헤더
          success: function (data) {
            console.log(item_id)
            console.log(equip_stat)
            location.replace("myItem")

          },
          error: function () {
            alert("error")
            console.log(item_id)
            console.log(equip_stat)
          } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
        alert("착용되었습니다.")

      } else {
        alert("취소하셨습니다.")
      }
    }
  }
</script>
</html>