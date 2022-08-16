<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
    <title>도파민!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="<c:url value='/image/favicon.png' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/default.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/item.css' />">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
          integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR&family=Noto+Serif&display=swap');
    </style>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script>
        $(function(){
            $('#cart').click(function(){
                $(location).attr("href","/psvm/cart");
            });
            $('#inventory').click(function(){
                $(location).attr("href","/psvm/inven");
            });
            $('#Admin_page').click(function(){
                $(location).attr("href","/psvm/item/item_admin");
            })
        });
    </script>

</head>
<body>
<div class="topnav">
    <div class="responsive">
        <div class="logo-wrapper">
            <img alt="" src="<c:url value='/image/logo_example.svg' />" width="50" height="30">
        </div>
        <a class="topnav-menu" href="#" onclick='alert("홈으로 페이지 전환")'>홈</a>
        <a class="topnav-menu" href="#" onclick='alert("신규작 페이지로 이동")'>신규작</a>
        <a class="topnav-menu" href="#" onclick='alert("인기작 페이지로 이동")'>인기작</a>
        <a class="topnav-menu" href="#" onclick='alert("커뮤니티에서 게시판봐요")'>커뮤니티</a>
        <a class="topnav-menu" href="#" onclick='alert("룰렛 한판 돌려요")'>이벤트</a>
        <a class="topnav-menu" href="/psvm/item/" onclick='alert("충동 구매는 당신의 지갑을 얇게 만들수 있습니다.")'>상점</a>
    </div>
</div>
<script>
    let msg = "${msg}";
    if(msg!="") alert(msg);

