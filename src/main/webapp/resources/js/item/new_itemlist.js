$(function () {
    new Swiper('.swiper-container', {
        slidesPerView: 5, //한번에 보여줄 개수
        autoplay: false, // 자동 재생 여부
        loop: true, // 반복 재생 여부
        loopAdditionalSlides: 1,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        navigation: {
            prevEl: '.swiper-prev',   //이전 슬라이드를 볼 수 있음
            nextEl: '.swiper-next'    //이후 슬라이드를 볼 수 있음
        }
    });
})
$(document).ready(function () {
    $(".item_details").on("click", ".add_cart_btn", function () {
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
    })
})
