//등록 버튼 클릭시 한줄평 작성-> 등록
function insertBtn(cnts_id) {
    // $("#insertBtn").click(function(){
    //console.log("click");
    //console.log(cnts_id);

    let review = $("input[name=review]").val();
    //console.log(review);

    if (review == [] || review.trim().length == 0) {     //공백 문자열만 들어올 시 처리
        alert("내용을 입력해주세요!")
        return false
    }
    $.ajax({
        type: 'POST',   // 요청 메서드
        url: '/psvm/contents/' + cnts_id + '/writeReview',
        // data: JSON.stringify({cnts_id: cnts_id, revw_body: review}),
        data: {
            "review": review
        },
        // headers: {"content-type": "application/json"}, // 요청 헤더
        success: function () {
            alert("한줄평 등록이 완료되었습니다.")
            location.replace('/psvm/contents/' + cnts_id + '/contentsReview')
        },
        error: function () {// 에러가 발생했을 때, 호출될 함수
            alert("로그인 후 이용 가능합니다.")    //에러를 처리해야하는데 로그인 안한걸 에러로 처리하면 안될듯 수정사항.
        }
    }); // $.ajax()

};

//한줄평 수정 -> 유저 본인이 작성한 한줄평인지 alert 띄워줘야함
function updateBtn(cnts_id, revw_id) {
    // $("#insertBtn").click(function(){
    console.log("click");
    console.log(cnts_id);
    console.log(revw_id);   //여기까지 찍힘

    let revw = $('div.revw', $(this).parent()).text()
    console.log(revw);

    $("input[name=revw]").val(revw);
    $("#updateBtn").attr("revw_id", revw_id);
    console.log(revw);

    if (revw == [] || revw.trim().length == 0) {     //공백 문자열만 들어올 시 처리
        alert("수정할 내용을 입력해주세요!")
        return false
    }

    $.ajax({
        type: 'POST',       // 요청 메서드
        url: '/psvm/contents/' + cnts_id + '/modifyReview',
        data: {
            data: {
                "review": review
            }
        },
        // headers: {"content-type": "application/json"}, // 요청 헤더
        success: function () {
            alert("한줄평 수정이 완료되었습니다.")
            location.replace('/psvm/contents/' + cnts_id + '/contentsReview')
        },
        error: function () {// 에러가 발생했을 때, 호출될 함수
            alert("잠시 후 다시 시도해주세요.")
        }
    }); // $.ajax()
};

//한줄평 삭제 -> 유저 본인이 작성한 한줄평인지 alert 띄워줘야함
function deleteBtn(cnts_id, revw_id) {
    //let revw_id = $(this).parent().attr("deleteBtn");
    //console.log(revw_id);
    //console.log(cnts_id);
    //console.log("click");

    $.ajax({
        type: 'POST',       // 요청 메서드
        url: '/psvm/contents/' + cnts_id + '/deleteReview',
        data: {
            "revw_id": revw_id
        },
        success: function () {
            alert("한줄평이 삭제되었습니다.")
            location.replace('/psvm/contents/' + cnts_id + '/contentsReview')
        },
        error: function () {// 에러가 발생했을 때, 호출될 함수
            alert("삭제 권한이 없습니다.")
            //location.replace('/psvm/contents/' + cnts_id + '/testReviewView')
        }
    }); // $.ajax()
};
