$(function () {
    $('#registerBtn').on("click", function () {
        var data = {
            list_nm: $('#list_nm').val(),
            item_grd: $('#item_grd').val(),
            item_nm: $('#item_nm').val(),
            item_dsc: $('#item_dsc').val(),
            item_price: $('#item_price').val()
        }
        var change_data = {
            list_nm: '분류',
            item_grd: '등급',
            item_nm: '이름',
            item_dsc: '설명',
            item_price: '포인트'
        }
        console.log(data);
        for (let key in data) {
            if (data[key] === '') {
                alert(change_data[key] + ' 입력해주세요.');
                return false;
            }
        }
        let item_img = $("#item_img")[0].files[0];
        console.log(item_img);
        if (item_img == null) {
            alert("이미지는 필수 값입니다.");
        }
        let formData = new FormData();
        formData.append('key', new Blob([JSON.stringify(data)], {type: "application/json"}));
        formData.append("item_img", $("#item_img")[0].files[0]);
        $.ajax({
            url: "/psvm/item/registerItem",
            type: 'POST',
            data: formData,
            success: function (response) {
                alert("아이템 등록에 성공했습니다.");
                $("#list_nm_msg").html(
                    response.list_nm = (response.list_nm !== undefined ? response.list_nm : ""));
                $("#item_grd_msg").html(
                    response.item_grd = (response.item_grd !== undefined ? response.item_grd : ""));
                $("#item_nm_msg").html(
                    response.item_nm = (response.item_nm !== undefined ? response.item_nm : ""));
                $("#item_dsc_msg").html(
                    response.item_dsc = (response.item_dsc !== undefined ? response.item_dsc : ""));
                $("#item_price_msg").html(
                    response.item_price = (response.item_price !== undefined ? response.item_price : ""));
                window.location.href = "/psvm/item/item_admin";
            },
            error: function (request, status, error) {
                var result = JSON.parse(request.responseText);
                alert(result["message1"]);
            },
            cache: false,
            contentType: false,
            processData: false,
            enctype: "multipart/form-data"
        })
    })
})
//이미지 미리보기
$(document).ready(function () {
    $("#item_img").on("change", handleImgFileSelect);
});

function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);
    var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
    filesArr.forEach(function (f) {
        if (!f.type.match(reg)) {
            alert("확장자는 이미지만 가능합니다.");
            return;
        }
        sel_file = f;
        var reader = new FileReader();
        reader.onload = function (e) {
            $("#preview").css("display", "none");
            $("#img").css("display", "block");
            $("#img").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
    })
}

