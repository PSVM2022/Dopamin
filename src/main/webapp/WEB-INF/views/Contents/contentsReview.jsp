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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/home.css' />">
    <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
</head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>
    <section class="container">
        <h4 style="margin-top: 2rem; margin-left: 1rem; margin-bottom: 2rem;">한줄평 모아보기</h4>
        <div class="revw" style="justify-content: center; margin-bottom: 2rem;">
            <c:if test="${reviewDtoList==[]}">
                <br>
                <div>아직 작성된 한줄평이 없습니다. 첫 번째 한줄평을 작성해보세요!</div>
                <!--페이지 고정 사이즈 줄것-->
                <br>
            </c:if>
            <table class="table">
                <thead>
                <tr>
                    <th style="width: 8rem;">작성자</th>
                    <th>한줄평</th>
                    <th>작성일</th>
                </tr>
                </thead>
                <div>
                    <c:forEach var="i" items="${reviewDtoList}">
                        <tr>
                            <td>${i.user_id}</td>
                            <td>${i.revw_body}</td>
                            <td><fmt:formatDate value="${i.in_date}" pattern="yyyy-MM-dd hh:mm:ss"/>
                                <div style="display: flex; width: 11rem;">
                                    <button>좋아요</button>
                                    <button>싫어요</button>
                                    <button>신고</button>
                                </div>
                            </td>
                            <td>
                                <div style="display: flex;">
                                    <input type="button" value="수정" class="updateBtn"
                                           onclick="updateBtn(${i.cnts_id}, ${i.revw_id})">
                                    <input type="button" value="삭제" class="deleteBtn"
                                           onclick="deleteBtn(${i.cnts_id}, ${i.revw_id})">
                                </div>
                            </td>

                        </tr>
                    </c:forEach>
                </div>

            </table>
            <!--한줄평 작성-->
            <hr>
            <div style="display: flex; justify-content: center; margin-top: 2rem; margin-bottom: 2rem;">
                <div><input type="text" name="review" style=" width: 30rem; height: 3rem;"></div>
                <div>
                    <input type="button" value="등록" class="insertBtn"
                           style="width: 6rem; height: 3rem;"
                           onclick="insertBtn(${cnts_id})">
                </div>
            </div>
        </div>
    </section>

</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>

<script>
  //등록 버튼 클릭시 한줄평 작성-> 등록
  function insertBtn(cnts_id) {
    // $("#insertBtn").click(function(){
    //console.log("click");
    //console.log(cnts_id);

    let review = $("input[name=review]").val();
    //console.log(review);

    if (review == [] || review.trim().length == 0) {     //공백 문자열만 들어올 시 처리
      alert("내용을 입력해주세요!")
      return false
    }
    $.ajax({
      type: 'POST',   // 요청 메서드
      url: '/psvm/contents/' + cnts_id + '/writeReview',
      // data: JSON.stringify({cnts_id: cnts_id, revw_body: review}),
      data: {
        "review": review
      },
      // headers: {"content-type": "application/json"}, // 요청 헤더
      success: function () {
        alert("한줄평 등록이 완료되었습니다.")
        location.replace('/psvm/contents/' + cnts_id + '/contentsReview')
      },
      error: function () {// 에러가 발생했을 때, 호출될 함수
        alert("로그인 후 이용 가능합니다.")    //에러를 처리해야하는데 로그인 안한걸 에러로 처리하면 안될듯 수정사항.
      }
    }); // $.ajax()

  };

  //한줄평 수정 -> 유저 본인이 작성한 한줄평인지 alert 띄워줘야함
  function updateBtn(cnts_id, revw_id) {
    // $("#insertBtn").click(function(){
    console.log("click");
    console.log(cnts_id);
    console.log(revw_id);   //여기까지 찍힘

    let revw = $('div.revw', $(this).parent()).text()
    console.log(revw);

    $("input[name=revw]").val(revw);
    $("#updateBtn").attr("revw_id", revw_id);
    console.log(revw);

    if (revw == [] || revw.trim().length == 0) {     //공백 문자열만 들어올 시 처리
      alert("수정할 내용을 입력해주세요!")
      return false
    }

    $.ajax({
      type: 'POST',       // 요청 메서드
      url: '/psvm/contents/' + cnts_id + '/modifyReview',
      data: {
        data: {
          "review": review
        }
      },
      // headers: {"content-type": "application/json"}, // 요청 헤더
      success: function () {
        alert("한줄평 수정이 완료되었습니다.")
        location.replace('/psvm/contents/' + cnts_id + '/contentsReview')
      },
      error: function () {// 에러가 발생했을 때, 호출될 함수
        alert("잠시 후 다시 시도해주세요.")
      }
    }); // $.ajax()
  };

  //한줄평 삭제 -> 유저 본인이 작성한 한줄평인지 alert 띄워줘야함
  function deleteBtn(cnts_id, revw_id) {
    //let revw_id = $(this).parent().attr("deleteBtn");
    //console.log(revw_id);
    //console.log(cnts_id);
    //console.log("click");

    $.ajax({
      type: 'POST',       // 요청 메서드
      url: '/psvm/contents/' + cnts_id + '/deleteReview',
      data: {
        "revw_id": revw_id
      },
      success: function () {
        alert("한줄평이 삭제되었습니다.")
        location.replace('/psvm/contents/' + cnts_id + '/contentsReview')
      },
      error: function () {// 에러가 발생했을 때, 호출될 함수
        alert("삭제 권한이 없습니다.")
        //location.replace('/psvm/contents/' + cnts_id + '/testReviewView')
      }
    }); // $.ajax()
  };
</script>

</html>