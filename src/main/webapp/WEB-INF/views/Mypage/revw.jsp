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
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('USERID')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<html>
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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/revw.css'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer">
    </script>

</head>

<body>
<div class="container">
<main>
    <section class="container">
        <h2 class="revw-h2">Contents Review</h2>
<%--        <div class="table-responsive">--%>
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
                        <td><a class="revw-title" href='<c:url value="/contents/${revw.cnts_id}"/>'>${revw.cnts_title}</a></td>
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
</main>

<footer class="footer mt-auto py-3 bg-light">
    <div class="container">
        <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
            <!-- Left -->
            <div class="me-5 d-none d-lg-block">
                <span>Get connected with us on social networks:</span>
            </div>
            <!-- Left -->

            <!-- Right -->
            <div>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-google"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-linkedin"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-github"></i>
                </a>
            </div>
            <!-- Right -->
        </section>
        <!-- Section: Social media -->
    </div>

</footer>

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

</body>

</html>