</script>
<button id="Admin_page">관리자페이지</button>
<div class="css-hnjlk0" style="--container-width:1200px;">
    <div style="display: flex; align-items: center;">
        <h1 class="css-1uk7quv" style="flex: 1 0 0px;">포인트</h1>
        <div>
            <button role="button" id="cart" class="css-1u44z18">장바구니</button>
        </div>
        <div>
            <button role="button" id="inventory" class="css-1u44z18">인벤토리</button>
        </div>
    </div>
    <div class="css-rtde4j">
        <div class="css-ik5ztq">
            <img src="https://static.solved.ac/coin/coin-small.svg" alt="Coins" class="css-16sxkvf">
            포인트 받아오면 됨.
        </div>
    </div>
    <div style="display: block; height: 16px;"></div>
    <a href="/psvm/item/list/스킨" class="css-TOP" style="flex: 1 0 0px;">프로필배경 TOP4</a>
    <div class="css-2xlufz">
        <div class="css-r3v8jq">
            <img src="https://static.solved.ac/item/freeze-small-simple.svg" alt="스트릭 프리즈" class="css-1e19vwe">
            <div class="css-lvz7a2">스트릭 프리즈</div>
            <div class="css-7kyp67">미리 장착해 두면 어제 문제 푸는 걸 잊었더라도 스트릭이 깨지지 않습니다. 단, 스트릭 길이가 늘어나지는 않습니다.
                <br>인벤토리에서 장착해서 사용할 수 있습니다.
                <br>
            </div>
            <div class="css-t6a2j8">
                <img src="https://static.solved.ac/coin/coin-small.svg" alt="Coins" class="css-16sxkvf">
                0.99
                <br>
                <small class="css-iprtw2" style="font-weight: normal;">0개 보유 중, 2개까지만 보유 가능</small>
            </div>
            <button role="button" disabled="" class="css-1u44z18">담기</button>
        </div>
        <div class="css-r3v8jq">
            <img src="https://static.solved.ac/item/bg-ticket-hanbyeol-stars.svg" alt="『저녁 하늘의 별무리』 프로필 배경 교환권" class="css-1e19vwe">
            <div class="css-lvz7a2">『저녁 하늘의 별무리』 프로필 배경 교환권</div>
            <div class="css-7kyp67">사용하면 『저녁 하늘의 별무리』 프로필 배경을 획득할 수 있는 프로필 배경 교환권입니다.
                <br>사용 후 내 프로필의 [프로필 편집] 버튼을 눌러 장착할 수 있습니다.
                <br>
            </div>
            <div class="css-t6a2j8">
                <img src="https://static.solved.ac/coin/sparkle-small.svg" alt="Stardusts" class="css-16sxkvf">
                10,000
                <br>
                <small class="css-iprtw2" style="font-weight: normal;">0개 보유 중, 1개까지만 보유 가능</small>
            </div><button role="button" disabled="" class="css-1u44z18">구매</button>
        </div>
        <div class="css-r3v8jq">
            <img src="https://static.solved.ac/item/bg-ticket-hanbyeol-stars.svg" alt="『저녁 하늘의 별무리』 프로필 배경 교환권" class="css-1e19vwe">
            <div class="css-lvz7a2">『저녁 하늘의 별무리』 프로필 배경 교환권</div>
            <div class="css-7kyp67">사용하면 『저녁 하늘의 별무리』 프로필 배경을 획득할 수 있는 프로필 배경 교환권입니다.
                <br>사용 후 내 프로필의 [프로필 편집] 버튼을 눌러 장착할 수 있습니다.
                <br>
            </div>
            <div class="css-t6a2j8">
                <img src="https://static.solved.ac/coin/sparkle-small.svg" alt="Stardusts" class="css-16sxkvf">
                10,000
                <br>
                <small class="css-iprtw2" style="font-weight: normal;">0개 보유 중, 1개까지만 보유 가능</small>
            </div><button role="button" disabled="" class="css-1u44z18">구매</button>
        </div>
        <div class="css-r3v8jq">
            <img src="https://static.solved.ac/item/bg-ticket-hanbyeol-stars.svg" alt="『저녁 하늘의 별무리』 프로필 배경 교환권" class="css-1e19vwe">
            <div class="css-lvz7a2">『저녁 하늘의 별무리』 프로필 배경 교환권</div>
            <div class="css-7kyp67">사용하면 『저녁 하늘의 별무리』 프로필 배경을 획득할 수 있는 프로필 배경 교환권입니다.
                <br>사용 후 내 프로필의 [프로필 편집] 버튼을 눌러 장착할 수 있습니다.
                <br>
            </div>
            <div class="css-t6a2j8">
                <img src="https://static.solved.ac/coin/sparkle-small.svg" alt="Stardusts" class="css-16sxkvf">
                10,000
                <br>
                <small class="css-iprtw2" style="font-weight: normal;">0개 보유 중, 1개까지만 보유 가능</small>
            </div><button role="button" disabled="" class="css-1u44z18">구매</button>
        </div>
    </div>
    <div style="display: block; height: 16px;"></div>
    <a href="/psvm/item/list/꾸미기" class="css-TOP" style="flex: 1 0 0px;">꾸미기 TOP4</a>
    <div class="css-2xlufz">
        <div class="css-r3v8jq">
            <img src="https://static.solved.ac/item/freeze-small-simple.svg" alt="스트릭 프리즈" class="css-1e19vwe">
            <div class="css-lvz7a2">스트릭 프리즈</div>
            <div class="css-7kyp67">미리 장착해 두면 어제 문제 푸는 걸 잊었더라도 스트릭이 깨지지 않습니다. 단, 스트릭 길이가 늘어나지는 않습니다.
                <br>인벤토리에서 장착해서 사용할 수 있습니다.
                <br>
            </div>
            <div class="css-t6a2j8">
                <img src="https://static.solved.ac/coin/coin-small.svg" alt="Coins" class="css-16sxkvf">
                0.99
                <br>
                <small class="css-iprtw2" style="font-weight: normal;">0개 보유 중, 2개까지만 보유 가능</small>
            </div>
            <button role="button" disabled="" class="css-1u44z18">구매</button>
        </div>
        <div class="css-r3v8jq">
            <img src="https://static.solved.ac/item/bg-ticket-hanbyeol-stars.svg" alt="『저녁 하늘의 별무리』 프로필 배경 교환권" class="css-1e19vwe">
            <div class="css-lvz7a2">『저녁 하늘의 별무리』 프로필 배경 교환권</div>
            <div class="css-7kyp67">사용하면 『저녁 하늘의 별무리』 프로필 배경을 획득할 수 있는 프로필 배경 교환권입니다.
                <br>사용 후 내 프로필의 [프로필 편집] 버튼을 눌러 장착할 수 있습니다.
                <br>
            </div>
            <div class="css-t6a2j8">
                <img src="https://static.solved.ac/coin/sparkle-small.svg" alt="Stardusts" class="css-16sxkvf">
                10,000
                <br>
                <small class="css-iprtw2" style="font-weight: normal;">0개 보유 중, 1개까지만 보유 가능</small>
            </div><button role="button" disabled="" class="css-1u44z18">구매</button>
        </div>
        <div class="css-r3v8jq">
            <img src="https://static.solved.ac/item/bg-ticket-hanbyeol-stars.svg" alt="『저녁 하늘의 별무리』 프로필 배경 교환권" class="css-1e19vwe">
            <div class="css-lvz7a2">『저녁 하늘의 별무리』 프로필 배경 교환권</div>
            <div class="css-7kyp67">사용하면 『저녁 하늘의 별무리』 프로필 배경을 획득할 수 있는 프로필 배경 교환권입니다.
                <br>사용 후 내 프로필의 [프로필 편집] 버튼을 눌러 장착할 수 있습니다.
                <br>
            </div>
            <div class="css-t6a2j8">
                <img src="https://static.solved.ac/coin/sparkle-small.svg" alt="Stardusts" class="css-16sxkvf">
                10,000
                <br>
                <small class="css-iprtw2" style="font-weight: normal;">0개 보유 중, 1개까지만 보유 가능</small>
            </div><button role="button" disabled="" class="css-1u44z18">구매</button>
        </div>
        <div class="css-r3v8jq">
            <img src="https://static.solved.ac/item/bg-ticket-hanbyeol-stars.svg" alt="『저녁 하늘의 별무리』 프로필 배경 교환권" class="css-1e19vwe">
            <div class="css-lvz7a2">『저녁 하늘의 별무리』 프로필 배경 교환권</div>
            <div class="css-7kyp67">사용하면 『저녁 하늘의 별무리』 프로필 배경을 획득할 수 있는 프로필 배경 교환권입니다.
                <br>사용 후 내 프로필의 [프로필 편집] 버튼을 눌러 장착할 수 있습니다.
                <br>
            </div>
            <div class="css-t6a2j8">
                <img src="https://static.solved.ac/coin/sparkle-small.svg" alt="Stardusts" class="css-16sxkvf">
                10,000
                <br>
                <small class="css-iprtw2" style="font-weight: normal;">0개 보유 중, 1개까지만 보유 가능</small>
            </div><button role="button" disabled="" class="css-1u44z18">구매</button>
        </div>
    </div>
</div>
</body>
</html>