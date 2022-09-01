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
    <title>${bbsNm} 판 - 도파민</title>
    <c:import url="/WEB-INF/views/common/default.jsp"/>
    <link rel="stylesheet" type="text/css"
          href="<c:url value='/css/page/community/communityPostEditor.css'/>">
    <script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>
</head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>
    <section name="post-editor" class="container py-4">
        <div class="bbs-name">
            <h3><a href="<c:url value='/community/${bbsId}'/>">${bbsNm} 판</a></h3>
        </div>
        <form id="register_post" action="" method="">
            <input name="post_title" id="post_title" class="post-title" type="text"
                   placeholder="제목을 입력해주세요.">
            <input id="editor">
            <div class="content-search-bar">
                <input type="search" placeholder="참조 컨텐츠 검색">
            </div>

            <textarea id="post_body" name="post_body" class="invisible-input"></textarea>
            <input name="bbs_id" class="invisible-input">

            <div class="editor-action">
                <input id="write-post" type="submit" value="등록">
            </div>
        </form>
    </section>
    <c:import url="/WEB-INF/views/common/footer.jsp"/>
</main>
</body>
<script>
  let myEditor
  ClassicEditor.create(document.querySelector('#editor'))
  .then(editor => myEditor = editor)

  let msg = "${msg}"
  if (msg == "error") alert("서버와의 연결에 문제가 생겼습니다.")

  $('#write-post').on('click', function (e) {
    let title = $('#post_title').val()
    let content = myEditor.getData();

    if (!title.length) {
      alert("제목을 입력해주세요")
      return false;
    }

    if (!content.length) {
      alert("내용을 입력해주세요")
      return false;
    }

    $('#post_body').val(myEditor.getData())
    $('input[name=bbs_id]').val(${bbsId})

    let form = $('#register_post')
    form.attr("action", "<c:url value='/community/write'/>")
    form.attr('method', 'post')
    form.submit();
  })
</script>

</html>