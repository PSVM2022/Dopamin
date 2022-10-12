let msg = "${msg}";
if (msg != "") alert(msg);

$(document).ready(function () {
    let hi_func = function (item_id) {
        if (confirm("카카오페이로 결제하시겠습니까?")) {
            let pymt_amt = $('#' + item_id + '_money .real_price').text();
            $.ajax({
                type: 'POST',
                dataType: 'json',
                url: '/psvm/item/recharge/' + pymt_amt,
                success: function (result) {
                    var box = result.next_redirect_pc_url;
                    window.open(box);
                    location.reload();
                },
                error: function () {
                    alert("결제에 실패했습니다. 잠시 후 다시 시도해 주세요");
                    location.reload();
                }
            })
        }
    }
    $('#payment_item').on("click", ".charge_btn", function () {
        //alert("클릭");
        if (confirm("충전하시겠습니까?")) {
            if (confirm("결제 수단을 선택해 주세요.")) {
                let item_id = $(this).parent().attr("id");
                $('#' + item_id + '_select').css("background", "#f6c497");
                $('#kakaopay').click(function () {
                    hi_func(item_id);
                })
                $('#' + item_id + '_select').css("background", "");
            }
        }
    });
})
