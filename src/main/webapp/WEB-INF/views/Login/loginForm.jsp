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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/user/loginForm.css'/>">
</head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>

    <div class="login-container">
        <form action="<c:url value='/login/login'/>" method="post"
              onsubmit="return formCheck(this);">

            <h1><span style="color: #e0994d;">DOPAMIN </span>LOGIN</h1>
            <div class="input-box form-tag">
                <c:choose>
                    <c:when test="${not empty param.id}">
                        <input type="text" name="id" value="${param.id}" autofocus></c:when>
                    <c:when test="${not empty cookie.id.value}">
                        <input type="text" name="id" value="${cookie.id.value}" autofocus></c:when>
                    <c:when test="${not empty param.id and not empty cookie.id.value}">
                        <input type="text" name="id" value="${param.id}" autofocus></c:when>
                    <c:otherwise><input type="text" name="id" placeholder="아이디를 입력하세요"
                                        autofocus></c:otherwise>
                </c:choose>
            </div>
            <div class="input-box form-tag">
                <input type="password" name="pwd" placeholder="비밀번호를 입력하세요">
            </div>
            <input name="toURL" value="${param.toURL}" placeholder="그전 url정보 담기" type="hidden">
            <div id="msg" class="form-tag" style="color: #FF7800">
                <c:if test="${not empty msg}">
                    <i class="fa fa-exclamation-circle"> ${msg}</i>
                </c:if>
            </div>
            <button class="login-btn form-tag">로그인</button>

            <div class="box form-tag">
                <%--아이디 기억 체크안되어있으면, --%>
                <label><input type="checkbox" name="rememberId"
                              value="true" ${empty cookie.id.value ? "":"checked"}> 아이디 기억</label> |
                <label><input type="checkbox" name="rememberLogin"
                              value="true" ${empty cookie.id.value ? "":"checked"}> 로그인 상태
                    유지</label>
            </div>

            <div class="box form-tag">
                <a href="#">아이디 찾기</a> |
                <a href="#">비밀번호 찾기</a> |
                <a href="<c:url value="/join/join"/>">회원가입</a>
            </div>

        </form>
    </div>
</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>

<script>
  function formCheck(frm) {
    let msg = '';
    if (frm.id.value.length == 0) {
      setMessage('<i class="fa fa-exclamation-circle"> 아이디를 입력해주세요.', frm.id);
      return false;
    }
    if (frm.pwd.value.length == 0) {
      setMessage('<i class="fa fa-exclamation-circle"> 비밀번호를 입력해주세요.', frm.pwd);
      return false;
    }
    return true;
  }

  function setMessage(msg, element) {
    document.getElementById("msg").innerHTML = ` ${'${msg}'}`;
    if (element) {
      element.select();
    }
  }
</script>

</body>

</html>
