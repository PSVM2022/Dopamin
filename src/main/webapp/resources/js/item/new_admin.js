$(document).ready(function () {
    $('ul.tabs li').click(function () {
        var tab_id = $(this).attr('data-tab');
        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');
        $(this).addClass('current');
        $("#" + tab_id).addClass('current');
    });
    $('#multi2').on("click", ".btn-Noshow", function () {
        let item_id = $(this).parent().attr("data-item_id");
        $.ajax({
            type: 'PATCH',
            url: '/psvm/item/showtonoshow/' + item_id,
            success: function (result) {
                alert("비공개에 성공했습니다.");
                location.reload()
            },
            error: function (request, status, error) {
                var result = JSON.parse(request.responseText);
                alert(result["message1"]);
            }
        })
    });
    $('#multi1').on("click", ".btn-show", function () {
        let item_id = $(this).parent().attr("data-item_id");
        $.ajax({
            type: 'PATCH',
            url: '/psvm/item/noshowtoshow/' + item_id,
            success: function (result) {
                alert("공개에 성공했습니다.")
                location.reload();
            },
            error: function (request, status, error) {
                var result = JSON.parse(request.responseText);
                alert(result["message1"]);
            }
        })
    });
    $('#multi1').on("click", ".btn-modify", function () {
        console.log("modify-clicked");
        if (confirm("수정하시겠습니까?")) {
            let item_id = $(this).parent().attr("data-item_id");
            console.log(item_id);
            $('#' + item_id + '_nm_input').css("display", "block");
            $('#' + item_id + '_grd_input').css("display", "block");
            $('#' + item_id + '_dsc_input').css("display", "block");
            $('#' + item_id + '_price_input').css("display", "block");
            $('#' + item_id + '_price_input1').css("display", "block");
            $('#' + item_id + '_btn').css("display", "block");

            $('#' + item_id + '_nm').css("display", "none");
            $('#' + item_id + '_grd').css("display", "none");
            $('#' + item_id + '_dsc').css("display", "none");
            $('#' + item_id + '_price').css("display", "none");
            $('#' + item_id + '_btn_input').css("display", "none");
            $(".item_input css-t6a2j8").css("display", "inline-flex");

            $('#' + item_id + '_btn').click(function () {
                console.log("modify-register-clicked");
                let item_id = $(this).parent().attr("data-item_id");
                let item_nm = $('#' + item_id + '_nm_input').val();
                let item_grd = $('#' + item_id + '_grd_input').val();
                let item_dsc = $('#' + item_id + '_dsc_input').val();
                let item_price = $('#' + item_id + '_price_input1').val();
                if (item_nm == '') {
                    alert("이름 입력해주세요!");
                    return;
                }
                if (item_grd != '1등급' && item_grd != '2등급' && item_grd != '3등급' && item_grd != '4등급'
                    && item_grd != '5등급') {
                    alert("등급 양식은 0등급 입니다.");
                    return;
                }
                if (item_dsc == '') {
                    alert("설명을 작성해주세요.");
                    return;
                }
                if (item_dsc.length > 30) {
                    alert("설명은 30글자 이하입니다.");
                    return;
                }
                if (!$.isNumeric(item_price)) {
                    alert("가격은 숫자만 가능합니다!");
                }
                let dto = {
                    "item_id": item_id,
                    "item_nm": item_nm,
                    "item_grd": item_grd,
                    "item_dsc": item_dsc,
                    "item_price": item_price
                }

                if (confirm("등록하시겠습니까?")) {
                    //ajax통신
                    $.ajax({
                        type: 'PATCH',
                        url: '/psvm/item/modify',
                        headers: {"content-type": "application/json"},
                        data: JSON.stringify(dto),
                        success: function (data) {
                            alert("아이템이 수정되었습니다.");
                            location.reload();
                        },
                        error: function (request, status, error) {
                            var result = JSON.parse(request.responseText);
                            alert(result["message1"]);
                        }
                    })
                }
            });
        }
    });
    $('#multi1').on("click", ".btn-delete", function () {
        let item_id = $(this).parent().attr("data-item_id");
        if (confirm("삭제하시겠습니까? 삭제 시, 복구가 불가합니다.")) {
            $.ajax({
                type: 'DELETE',
                url: '/psvm/item/remove/' + item_id,
                success: function (result) {
                    alert("삭제되었습니다.")
                    location.reload();

                },
                error: function (request, status, error) {
                    var result = JSON.parse(request.responseText);
                    alert(result["message1"]);
                }
            })
        }
    });
    $('#registerButton').click(function () {
        $(location).attr("href", "/psvm/item/register");
    });
});

let msg = "${msg}";
if (msg != "") alert(msg);
