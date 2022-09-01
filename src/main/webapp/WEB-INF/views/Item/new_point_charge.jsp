<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false" %>

<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>

<html lang="ko">
<head>
    <title>도파민!</title>
    <c:import url="/WEB-INF/views/common/default.jsp"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/home.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/item/psvm.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/item/charge.css'/>">

</head>

<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<div class="container">
    <div id="main_bar" style="justify-content: center;text-align: center;">
        <div class="dropdown" style="margin-left: -1rem;">
            <span class="item_menu" onclick="location.href='/psvm/item/item'" style="cursor:hand"
                  onfocus="blur();">상점</span>
            <div class="dropdown-content">
                <div class="category">
                    <a href="/psvm/item/list/스킨" class="skin">스킨</a>
                </div>
                <div class="category">
                    <a href="/psvm/item/list/꾸미기" class="skin">꾸미기</a>
                </div>
            </div>
        </div>
        <span class="item_menu" onclick="location.href='/psvm/item/cart'" style="cursor:hand" onfocus="blur();">장바구니</span>
        <span class="item_menu">포인트사용내역</span>
        <span class="item_menu" onclick="location.href='/psvm/item/chargePoint'" style="cursor:hand" onfocus="blur();">충전샵</span>
        <span class="item_menu">마이페이지</span>
    </div>
