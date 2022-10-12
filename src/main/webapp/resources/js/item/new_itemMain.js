$(document).ready(function () {
    let toHtml = function (items) {
        let tmp = '';
        items.forEach(function (item) {

            tmp += '<div class="item_details">';

            tmp += '<div class="detail-container" item_id=' + item.item_id + '>';

            tmp += '<div id="item-img" style="width: 11rem; height: 9rem; margin: 0 auto;">';

            tmp += '<div class="image-wrap" item_id=' + item.item_id + '>';

            tmp += '<img id="item-image" src=' + item.item_img + '>'

            tmp += '<button class="add_cart_btn">담기</button>';

            tmp += '</div>';

            tmp += '</div>';

            tmp += '<div style="padding:0.1rem;">';

            tmp += '<span class="item_nm">' + item.item_nm + '</span>';

            tmp += '<span class="item_grd">' + item.grd_nm + '</span>'

            tmp += '</div>';

            tmp += '<div class="item_detail_dsc">' + item.item_dsc + '</div>';

            tmp += '<span class="item_price">' + item.item_price
                + '<span class="point">P</span></span>';

            tmp += '</div>';

            tmp += '</div>';

        })
        return tmp + '</div>';
    }
    $(document).ready(function () {
        $("#section").on("click", ".add_cart_btn", function () {
            let item_id = $(this).parent().attr("item_id");
            console.log("item_id=" + item_id);
            if (confirm("장바구니에 담으시겠습니까?")) {
                $.ajax({
                    type: 'POST',
                    url: '/psvm/item/addCart/' + item_id,
                    success: function (result) {
                        alert("장바구니에 담겼습니다.");
                        if (confirm("장바구니로 바로 가시겠습니까?")) {
                            location.href = "/psvm/item/cart";
                        }
                    },
                    error: function (request, status, error) {
                        var result = JSON.parse(request.responseText);
                        alert(result["message1"]);
                    }
                })
            }
        });
        $.ajax({
            type: 'GET',
            url: '/psvm/item/main',
            success: function (result) {
                console.log(result);
                //해당 태크가 지우고
                $('#section').html(toHtml(result));
            },
            error: function () {
                alert("잠시후 다시 시도해주세요.");
            }
        });
    })
})
