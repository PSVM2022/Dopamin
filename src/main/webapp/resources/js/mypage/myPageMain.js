function pwdCheck() {
    console.log("pwd=", $("#pwd").val())
    if ($("#pwd").val() == "") {
        alert("비밀번호를 입력해주세요!")
        event.preventDefault();
    }
}

const open = () => {
    console.log("모달창열기")
    document.querySelector(".modal").classList.remove("hidden");
}
const close = () => {
    console.log("닫기")
    document.querySelector(".modal").classList.add("hidden");
}
document.querySelector("#userInfo").addEventListener("click", open);
document.querySelector(".closeBtn").addEventListener("click", close);
document.querySelector(".bg").addEventListener("click", close);

