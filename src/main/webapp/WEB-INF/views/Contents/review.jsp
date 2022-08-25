<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<h2>{name:"abc", age:10}</h2>
<button id="sendBtn" type="button">SEND</button>
<h2>한줄평 테스트 JSP</h2>
<div id="reviewList"></div>
<script>
  let cnts_id = 1;

  let showList = function (cnts_id) {
    $.ajax({
      type:'GET',       // 요청 메서드
      url: '/psvm/contents/${cnts_id}/reviews',  // 요청 URI
      success : function(result){
        ${"#reviewList"}.html(result);
      },
      error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
    }); // $.ajax()
  }

  $(document).ready(function(){
    $("#sendBtn").click(function(){
      showList(cnts_id);
    });
  });
</script>
</body>
</html>