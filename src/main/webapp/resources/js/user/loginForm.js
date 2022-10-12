function formCheck(frm) {
    if (frm.id.value.length == 0) {
        setMessage('<i class="fa fa-exclamation-circle"> 아이디를 입력해주세요.', frm.id);
        return false;
    }
    if (frm.pwd.value.length == 0) {
        setMessage('<i class="fa fa-exclamation-circle"> 비밀번호를 입력해주세요.', frm.pwd);
        return false;
    }
    return true;
}

function setMessage(msg, element) {
    document.getElementById("msg").innerHTML = `${msg}`;
    // document.getElementById("msg").innerHTML = ` ${'${msg}'}`;
    if (element) {
        element.select();
    }
}
