<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="ko">

<head>
	<title>도파민!</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/x-icon" href="<c:url value='/image/favicon.png'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/common/default.css'/>">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR&family=Noto+Serif&display=swap');
	</style>
</head>

<body>
<script>
	let msg = "${msg}";
	if(msg!="") alert(msg);
</script>

<div class="topnav">
	<div class="responsive">
		<div class="logo-wrapper">
			<img src="<c:url value='/image/logo_example.svg'/>" width="50" height="30">
		</div>
		<a class="topnav-menu" href="#" onclick='alert("홈으로 페이지 전환")'>홈</a>
		<a class="topnav-menu" href="#" onclick='alert("신규작 페이지로 이동")'>신규작</a>
		<a class="topnav-menu" href="#" onclick='alert("인기작 페이지로 이동")'>인기작</a>
		<a class="topnav-menu" href="#" onclick='alert("커뮤니티에서 게시판봐요")'>커뮤니티</a>
		<a class="topnav-menu" href="#" onclick='alert("룰렛 한판 돌려요")'>이벤트</a>
	</div>
</div>

<div class="content">
	<div class="responsive-content">
		<div class="skin">
			<img src="${myPageDto.skinUrl == null ? 'https://dummyimage.com/1200X200/ff00fb/053bff&text=default-skin' : myPageDto.skinUrl}" >
		</div>
		<div class="myInfo">
			<img src="${myPageDto.prf_img}">
			<h1>${myPageDto.nic}님은 ${myPageDto.fav_genre1} 장르를 좋아하는 ${myPageDto.age}대 ${myPageDto.sex == 0 ? '여성' : '남성'}입니다. </h1>
			<h4>dopa_exp = ${myPageDto.dopa_exp}</h4>
			<h4>dopa_point = ${myPageDto.dopa_point}</h4>
			<<!-- 회원정보 변경 버튼 모달 -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				내 정보 변경
			</button>

			<!-- Modal -->
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">비밀번호 인증</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							회원 정보 변경을 위해서 비밀번호 인증이 필요합니다.
							<form action="<c:url value='/mypage/userinform'/>" method="get">
								<label for="pwd">비밀번호 입력</label>
								<input id="pwd" type="password">

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							<button type="submit" class="btn btn-primary">인증</button>
						</div>

						</form>

					</div>
				</div>
			</div>

		</div>
		<div class="box">
			<h2>활동기록</h2>
			<button onclick="location.href='/psvm/mypage/revw'">컨텐츠 한줄평</button>
			<button onclick="location.href='/psvm/mypage/revwrt'">좋아요 누른 컨텐츠 한줄평</button>
			<button onclick="location.href='/psvm/mypage/cntswish'">컨텐츠 찜</button>
			<button onclick="location.href='/psvm/mypage/cntsview'">컨텐츠 조회기록</button>
			<button onclick="location.href='/psvm/mypage/post'">작성한 게시글 목록</button>
		</div>
		<div class="box">
			<h2>도파민 아이템</h2>
			<button href="#" onclick='alert("결제 내역 추가")'>결제 내역</button>
			<button href="#" onclick='alert("보유 아이템 추가")'>내 아이템</button>
		</div>

		<i class="fa-brands fa-instagram"></i>
		<i class="fa-brands fa-facebook"></i>
		<i class="fa-brands fa-youtube"></i>
		<div class="content-preview">
		</div>
		<div class="content-teenager-girl-movie"></div>

	</div>
</div>


<div class="footer">
	<div>about</div>
	<div>2022 PSVM팀</div>
</div>

</body>

</html>-----++++++++++++++++++++++++++++++