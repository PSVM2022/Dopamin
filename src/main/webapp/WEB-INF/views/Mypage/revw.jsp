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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/revw.css'/>">
</head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>

    <section class="container">
        <h2 class="revw-h2">Contents Review</h2>
        <div>
            <table class="revw-table">
                <thead>
                <tr>
                    <th><input type="checkbox" id="allCheck" name="allCheck"></th>
                    <th>#</th>
                    <th>컨텐츠 제목</th>
                    <th>내용</th>
                    <th>등록일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="revw" items="${revwDtoList}">
                    <tr>
                        <th>
                            <input type="checkbox" name="revwId" value="${revw.revw_id}"></th>
                        <td>${revw.revw_id}</td>
                        <td><a class="revw-title"
                               href='<c:url value="/contents/${revw.cnts_id}"/>'>${revw.cnts_title}</a>
                        </td>
                        <td>${revw.revw_body}</td>
                        <td><fmt:formatDate value="${revw.up_date}" pattern="yyyy.MM.dd"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div>
            <input type="button" class="revw-btn" value="선택삭제" onclick="deleteValue();">
        </div>
    </section>

    <c:import url="/WEB-INF/views/common/footer.jsp"/>
</main>
</body>
<script type="text/javascript">
  $(function () {
    var chkObj = document.getElementsByName("revwId");
    var rowCnt = chkObj.length;

    $("input[name='allCheck']").click(function () {
      var chk_listArr = $("input[name='revwId']");
      for (var i = 0; i < chk_listArr.length; i++) {
        chk_listArr[i].checked = this.checked;
      }
    });
    $("input[name='revwId']").click(function () {
      if ($("input[name='revwId']:checked").length == rowCnt) {
        $("input[name='allCheck']")[0].checked = true;
      } else {
        $("input[name='allCheck']")[0].checked = false;
      }
    });
  });

  function deleteValue() {
    var valueArr = new Array();
    var list = $("input[name='revwId']");
    for (var i = 0; i < list.length; i++) {
      if (list[i].checked) { //선택되어 있으면 배열에 값을 저장함
        valueArr.push(list[i].value);
      }
    }
    console.log(valueArr)

    if (valueArr.length == 0) {
      alert("선택된 한줄평이 없습니다.");
    } else {
      var chk = confirm("정말 삭제하시겠습니까?");
      $.ajax({
        url: '/psvm/mypage/deleterevw',                    // 전송 URL
        type: 'POST',                // POST 방식
        headers: {"content-type": "application/json"},
        data: JSON.stringify(valueArr),
        success: function () {
          alert("삭제 성공");
          location.replace("revw")
        },
        error: function () {
          alert("error")
        } // 에러가 발생했을 때, 호출될 함수
      });
    }
  }
</script>
</html>

