<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE>
<html>
<head>
    <meta charset="UTF-8">
    <title>dopamin</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

</head>
<body>
<div>
    <div id="menu">
        <ul>
            <li id="logo">PSVM</li>
        </ul>
    </div>
    <div>
        <h2>도파민 메인 페이지</h2>
    </div>
    <div style="text-align:center">
        <div class="row">
            <div class="col">
                <form action="<c:url value="/contents/search/${sc.keyword}"/>" class="search-form" method="get">
                    <input type="text" name="keyword" class="search-input" type="text" value="${sc.keyword}" placeholder="검색어를 입력해주세요">
                    <input type="submit" class="search-button" value="검색">
                </form>
            </div>
        </div>

            <c:forEach var="cnts" items="${cntsDtoList}">
                <br>
                    <tr>
                        <div>
                            <td><a href='/psvm/contents/${cnts.cnts_id}'/>${cnts.cnts_postr_img}</td><br>
                            <td>${cnts.cnts_title}</td><br>
                            <td>${cnts.cnts_subttl}</td><br>
                            <td>${cnts.cnts_op_date}</td><br>
                            <td>${cnts.cnts_cnty}</td><br>
                        </div>
                    </tr>
            </c:forEach>
        <br>


    </div>
</div>
</body>
</html>
</body>
</html>