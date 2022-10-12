$(function () {
    var chkObj = document.getElementsByName("revwId");
    var rowCnt = chkObj.length;

    $("input[name='allCheck']").click(function () {
        var chk_listArr = $("input[name='revwId']");
        for (var i = 0; i < chk_listArr.length; i++) {
            chk_listArr[i].checked = this.checked;
        }
    });
    $("input[name='revwId']").click(function () {
        if ($("input[name='revwId']:checked").length == rowCnt) {
            $("input[name='allCheck']")[0].checked = true;
        } else {
            $("input[name='allCheck']")[0].checked = false;
        }
    });
});

function deleteValue() {
    var valueArr = new Array();
    var list = $("input[name='revwId']");
    for (var i = 0; i < list.length; i++) {
        if (list[i].checked) { //선택되어 있으면 배열에 값을 저장함
            valueArr.push(list[i].value);
        }
    }
    console.log(valueArr)

    if (valueArr.length == 0) {
        alert("선택된 한줄평이 없습니다.");
    } else {
        var chk = confirm("정말 삭제하시겠습니까?");
        $.ajax({
            url: '/psvm/mypage/deleterevw',                    // 전송 URL
            type: 'POST',                // POST 방식
            headers: {"content-type": "application/json"},
            data: JSON.stringify(valueArr),
            success: function () {
                alert("삭제 성공");
                location.replace("revw")
            },
            error: function () {
                alert("error")
            } // 에러가 발생했을 때, 호출될 함수
        });
    }
}
