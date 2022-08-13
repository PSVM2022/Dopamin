<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        * { box-sizing:border-box; }

        form {
            width:400px;
            height:600px;
            display : flex;
            flex-direction: column;
            align-items:center;
            position : absolute;
            top:50%;
            left:50%;
            transform: translate(-50%, -50%) ;
            border: 1px solid rgb(89,117,196);
            border-radius: 10px;
        }

        .input-field {
            width: 300px;
            height: 40px;
            border : 1px solid rgb(89,117,196);
            border-radius:5px;
            padding: 0 10px;
            margin-bottom: 10px;
        }

        label {
            width:300px;
            height:30px;
            margin-top :4px;
        }

        button {
            background-color: rgb(89,117,196);
            color : white;
            width:300px;
            height:50px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin : 20px 0 30px 0;
        }

        .title {
            font-size : 50px;
            margin: 40px 0 30px 0;
        }

        .msg {
            height: 30px;
            text-align:center;
            font-size:16px;
            color:red;
            margin-bottom: 20px;
        }

        .sns-chk {
            margin-top : 5px;
        }
    </style>
    <title>DOPAMIN-회원가입</title>
</head>
<body>
<form method="post" action="<c:url value="/join/join"/>">
    <label for="user_id">아이디</label>
    <input type="text" id="user_id" name="user_id"/>
    <button type="button" onclick="idDupleCheck(${'${user_Id}'})">아이디 중복 체크</button>

    <label for="user_pwd">비밀번호</label>
    <input type="password" id="user_pwd" name="user_pwd"/>
    <br>
    <label for="pwdCheck">비밀번호 재확인</label>
    <input type="password" id="pwdCheck" name="pwdCheck"/>
    <div id="msg">
        <c:if test="${not empty param.msg}">
            <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg,"utf-8")}</i>
        </c:if>
    </div>
    <br>
    <label for="f_nm">성</label>
    <input type="text" id="f_nm" name="f_nm"/>

    <label for="l_nm">이름</label>
    <input type="text" id="l_nm" name="l_nm"/>
    <br>
    <label for="phone_num">전화번호(ex)010-1234-1234)</label>
    <input type="text" id="phone_num" name="phone_num"/>
    <br>
<%--    <label for="mbti">MBTI</label>--%>
<%--    <input type="text" id="mbti" name="mbti"/>--%>
    <br>
    <label for="cnty">나라</label>
    <input type="text" id="cnty" name="cnty"/>
    <br>
    <label for="email">email</label>
    <input type="email" id="email" name="email"/>
    <br>
    <label for="nic">닉네임</label>
    <input type="text" id="nic" name="nic"/>
    <br>
    <label for="btdt">생년월일</label>
    <input type="text" id="btdt" name="btdt"/>
    <br>
<%--    <label for="sex">성별</label>--%>
<%--    <select autofocus id="sex" name="sex">--%>
<%--        <option>남자</option>--%>
<%--        <option>여자</option>--%>
<%--    </select>--%>
    <br>

<%--    <label>선호 장르를 선택해주세요(최소 1개, 최대 5개)</label>--%>
<%--    <input type="radio" value="1" name="fav_genre1">액션--%>
<%--    <input type="radio" value="2" name="fav_genre2">로맨스--%>
<%--    <input type="radio" value="3" name="fav_genre3">코미디--%>
<%--    <input type="radio" value="4" name="fav_genre4">공포--%>
<%--    <input type="radio" value="5" name="fa_genre5">스릴러--%>

    <button type="submit">회원가입</button>
</form>


<script>
        function idDupleCheck(userId) {
            let form ={"userId" : userId};
            $.ajax({
                type:'POST',       // 요청 메서드
                url: '/join/idduplck',  // 요청 URI
                headers : { "content-type": "application/json"}, // 요청 헤더
                dataType : 'text', // 전송받을 데이터의 타입
                data : JSON.stringify(form),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(response){
                    console(response);
                    console(response['id'])
                    // person2 = JSON.parse(result);    // 서버로부터 응답이 도착하면 호출될 함수
                    // alert("received="+result);       // result는 서버가 전송한 데이터
                    // $("#data").html("name="+person2.name+", age="+person2.age);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            });

        }

</script>
</body>
</html>