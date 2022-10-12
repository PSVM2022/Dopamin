function wishBtn(cnts_id) {
    //let revw_id = $(this).parent().attr("deleteBtn");
    //console.log(cnts_id);
    //console.log("click");

    $.ajax({
        type: 'POST',       // 요청 메서드
        url: '/psvm/contents/' + cnts_id + '/wish',
        success: function () {
            alert("컨텐츠 찜")
            location.replace('/psvm/contents/' + cnts_id)
        },
        error: function () {// 에러가 발생했을 때, 호출될 함수
            alert("컨텐츠 찜 취소")
            location.replace('/psvm/contents/' + cnts_id)
        }
    }); // $.ajax()
};
