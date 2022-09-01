<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>

<html lang="ko">
<head>
    <title>도파민!</title>
    <c:import url="/WEB-INF/views/common/default.jsp"/>
</head>

<body>
<main>
    <section class="container py-5">
        <header class="py-5 bg-image-full"
                style="background-image: url('${empty myPageDto.item_img ? 'https://dummyimage.com/600x400/ff7800/ffffff&text=DOPAMIN' : myPageDto.item_img}')">
            <div class="text-center my-5">
                <img class="img-fluid rounded-circle mb-4" src="${myPageDto.prf_img}" alt="..."/>
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
    </section>
    <div class="content">
        <div class="responsive-content">
            <div>
                <h2>스킨</h2>
                <br>
                <div>
                    <img src="https://dummyimage.com/1200X200/ff00fb/053bff&text=default-skin">
                    기본 스킨
                </div>
                ${s}
                <c:forEach var="skin" items="${skinList}">
                    <div id="${skin.item_id}"
                         onclick="equipSkin(${skin.item_id},${skin.equip_stat},${skin.list_id})">
                        <img src="${skin.item_img}">
                            ${skin.item_nm}
                        <c:if test="${skin.equip_stat==1}">착용중</c:if>

                    </div>

                </c:forEach>
            </div>
            <div>
                <h2>꾸미기</h2>
                <br>
                <img src="https://dummyimage.com/138x102/f5dd05/ff0505&text=default-profile">
                기본 꾸미기
                <c:forEach var="prof" items="${profList}">
                    <div>
                        <img src="${prof.item_img}">
                            ${prof.item_nm}
                    </div>
                </c:forEach>
            </div>
            <i class="fa-brands fa-instagram"></i>
            <i class="fa-brands fa-facebook"></i>
            <i class="fa-brands fa-youtube"></i>

        </div>
        <div class="content-teenager-girl-movie"></div>
    </div>
    </div>
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