</div>
<main style="display: flex;justify-content: center;">
    <div id="left_ad"><img class="ad" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202109/103712-472/sc-1.png"></div>
    <div id="main_container">
        <%--    <a href="/psvm/item/cart_main">장바구니</a>--%>
        <div style="display:flex;justify-content: center">
            <div id="charge_container">
                    <div id="charge_banner">
                        <div class="before_after_hori"></div>
                        <img id="charge-banner-image" src="https://pbs.twimg.com/media/E3PZAhfVcAQbfSJ.jpg">
                        <div class="before_after_hori"></div>
                    </div>
                    <div id="payment_item">
                        <div class="before_after_hori"></div>
                        <div class="item_title">
                            <div class="before_after_hori"></div>
                            <div class="head_item_hori">
                                <div class="payment_cell_01">금액</div>
                                <div class="payment_cell_02">기본 + 보너스</div>
                                <div class="payment_cell_03">혜택</div>
                            </div>
                            <div class="before_after_hori"></div>
                        </div>
                        <div class="item_list">
                            <div class="before_after_hori"></div>
                            <div id="1_select" class="item_hori">
                                <div id="1_money" class="payment_01"><span class="real_price">1000</span>원</div>
                                <div class="payment_02">
                                    <div class="image-wrap_charge"><img src="https://static.solved.ac/coin/coin-small.svg" alt="Coins" class="charge_img"></div> 1,000 DP</div>
                                <div class="payment_03" id="1">
                                    <button class="charge_btn"><a href="#3_select" style="text-decoration: none; color:white;">충전</a></button>
                                </div>
                            </div>
                            <div class="before_after_hori"></div>
                        </div>
                        <div class="item_list">
                            <div class="before_after_hori"></div>
                            <div id="2_select" class="item_hori">
                                <div id="2_money" class="payment_01"><span class="fake_price">8,000원 </span><span> -> </span><span class="real_price">5000</span>원</div>
                                <div class="payment_02">
                                    <div class="image-wrap_charge"><img src="https://static.solved.ac/coin/coin-small.svg" alt="Coins" class="charge_img"></div> 5,000 DP + 3,000 DP</div>
                                <div class="payment_03" id="2">
                                    3,000원 할인
                                    <button class="charge_btn"><a href="#3_select" style="text-decoration: none; color:white;">충전</a></button>
                                </div>
                            </div>
                            <div class="before_after_hori"></div>
                        </div>
                        <div class="item_list">
                            <div class="before_after_hori"></div>
                            <div id="3_select" class="item_hori">
                                <div id="3_money" class="payment_01"><span class="fake_price">15,000원 </span><span> -> </span><span class="real_price">10000</span>원</div>
                                <div class="payment_02">
                                    <div class="image-wrap_charge"><img src="https://static.solved.ac/coin/coin-small.svg" alt="Coins" class="charge_img"></div> 10,000 DP + 5,000 DP</div>
                                <div class="payment_03" id="3">
                                    5,000원 할인
                                    <button class="charge_btn"><a href="#3_select" style="text-decoration: none; color:white;">충전</a></button>
                                </div>
                            </div>
                            <div class="before_after_hori"></div>
                        </div>
                        <div class="item_list">
                            <div class="before_after_hori"></div>
                            <div id="4_select" class="item_hori">
                                <div id="4_money" class="payment_01"><span class="fake_price">38,000원 </span><span> -> </span><span class="real_price">30000</span>원</div>
                                <div class="payment_02">
                                    <div class="image-wrap_charge"><img src="https://static.solved.ac/coin/coin-small.svg" alt="Coins" class="charge_img"></div> 30,000 DP + 8,000 DP</div>
                                <div class="payment_03" id="4">
                                    8,000원 할인
                                    <button class="charge_btn"><a href="#3_select" style="text-decoration: none; color:white;">충전</a></button>
                                </div>
                            </div>
                            <div class="before_after_hori"></div>
                        </div>
                        <div class="item_list">
                            <div class="before_after_hori"></div>
                            <div id="5_select" class="item_hori">
                                <div id="5_money" class="payment_01"><span class="fake_price">62,000원 </span><span> -> </span><span class="real_price">50000</span>원</div>
                                <div class="payment_02">
                                    <div class="image-wrap_charge"><img src="https://static.solved.ac/coin/coin-small.svg" alt="Coins" class="charge_img"></div> 50,000 DP + 12,000 DP</div>
                                <div class="payment_03" id="5">
                                    12,000원 할인
                                    <button class="charge_btn"><a href="#3_select" style="text-decoration: none; color:white;">충전</a></button>
                                </div>
                            </div>
                            <div class="before_after_hori"></div>
                        </div>
                        <div class="before_after_hori"></div>
                    </div>
                    <br>
                    <div style="display: flex; justify-content: center">
                        <div class="before_after_hori" style="width:6rem;"></div>
                        <div id="hi_method" class="payment_method">
                            <span class="payment">결제 수단을 선택하세요</span>
                            <div class="payment_wrap">
                                <div class="pay_method">
                                    간편결제/마일리지
                                    <div class="method_category">
                                        <div style="border:0.8px solid #ddd">
                                            <button id="kakaopay" class="pay">
                                                <img class="pay_img" src="https://biz.chosun.com/resizer/ihTXhvT6UE9Ct8aYdpqsvbyoKVU=/512x220/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosunbiz/GOPQHQHIPNAJRE4AEGSA67HF4U.jpg">
                                                <span class="pay_contents">카카오페이</span>
                                            </button>
                                        </div>
                                        <div style="border:0.8px solid #ddd">
                                            <button id="toss" class="pay">
                                                <img class="pay_img" src="https://wp-blog.toss.im/wp-content/uploads/2019/01/BI_L.png">
                                                <span class="pay_contents">토스</span>
                                            </button>
                                        </div>
                                        <div style="border:0.8px solid #ddd">
                                            <button id="naverpay" class="pay">
                                                <img class="pay_img" src="https://i0.wp.com/wowtale.net/wp-content/uploads/2021/04/naverpay-logo.png?w=1920&ssl=1">
                                                <span class="pay_contents">네이버페이</span>
                                            </button>
                                        </div>
                                        <div style="border:0.8px solid #ddd">
                                            <button id="samsungpay" class="pay">
                                                <img class="pay_img" src="https://4.bp.blogspot.com/-bEuashkhUHY/ViYpJVscTrI/AAAAAAAABXg/mtkyikCk9LQ/s1600/Samsung%2BPay%2BLogo.png">
                                                <span class="pay_contents">삼성페이</span>
                                            </button>
                                        </div>
                                        <div style="border:0.8px solid #ddd">
                                            <button id="payco" class="pay">
                                                <img class="pay_img" src="https://play-lh.googleusercontent.com/1H9v2JyA2UDgf9FeQ-PYL7-LEk9kzsm2yfnXkToEfsmaNXlPaH-oZhmaN5niSfiuBlg">
                                                <span class="pay_contents">페이코</span>
                                            </button>
                                        </div>
                                        <div style="border:0.8px solid #ddd">
                                            <button id="tmoney" class="pay">
                                                <img class="pay_img" src="https://www.tmoney.co.kr/images/ko/mobile/communication/img_cibi_01_m_n.jpg">
                                                <span class="pay_contents">티머니</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="pay_method">
                                    신용카드/계좌이체
                                    <div class="method_category" style="width: 31.3rem">
                                        <div style="border:0.8px solid #ddd">
                                            <button id="credit_card" class="pay">
                                                <img class="pay_img" src="https://previews.123rf.com/images/vectorplus/vectorplus1508/vectorplus150800162/44201556-%EC%8B%A0%EC%9A%A9-%EC%B9%B4%EB%93%9C-%EC%95%84%EC%9D%B4%EC%BD%98-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8-%ED%8F%89%EB%A9%B4-%EB%94%94%EC%9E%90%EC%9D%B8.jpg">
                                                <span class="pay_contents">신용/체크카드</span>
                                            </button>
                                        </div>
                                        <div style="border:0.8px solid #ddd">
                                            <button id="foreing_credit_card" class="pay">
                                                <img class="pay_img" src="https://www.jungle.co.kr/image/40af225744e6a0639f88c0f4">
                                                <span class="pay_contents">해외카드</span>
                                            </button>
                                        </div>
                                        <div style="border:0.8px solid #ddd">
                                            <button id="send_money" class="pay">
                                                <img class="pay_img" src="https://oopy.lazyrockets.com/api/v2/notion/image?src=https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fbf7d99d5-bc55-46fc-80c2-05ce7923e0f1%2Fmoney.png&blockId=2f2277ad-bd35-4b3d-80a5-647fa61e0543&width=256">
                                                <span class="pay_contents">실시간계좌이체</span>
                                            </button>
                                        </div>
                                        <div style="border:0.8px solid #ddd">
                                            <button id="paypal" class="pay">
                                                <img class="pay_img" src="https://mblogthumb-phinf.pstatic.net/MjAxOTAyMDZfODMg/MDAxNTQ5NDE1NTI3NzE0.SsKqDyyTMJHJ5Swvk9M_4Jp7_fhiEi0WBqjd5migyIgg.FiKyrV-h_9kkUgd2vRlUjQEKaC06QDq7wrxmWJZyFVYg.PNG.clwmrjf/paypal-logo.png?type=w800">
                                                <span class="pay_contents">페이팔</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="before_after_hori" style="width:6rem;"></div>
                    </div>
            </div>
        </div>

    </div>

    </div>
    <div id="right_ad"><img class="ad"
                            src="https://pbs.twimg.com/media/FZOMbVKaIAAtjhc?format=jpg&name=medium">
    </div>
</main>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
  let msg = "${msg}";
  if (msg != "") alert(msg);

  $(document).ready(function () {
    let hi_func = function (item_id) {
      if (confirm("카카오페이로 결제하시겠습니까?")) {
        let pymt_amt = $('#' + item_id + '_money .real_price').text();
        $.ajax({
          type: 'POST',
          dataType: 'json',
          url: '/psvm/item/recharge/' + pymt_amt,
          success: function (result) {
            var box = result.next_redirect_pc_url;
            window.open(box);
            location.reload();
          },
          error: function () {
            alert("결제에 실패했습니다. 잠시 후 다시 시도해 주세요");
            location.reload();
          }
        })
      }
    }
    $('#payment_item').on("click", ".charge_btn", function () {
      //alert("클릭");
      if (confirm("충전하시겠습니까?")) {
        if (confirm("결제 수단을 선택해 주세요.")) {
          let item_id = $(this).parent().attr("id");
          $('#' + item_id + '_select').css("background", "#f6c497");
          $('#kakaopay').click(function () {
            hi_func(item_id);
          })
          $('#' + item_id + '_select').css("background", "");
        }
      }
    });
  })
</script>
</html>
