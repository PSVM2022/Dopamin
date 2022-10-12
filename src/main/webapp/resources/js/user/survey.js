function surveyCheck() {
    let mbti = $('[name="ei"]:checked').val() + $('[name="ns"]:checked').val() + $(
        '[name="ft"]:checked').val() + $('[name="jp"]:checked').val() + "";
    $('[name="mbti"]').val(mbti);
    const arr = [$('[name="fav_genre1"]').val(), $('[name="fav_genre2"]').val(),
        $('[name="fav_genre3"]').val(), $('[name="fav_genre4"]').val(),
        $('[name="fav_genre5"]').val()];
    const resultArr = arr.filter(x => x != "")//빈문자열 제거
    const set = new Set(resultArr);
    if (resultArr.length !== set.size || mbti.length !== 4) {
        alert("정확히 선택해주세요!")
        event.preventDefault();
    }
}