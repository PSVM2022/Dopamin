let toHtml1 = function (items) {
    let tmp1 = '<div class="delete_select_entire"> 전체 선택 | 선택 삭제 </div>';
    items.list.forEach(function (item) {
        tmp1 += '<div class="item-num" data-item_id=' + item.item_id + '>';
        tmp1 += '<div class="image-wrap_cart">';
        tmp1 += '<img class="cart-image" src=' + item.item_img + '>';
        tmp1 += '</div>';
        tmp1 += '<div class="cart_item_info">';
        tmp1 += '<div class="cart_item_detail" style="font-size: 1.1rem; font-weight: 500;">'
            + item.item_nm + '</div>';
        tmp1 += '<div style="display:flex; font-size: 0.8rem;">'
        tmp1 += '<div class="cart_item_detail" style="width: 3rem;">' + item.grd_nm + '</div>';
        tmp1 += '<div class="cart_item_detail">' + item.list_nm + '</div>';
        tmp1 += '</div>'
        tmp1 += '<div class="cart_item_dsc">' + item.item_dsc + '</div>';
        tmp1 += '</div>';
        tmp1 += '<div class="cart_item_price">' + item.item_price + ' DP</div>';
        tmp1 += '<buuton class="closed">x</buuton>';
        tmp1 += '</div>';
    })
    return tmp1
}
let toHtml2 = function (items) {
    let tmp2 = '';
    tmp2 += '<div class="cart_point">';
    tmp2 += '<div class="pay_info"> 결제 예정포인트 </div>';
    tmp2 += '<div class="cart_item_pay_info">';
    tmp2 += '<div class="more_info"><span class="item_info">상품수</span><span class="numberofitem">'
        + items.list.length + ' 개</span></div>';
    tmp2 += '<div class="more_info"><span class="item_info">보유 포인트</span><span class="numberofitem">'
        + items.my_point + ' DP</span></div>';
    tmp2 += '<div class="more_info"><span class="item_info">상품포인트</span><span class="numberofitem"  style="color:red;">'
        + items.total_point + ' DP</span></div>';
    tmp2 += '<div class="more_info"><span class="item_info">할인포인트</span><span class="numberofitem">0개</span></div>';
    tmp2 += '</div>';
    tmp2 += '<div class="total_info"><span class="total_amount">잔여 포인트</span><span class="total_money">'
        + items.after_point + ' DP</span></div>';
    tmp2 += '<button class="buy_button">구매하기</button>';
    return tmp2 + "</div>"
}
$(document).ready(function () {
    const price = document.getElementsByClassName("numberofitem");
    const _value = parseInt(price.innerHTML);
    const priceChange = _value ? parseInt(_value).toLocaleString("ko-KR") : 0
    price.innerHTML = priceChange;

    $('.cart_item').on("click", ".closed", function () {
        let item_id = $(this).parent().attr("data-item_id");
        console.log(item_id);
        $.ajax({
            type: 'DELETE',
            url: '/psvm/item/deleteCart/' + item_id,
            success: function (result) {
                alert("삭제에 성공했습니다.");
                location.reload();
            },
            error: function () {
                alert("삭제에 실패했습니다. 잠시후 다시 시도해주세요.");
            }
        })
    })
    $.ajax({
        type: 'GET',
        url: '/psvm/item/cart_main',
        success: function (result) {
            console.log(result)
            $('.cart_item').html(toHtml1(result));
            $('#cart_detail_price').html(toHtml2(result));
            let point = Number($('.total_money').text().split(' ', 1)[0]);
            console.log("총결제금액=" + point);
            if (point < 0) {
                $(".total_money").css("color", "#f00");
            }//$("test2 li").css("color", "#f00");
            $('.buy_button').click(function () {
                console.log("click");
                if (point < 0) {
                    if (confirm("포인트가 부족합니다. 포인트 충전하러 갈까요?")) {
                        window.location.href = "/psvm/item/chargePoint";
                    }
                } else {
                    if (confirm("구매하시겠습니까?")) {
                        let count = result.list.length;
                        let dto_array = new Array();
                        for (let i = 0; i < count; i++) {
                            let dto = {
                                "item_id": result.list[i].item_id,
                                "item_nm": result.list[i].item_nm,
                                "item_price": result.list[i].item_price
                            }
                            dto_array.push(dto);
                        }
                        console.log(dto_array);
                        $.ajax({
                            url: '/psvm/item/buyCart',
                            type: 'POST',
                            headers: {"content-type": "application/json"},
                            data: JSON.stringify(dto_array),
                            success: function (data) {
                                alert("구매가 확정되었습니다.");
                                if (confirm("보유 아이템 확인하러 갈까요?")) {
                                    window.location.href = "/psvm/mypage/myItem";
                                } else {
                                    location.reload();
                                }
                            },
                            error: function (request, status, error) {
                                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n"
                                    + "error:" + error);
                            }
                        })
                    }
                }
            });
        },
        error: function () {
            alert("장바구니가 비어있습니다. 구매하실 물건을 선택해 주세요.");
            location.href = "/psvm/item/item";
        }
    });
})
