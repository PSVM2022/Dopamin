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
    <title>${post.post_title} - 도파민</title>
    <c:import url="/WEB-INF/views/common/default.jsp"/>
    <link rel="stylesheet" type="text/css"
          href="<c:url value='/css/page/community/communityPost.css'/>">
    <script type='text/javascript' src="<c:url value='/js/parseTime.js'/>"></script>
</head>

<body>

<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>
    <section name="post-main" class="container py-4">
        <div class="bbs-title">
            <h3><a href="<c:url value='/community/${post.bbs_id}'/>">${bbsNm} 판</a></h3>
        </div>

        <div class="post-target-title">${post.post_title}</div>
        <div class="post-info">
            <div>
                <span class="writer-id">
                    <i class="fa-solid fa-award"></i>
                    ${post.user_id}
                </span>
                <span id="post_time" class="post-time">
                    <i class="fa-solid fa-clock"></i>
                </span>
                <span class="post-views">
                    <i class="fa-solid fa-eye"></i>
                    ${post.post_view_cnt}
                </span>
            </div>
            <div>
                <form id="post_form">
                </form>
            </div>
        </div>
        <div class="post-link">
            <i class="fa-solid fa-link"></i>
            <a href=${nowUrl}>${nowUrl}</a>
        </div>

        <div class="post-content">
            ${post.post_body}
        </div>

        <div class="post-reaction">
            <button>
                <i class="fa-regular fa-thumbs-up"></i>
                좋아요
                <span>12</span>
            </button>
            <button>
                <i class="fa-regular fa-thumbs-up"></i>
                싫어요
            </button>
            <button>
                <i class="fa-solid fa-share-nodes"></i>
                공유
            </button>
        </div>

        <div class="comments-box">
            <div class="comment-cnt">
                <i class="fa-solid fa-comments"></i>
                <span>14</span>
                개의 댓글
            </div>

            <div class="comment">
                <div class="comment-user-info">
                    <span class="writer-id">
                        <i class="fa-solid fa-award"></i>
                        도파맨
                    </span>
                    <span>22/08/27</span>
                </div>

                <div class="comment-content">
                    국회나 그 위원회의 요구가 있을 때에는 국무총리·국무위원 또는 정부위원은 출석·답변하여야 하며, 국무총리 또는 국무위원이 출석요구를 받은 때에는
                    국무위원 또는 정부위원으로 하여금 출석·답변하게 할 수 있다.

                    여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의
                    형의 선고에 의하지 아니하고는 파면되지 아니한다.
                </div>

                <div class="comment-reaction">
                    <button>좋아요 <span>14</span></button>
                    <button>싫어요</button>
                    <button>댓글</button>
                    <button><i class="fa-solid fa-flag"></i>신고</button>
                </div>
            </div>

            <div class="comment re-comment">
                <div class="comment-user-info">
                    <span class="writer-id">
                        <i class="fa-solid fa-award"></i>
                        도파맨
                    </span>
                    <span>22/08/27</span>
                </div>

                <div class="comment-content">
                    국회나 그 위원회의 요구가 있을 때에는 국무총리·국무위원 또는 정부위원은 출석·답변하여야 하며, 국무총리 또는 국무위원이 출석요구를 받은 때에는
                    국무위원 또는 정부위원으로 하여금 출석·답변하게 할 수 있다.

                    여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의
                    형의 선고에 의하지 아니하고는 파면되지 아니한다.
                </div>

                <div class="comment-reaction">
                    <button>좋아요 <span>14</span></button>
                    <button>싫어요</button>
                    <button>댓글</button>
                    <button><i class="fa-solid fa-flag"></i>신고</button>
                </div>
            </div>
        </div>
    </section>

    <section name="pagination" class="container py-2 mb-4">
        <div class="pagination">
            <a href="#" class="active">1</a>
        </div>
    </section>

    <c:import url="bbs.jsp"/>
</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>

<script>
  let writer = "${post.user_id}";
  // TODO: sessionID 교체
  let sessionId = "${post.user_id}"
  let postTitle = "${post.post_title}"

  $(document).ready(function () {
    $('#post_time').text(parseTime('<c:out value="${post.in_date}"/>'))

    if (writer == sessionId) {
      $('#post_form').append(
          "<button id='removeBtn'><i class='fa-solid fa-pen-to-square'></i> 수정</button>" +
          "<button id='deleteBtn'><i class='fa-solid fa-eraser'></i> 삭제</button>"
      )

      $('#deleteBtn').on('click', function () {
        if (!confirm('\"' + postTitle + '\"' + " 포스트를 삭제하시겠습니까?")) return false;

        let form = $('#post_form')
        form.attr('action', "<c:url value='/post/remove/${post.post_id}'/>")
        form.attr('method', 'post')
        form.submit();
      })
    }
  })
</script>
</html>