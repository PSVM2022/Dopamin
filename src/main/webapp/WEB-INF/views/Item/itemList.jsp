<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>fastcampus</title>
    <link rel="icon" type="image/x-icon" href="<c:url value='/image/favicon.png' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='css/common/default.css' />">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: "Noto Sans KR", sans-serif;
        }
        .container {
            width : 50%;
            margin : auto;
        }
        .writing-header {
            position: relative;
            margin: 20px 0 0 0;
            padding-bottom: 10px;
            border-bottom: 1px solid #323232;
        }
        input {
            width: 100%;
            height: 35px;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            padding: 8px;
            background: #f8f8f8;
            outline-color: #e6e6e6;
        }
        textarea {
            width: 100%;
            background: #f8f8f8;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            resize: none;
            padding: 8px;
            outline-color: #e6e6e6;
        }
        .frm {
            width:100%;
        }
        .btn {
            background-color: rgb(236, 236, 236); /* Blue background */
            border: none; /* Remove borders */
            color: black; /* White text */
            padding: 6px 12px; /* Some padding */
            font-size: 16px; /* Set a font size */
            cursor: pointer; /* Mouse pointer on hover */
            border-radius: 5px;
        }
        .btn:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div id="menu">
    <ul>
        <li id="logo">PSVM</li>
<%--        <li><a href="<c:url value='/'/>">Home</a></li>--%>
<%--        <li><a href="<c:url value='/board/list'/>">Board</a></li>--%>
<%--        <li><a href="<c:url value='/login/login'/>">login</a></li>--%>
<%--        <li><a href="<c:url value='/register/add'/>">Sign in</a></li>--%>
<%--        <li><a href=""><i class="fas fa-search small"></i></a></li>--%>
    </ul>
</div>
<div style="text-align:center">
    <h2>아이템 목록</h2>
    <table border="1">
        <tr>
            <th>아이템 이름</th>
            <th>등급</th>
            <th>아이템 설명</th>
            <th>아이템 포인트</th>
            <th>아이템_이미지</th>
        </tr>
        <c:forEach var="item" items="${list}">
        <tr>
            <td>${item.item_nm}</td>
            <td>${item.grd_id}</td>
            <td>${item.item_dsc}</td>
            <td>${item.item_price}</td>
            <td>${item.item_img}</td>
        </tr>
        </c:forEach>
    </table>
    <br>
    <div>
        <c:if test="${ph.showPrev}">
            <a href="<c:url value="/item/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}"/>">&lt;</a>
        </c:if>
        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
            <a href="<c:url value="/item/list?page=${i}&pageSize=${ph.pageSize}"/>">${i}</a>
        </c:forEach>
        <c:if test="${ph.showNext}">
            <a href="<c:url value="/item/list?page=${ph.endPage+1}&pageSize=${ph.pageSize}"/>">&gt;</a>
        </c:if>
    </div>
</div>
</body>
</html>