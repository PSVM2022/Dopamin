function equipSkin(item_id, equip_stat, list_id) {

    if (equip_stat == -1) {
        var res = confirm("착용하시면 환불이 불가능합니다. 착용하시겠습니까?")
        if (res == true) {
            $.ajax({
                anyne: true,
                type: 'POST',       // 요청 메서드
                url: '/psvm/mypage/equip',
                data: {
                    "item_id": item_id,
                    "equip_stat": equip_stat,
                    "list_id": list_id
                },
                //// 요청 URI
                // headers: {"content-type": "application/json"}, // 요청 헤더
                success: function (data) {
                    console.log(item_id)
                    console.log(equip_stat)
                    location.replace("myItem")

                },
                error: function () {
                    alert("error")
                    console.log(item_id)
                    console.log(equip_stat)
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
            alert("착용되었습니다.")

        } else {
            alert("취소하셨습니다.")
        }
    } else if (equip_stat == 0) {
        var res = confirm("착용하시겠습니까?")
        if (res == true) {
            $.ajax({
                anyne: true,
                type: 'POST',       // 요청 메서드
                url: '/psvm/mypage/equip',
                data: {
                    "item_id": item_id,
                    "equip_stat": equip_stat,
                    "list_id": list_id
                },
                //// 요청 URI
                // headers: {"content-type": "application/json"}, // 요청 헤더
                success: function (data) {
                    console.log(item_id)
                    console.log(equip_stat)
                    location.replace("myItem")

                },
                error: function () {
                    alert("error")
                    console.log(item_id)
                    console.log(equip_stat)
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
            alert("착용되었습니다.")

        } else {
            alert("취소하셨습니다.")
        }
    } else {
        var res = confirm("기본이미지를 착용하시겠습니까?")
        if (res == true) {
            $.ajax({
                anyne: true,
                type: 'POST',       // 요청 메서드
                url: '/psvm/mypage/equip',
                data: {
                    "item_id": item_id,
                    "equip_stat": equip_stat,
                    "list_id": list_id
                },
                //// 요청 URI
                // headers: {"content-type": "application/json"}, // 요청 헤더
                success: function (data) {
                    console.log(item_id)
                    console.log(equip_stat)
                    location.replace("myItem")

                },
                error: function () {
                    alert("error")
                    console.log(item_id)
                    console.log(equip_stat)
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
            alert("착용되었습니다.")

        } else {
            alert("취소하셨습니다.")
        }
    }
}
