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
    <title>도파민!</title>
    <c:import url="/WEB-INF/views/common/default.jsp"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/home.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/item/register.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/item/psvm.css'/>">
    <script defer src="<c:url value='/js/contents/new_item_register.js'/>"></script>
</head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>
    <div style="display: flex">
        <div>
            <ul id="nav">
                <li><a href="/psvm/item/item_admin">아이템 관리자</a>
                    <ul>
                        <li><a href="/psvm/item/item_admin">아이템 관리</a></li>
                        <li><a href="/psvm/item/register">아이템 등록</a></li>
                    </ul>
                </li>
                <li><a href="#">메인 메뉴</a>
                    <ul>
                        <li><a href="#">1-1</a></li>
                        <li><a href="#">1-2</a></li>
                    </ul>
                </li>
                <li><a href="#">메인 메뉴</a>
                    <ul>
                        <li><a href="#">1-1</a></li>
                        <li><a href="#">1-2</a></li>
                    </ul>
                </li>
                <li><a href="#">메인 메뉴</a>
                    <ul>
                        <li><a href="#">1-1</a></li>
                        <li><a href="#">1-2</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div id="register_container">
            <div id="register_nm_grd_container">
                <label id="category">아이템 분류: </label>
                <select id="list_nm" name="list_nm">
                    <option value="" selected disabled hidden>선택</option>
                    <option value="skin">스킨</option>
                    <option value="deco">꾸미기</option>
                </select>
                <div id="list_nm_msg" class="msg"></div>
                <br>
                <label id="grade">아이템 등급: </label>
                <select id="item_grd" name="item_grd">
                    <option value="" selected disabled hidden>선택</option>
                    <option value="1등급">1등급</option>
                    <option value="2등급">2등급</option>
                    <option value="3등급">3등급</option>
                    <option value="4등급">4등급</option>
                    <option value="5등급">5등급</option>
                </select>
                <div id="item_grd_msg" class="msg"></div>
                <br>
            </div>
            <div id="register_item_nm">
                <label id="name">아이템 이름: </label>
                <input id="item_nm" name="item_nm" type="text" placeholder="아이템 이름 입력하세요"><br>
                <div id="item_nm_msg" class="msg"></div>
            </div>
            <label id="description">아이템 설명</label><br>
            <textarea id="item_dsc" name="item_dsc" style="width: 41rem;" cols="50" rows="10"></textarea><br>
            <div id="item_dsc_msg" class="msg"></div>
            <label id="image">아이템 이미지</label><br>
            <div id="register_item_img">
                <input id="item_img" type="file"><br>
            </div>
            <div class="img_wrap" style="border: 1px solid;width: 41rem;height: 15rem;font-size: 0.7rem; text-align: center">
                <span id="preview">
                    이미지 미리보기</span>
                <img id="img" style="display:none; width: 100%;height: 100%;object-fit: contain;"/>
            </div>
            <div id="register_item_price">
                <label id="price" style="margin-top:0.5rem;">아이템 포인트: </label><br>
                <input id="item_price" name="item_price" type="text" placeholder="아이템 가격 입력하세요" style="width: 34rem"><br>
                <div id="item_price_msg" class="msg"></div>
            </div>
            <button type="button" id="registerBtn" class="btn btn-write">등록</button>
        </div>
    </div>
</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
