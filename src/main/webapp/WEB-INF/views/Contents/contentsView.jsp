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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/contents/contentsview.css'/>">
</head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>
    <section class="container">
        <div id="demo">
            <div class="col-12" style="display:flex;">
                <div class="contents-view">
                    <img class="img-fluid" src="${contentsDto.cnts_postr_img}"
                         alt="${contentsDto.cnts_title}"/>
                </div>
                <div class="contents-value">
                    <h4 class="title">${contentsDto.cnts_title}</h4>
                    <h6 class="subttle-text-muted">${contentsDto.cnts_subttl}</h6>
                    <hr>
                    <p class="text">${contentsDto.cnts_op_date}</p>
                    <p class="text">${contentsDto.cnts_cnty}</p>
                    <table>
                        <tr>
                            <td><p class="text">${contentsDto.cnts_genre1}&nbsp;&nbsp;</p></td>
                            <td><p class="text">${contentsDto.cnts_genre2}&nbsp;&nbsp;</p></td>
                            <td><p class="text">${contentsDto.cnts_genre3}&nbsp;&nbsp;</p></td>
                            <td><p class="text">${contentsDto.cnts_genre4}&nbsp;&nbsp;</p></td>
                            <td><p class="text">${contentsDto.cnts_genre5}</p></td>
                        </tr>
                    </table>
                    <p class="text">${contentsDto.cnts_rning_t}</p>
                    <p class="text">${contentsDto.cnts_g_rated}</p>
                    <p class="text">${contentsDto.cnts_director}</p>
                    <p class="text">${contentsDto.cnts_actor}</p>
                    <p class="text">${contentsDto.cnts_synop}</p>
                </div>
                <br>
            </div>
            <div>
                <div class="cnts-view-btn">
                    <input type="button" class="wishBtn" value="찜"
                           onclick="wishBtn(${contentsWishDto.cnts_id});"/>
                    <input type="button" class="like-btn" value="좋아요" onclick="alert('좋아요 평가 완료');"/>
                    <input type="button" class="dislike-btn" value="싫어요" onclick="alert('싫어요 평가 완료');"/>

                    <button class="show_cnts_rt" style="margin-left: 37rem; margin-top: 0.2rem; border-radius: 0.3rem;" type="button">
                        <a href="/psvm/contents/${contentsDto.cnts_id}/contentsReview/" class="nav-link px-2 link-dark">컨텐츠
                        한줄평 보러가기</a>
                    </button>

                </div>
                <br>

                <div class="ott">
                    <c:if test="${contentsDto.ott1_stat==1 || contentsDto.ott2_stat==1 || contentsDto.ott3_stat==1}">
                        <p class="text"> 감상 가능 OTT </p>
                        <c:if test="${contentsDto.ott1_stat==1}">
                            <div class="ott1ProImg" onclick="window.open('https://www.netflix.com/browse')"></div>
                        </c:if>
                        <c:if test="${contentsDto.ott2_stat==1}">
                            <div class="ott2ProImg" onclick="window.open('https://watcha.com/')"></div>
                        </c:if>
                        <c:if test="${contentsDto.ott3_stat==1}">
                            <div class="ott3ProImg" onclick="window.open('https://www.disneyplus.com/ko-kr')"></div>
                        </c:if>
                    </c:if>

                    <c:if test="${contentsDto.ott1_stat==0 && contentsDto.ott2_stat==0 && contentsDto.ott3_stat==0}">
                    <p class="text"> 컨텐츠를 시청할 수 있는 OTT 가 없습니다.</p>
                    </c:if>

                </div>

            </div>
        </div>
        </div>

    </section>

    <section class="container py-5"></section>

</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>

<script>
  function wishBtn(cnts_id) {
    //let revw_id = $(this).parent().attr("deleteBtn");
    //console.log(cnts_id);
    //console.log("click");
    if (session = "false") {     //비로그인시 처리 alert
      alert("로그인 후 이용 가능합니다. ")
      return false
    }

    $.ajax({
      type: 'POST',       // 요청 메서드
      url: '/psvm/contents/' + cnts_id + '/wish',
      success: function () {
        alert("컨텐츠 찜")
        location.replace('/psvm/contents/' + cnts_id)
      },
      error: function () {// 에러가 발생했을 때, 호출될 함수
        alert("컨텐츠 찜 취소")
        location.replace('/psvm/contents/' + cnts_id)
      }
    }); // $.ajax()
  };
</script>
</html>