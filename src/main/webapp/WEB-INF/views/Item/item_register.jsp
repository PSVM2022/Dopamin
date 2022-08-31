<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true"%>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>fastcampus</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/menu.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/common/item.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript">
        $(function(){
            $('#registerBtn').on("click",function(){
                var data={
                    list_nm:$('#list_nm').val(),
                    item_grd:$('#item_grd').val(),
                    item_nm:$('#item_nm').val(),
                    item_dsc:$('#item_dsc').val(),
                    item_price:$('#item_price').val()
                }
                var change_data={
                    list_nm:'분류',
                    item_grd:'등급',
                    item_nm:'이름',
                    item_dsc:'설명',
                    item_price:'포인트'
                }
                console.log(data);
                for(let key in data){
                    if(data[key]===''){
                        alert(change_data[key]+' 입력해주세요.');
                        return false;
                    }
                }
                console.log($("#item_img")[0].files[0])
                var formData=new FormData();
                formData.append('key',new Blob([JSON.stringify(data)],{type:"application/json"}));
                formData.append("item_img",$("#item_img")[0].files[0]);
                console.log(formData)
                if(formData.get("item_img")==null){
                    alert("이미지는 필수 값입니다.");
                }
                $.ajax({
                    url:"/psvm/item/registerItem",
                    type:'POST',
                    data:formData,
                    success: function(response){
                        alert("성공");
                        $("#list_nm_msg").html(response.list_nm=(response.list_nm!==undefined ? response.list_nm : ""));
                        $("#item_grd_msg").html(response.item_grd=(response.item_grd!==undefined ? response.item_grd : ""));
                        $("#item_nm_msg").html(response.item_nm=(response.item_nm!==undefined ? response.item_nm : ""));
                        $("#item_dsc_msg").html(response.item_dsc=(response.item_dsc!==undefined ? response.item_dsc : ""));
                        $("#item_price_msg").html(response.item_price=(response.item_price!==undefined ? response.item_price : ""));
                    },
                    error:function(request,status,error){
                        console.log("code: " + request.status)
                        console.log("message: " + request.responseText)
                        console.log("error: " + error);
                    },
                    cache:false,
                    contentType:false,
                    processData:false,
                    enctype:"multipart/form-data"
                })
            })
        })
        //이미지 미리보기
        $(document).ready(function(){
            $("#item_img").on("change",handleImgFileSelect);
        });
        function handleImgFileSelect(e){
            var files=e.target.files;
            var filesArr=Array.prototype.slice.call(files);
            var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
            filesArr.forEach(function(f){
                if(!f.type.match(reg)){
                    alert("확장자는 이미지만 가능합니다.");
                    return;
                }
                sel_file=f;
                var reader=new FileReader();
                reader.onload=function(e){
                    $("#img").attr("src",e.target.result);
                }
                reader.readAsDataURL(f);
            })
        }

    </script>
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
<div class="container">
    <label id="category">아이템 분류</label>
    <select id="list_nm" name="list_nm">
        <option value="" selected disabled hidden>선택</option>
        <option value="skin">스킨</option>
        <option value="deco">꾸미기</option>
    </select>
    <div id="list_nm_msg" class="msg"></div>
    <br>
    <label id="grade">아이템 등급</label>
    <select id="item_grd" name="item_grd">
        <option value="" selected disabled hidden>선택</option>
        <option value="에픽">에픽</option>
        <option value="전설">전설</option>
    </select>
    <div id="item_grd_msg" class="msg"></div>
    <br>
    <label id="name">아이템 이름</label><br>
    <input id="item_nm" name="item_nm" type="text" placeholder="아이템 이름 입력하세요"><br>
    <div id="item_nm_msg" class="msg"></div>
    <label id="description">아이템 설명</label><br>
    <textarea id="item_dsc" name="item_dsc" cols="50" rows="10"></textarea><br>
    <div id="item_dsc_msg" class="msg"></div>
    <label id="image">아이템 이미지</label><br>
    <input id="item_img" type="file"><br>
    <div class="img_wrap">
        <img id="img" height=300/>
    </div>
    <label id="price">아이템 포인트</label><br>
    <input id="item_price" name="item_price" type="text" placeholder="아이템 가격 입력하세요"><br>
    <div id="item_price_msg" class="msg"></div>
    <button type="button" id="registerBtn" class="btn btn-write">등록</button>
</div>
</body>
</html>