<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE>
<html>
<head>
  <meta charset="UTF-8">
  <title>dopamin contents main page</title>
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
    <h2>도파민 컨텐츠 상세 페이지</h2>
  </div>
    <h4> 컨텐츠 상세 페이지 입니다.</h4>
  <div style="text-align:center">

      <tr>
        <div>
          <td>${contentsDto.cnts_postr_img}</td><br>
          <td>${contentsDto.cnts_title}</td><br>
          <td>${contentsDto.cnts_subttl}</td><br>
          <td>${contentsDto.cnts_genre1}</td><br>
          <td>${contentsDto.cnts_genre2}</td><br>
          <td>${contentsDto.cnts_genre3}</td><br>
          <td>${contentsDto.cnts_genre4}</td><br>
          <td>${contentsDto.cnts_genre5}</td><br>
          <td>${contentsDto.cnts_op_date}</td><br>
          <td>${contentsDto.cnts_cnty}</td><br>
          <td>${contentsDto.cnts_director}</td><br>
          <td>${contentsDto.cnts_actor}</td><br>
          <td>${contentsDto.cnts_synop}</td><br>
          <td>${contentsDto.cnts_cnty}</td><br>
        </div>
      </tr>

    </form>


  </div>
</div>
</body>
</html>
</body>
</html>