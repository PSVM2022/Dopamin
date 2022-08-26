<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page session="false" %>
<%--  getsession(false)==null  기존에 세션이 없음을 의미.즉,로그인되어있지 않음. --%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%-- jsp 작성할 때만 브라우저 캐싱 금지 --%>
<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('USERID')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<html>
<html lang="ko">

<head>
    <title>도파민!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="<c:url value='/image/favicon.png'/>">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR&family=Noto+Serif&display=swap">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/default.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/user/joinForm.css'/>">
    <%--home.css 부분을 빼고 자기 페이지의 css를 넣으세요--%>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/home.css?20210502'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>
<div class="container">
    <!-- 헤더 컨테이너. 이 페이지는 로그아웃 상태의 페이지 -->
    <header
            class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start border-bottom">
        <a href="<c:url value='/'/>"
           class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none px-3">
            <object data="<c:url value='/image/main_logo.svg' />" width="150" height="96"></object>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
            <li><a href="/psvm/" class="nav-link px-2 link-secondary">홈</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">신규작</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">인기작</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">커뮤니티</a></li>
            <li><a href="<c:url value="/mypage"/>" class="nav-link px-2 link-dark">마이페이지</a></li>
            <li><a href="<c:url value="/item/"/>" class="nav-link px-2 link-dark">상점</a></li>
        </ul>

        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
            <input type="search" class="form-control form-control-dark" placeholder="Search..."
                   aria-label="Search">
        </form>

        <div class="text-end">
            <button type="button" class="btn btn-warning me-2">Login</button>
        </div>
    </header>
</div>


<main>
    <div class="join-container">

        <h1>SIGN UP</h1>
        <div>
            <table border="1">
                <tbody>

                <tr>
                    <th>아이디</th>
                    <td class="input-box"><input type="text" id="user_id" placeholder="아이디를 입력해주세요."/>
                    </td>
                    <td>
                        <div>(영문, 숫자 조합, 4~15자)</div>
                    </td>
                    <td>
                        <div id="user_id_msg" class="msg"></div>
                    </td>
                    <button id="idCheckBtn">아이디 중복 체크</button>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" id="user_pwd" name="user_pwd" placeholder="비밀번호를 입력해주세요."/>
                    </td>
                    <td>
                        <div> (8~15자, 영어,숫자,특수문자 조합)</div>
                    </td>
                    <td>
                        <div id="user_pwd_msg" class="msg"></div>

                    </td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td><input type="password" id="pwdCheck"/>
                    </td>
                    <td>
                        <div id="pwd_check_msg" class="msg"></div>
                    </td>
                </tr>
                <tr>
                    <th>성</th>
                    <td><input type="text" id="f_nm" name="f_nm"/>
                    </td>
                    <td>
                        <div id="f_nm_msg" class="msg"></div>
                    </td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td><input type="text" id="l_nm" name="l_nm"/>
                    </td>
                    <td>
                        <div id="l_nm_msg" class="msg"></div>
                    </td>
                </tr>
                <tr>
                    <th>닉네임</th>
                    <td><input type="text" id="nic" name="nic"/>
                    </td>
                    <td>
                        <div id="nic_msg" class="msg"></div>
                    </td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td>
                        <div class="info" id="btdt">
                            <select class="box" id="year">
                                <option disabled selected>출생 연도</option>
                            </select>
                            <select class="box" id="month">
                                <option disabled selected>월</option>
                            </select>
                            <select class="box" id="day">
                                <option disabled selected>일</option>
                            </select>
                        </div>
                    </td>
                    <td>
                        <div id="btdt_msg" class="msg"></div>

                    </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td><input type="text" id="phone_num" name="phone_num" placeholder="전화번호를 입력해주세요"/></td>
                    <td>(예시: 010-1234-5678)</td>
                    <td>
                        <div id="phone_num_msg" class="msg"></div>
                    </td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td><select autofocus id="sex" name="sex">
                        <option value="0" selected>남자</option>
                        <option value="1">여자</option>
                    </select>
                    </td>
                    <td>
                        <div id="sex_msg" class="msg"></div>

                    </td>
                </tr>
                <tr id="nation">
                    <th>국적</th>
                    <td><select id="cnty">
                        <option value="KR" selected="selected">한국(KOREA)</option>
                        <option value="GH">가나(GHANA)</option>
                        <option value="GA">가봉(GABON)</option>
                        <option value="GY">가이아나(GUYANA)</option>
                        <option value="GM">감비아(GAMBIA)</option>
                        <option value="GT">과테말라(GUATEMALA)</option>
                        <option value="GD">그레나다(GRENADA)</option>
                        <option value="GE">그루지야(GEORGIA)</option>
                        <option value="GR">그리스(GREECE)</option>
                        <option value="GN">기니(GUINEA)</option>
                        <option value="GW">기니비소(GUINEA-BISSAU)</option>
                        <option value="NA">나미비아(NAMIBIA)</option>
                        <option value="NG">나이지리아(NIGERIA)</option>
                        <option value="ZA">남아프리카공화국(SOUTH AFRICA)</option>
                        <option value="AN">네덜란드(네덜란드령앤틸리스)(NETHERLANDS(ANTILLES))</option>
                        <option value="NL">네덜란드(네델란드)(NETHERLANDS)</option>
                        <option value="AW">네덜란드(아루바섬)(ARUBA)</option>
                        <option value="NP">네팔(NEPAL)</option>
                        <option value="NO">노르웨이(NORWAY)</option>
                        <option value="NZ">뉴질란드(NEW ZEALAND)</option>
                        <option value="NE">니제르(NIGER)</option>
                        <option value="NI">니카라과(NICARAGUA)</option>
                        <option value="KR">대한민국(KOREA (REP OF,))</option>
                        <option value="DK">덴마크(DENMARK)</option>
                        <option value="GL">덴마크(그린란드)(GREENLAND)</option>
                        <option value="FO">덴마크(페로즈제도)(FAROE ISLANDS)</option>
                        <option value="DO">도미니카공화국(DOMINICAN REPUBLIC)</option>
                        <option value="DM">도미니카연방(DOMINICA)</option>
                        <option value="DE">독일(GERMANY)</option>
                        <option value="TL">동티모르(TIMOR-LESTE)</option>
                        <option value="LA">라오스(LAO PEOPLE'S DEM REP)</option>
                        <option value="LR">라이베리아(LIBERIA)</option>
                        <option value="LV">라트비아(LATVIA)</option>
                        <option value="RU">러시아(RUSSIAN FEDERATION)</option>
                        <option value="LB">레바논(LEBANON)</option>
                        <option value="LS">레소토(LESOTHO)</option>
                        <option value="RO">루마니아(ROMANIA)</option>
                        <option value="LU">룩셈부르크(LUXEMBOURG)</option>
                        <option value="RW">르완다(RWANDA)</option>
                        <option value="LY">리비아(LIBYAN ARAB JAMAHIRIYA)</option>
                        <option value="LI">리첸쉬테인(LIECHTENSTEIN)</option>
                        <option value="LT">리투아니아(LITHUANIA)</option>
                        <option value="MG">마다가스카르(MADAGASCAR)</option>
                        <option value="MK">마케도니아(MACEDONIA)</option>
                        <option value="MW">말라위(MALAWI)</option>
                        <option value="MY">말레이지아(MALAYSIA)</option>
                        <option value="ML">말리(MALI)</option>
                        <option value="MX">멕시코(MEXICO)</option>
                        <option value="MC">모나코(MONACO)</option>
                        <option value="MA">모로코(MOROCCO)</option>
                        <option value="MU">모리셔스(MAURITIUS)</option>
                        <option value="MR">모리타니(MAURITANIA)</option>
                        <option value="MZ">모잠비크(MOZAMBIQUE)</option>
                        <option value="ME">몬테네그로(MONTENEGRO)</option>
                        <option value="MD">몰도바(MOLDOVA, REPUBLIC OF)</option>
                        <option value="MV">몰디브(MALDIVES)</option>
                        <option value="MT">몰타(MALTA)</option>
                        <option value="MN">몽고(MONGOLIA)</option>
                        <option value="US">미국(U.S.A)</option>
                        <option value="GU">미국(괌)(GUAM)</option>
                        <option value="MH">미국(마아샬제도)(MARSHALL ISLANDS)</option>
                        <option value="VI">미국(버진제도)(VIRGIN ISLANDS U.S.)</option>
                        <option value="WS">미국(사모아, 구 서사모아)(SAMOA)</option>
                        <option value="AS">미국(사모아제도)(AMERICAN SAMOA)</option>
                        <option value="MP">미국(사이판)(NORTHERN MARIANA ISLANDS)</option>
                        <option value="PW">미국(팔라우섬)(PALAU)</option>
                        <option value="PR">미국(푸에르토리코섬)(PUERTO RICO)</option>
                        <option value="MM">미얀마(MYANMAR)</option>
                        <option value="FM">미크로네시아(마이크로네시아)(MICRONESIA)</option>
                        <option value="VU">바누아투(VANUATU)</option>
                        <option value="BH">바레인(BAHRAIN)</option>
                        <option value="BB">바베이도스(BARBADOS)</option>
                        <option value="BS">바하마(BAHAMAS)</option>
                        <option value="BD">방글라데시(BANGLADESH)</option>
                        <option value="VE">베네수엘라(VENEZUELA)</option>
                        <option value="BJ">베넹(BENIN)</option>
                        <option value="VN">베트남(VIET NAM)</option>
                        <option value="BE">벨기에(BELGIUM)</option>
                        <option value="BY">벨라루스(BELARUS)</option>
                        <option value="BZ">벨리세(BELIZE)</option>
                        <option value="BA">보스니아헤르체코비나(Bosnia and Herzegovina)</option>
                        <option value="BW">보츠와나(BOTSWANA)</option>
                        <option value="BO">볼리비아(BOLIVIA)</option>
                        <option value="BF">부르키나파소(BURKINA FASO)</option>
                        <option value="BT">부탄(BHUTAN)</option>
                        <option value="BG">불가리아(BULGARIA(REP))</option>
                        <option value="BR">브라질(BRAZIL)</option>
                        <option value="BN">브루네이(나이)(BRUNEI DARUSSALAM)</option>
                        <option value="BI">브룬디(BURUNDI)</option>
                        <option value="SA">사우디아라비아(SAUDI ARABIA)</option>
                        <option value="CY">사이프러스(CYPRUS)</option>
                        <option value="SM">산마리노(SAN MARINO)</option>
                        <option value="SN">세네갈(SENEGAL)</option>
                        <option value="RS">세르비아/코소보(SERBIA/KOSOVO)</option>
                        <option value="SC">세이셸(SEYCHELLES)</option>
                        <option value="LC">세인트 루시아(SAINT LUCIA)</option>
                        <option value="VC">세인트빈센트그레나딘(SAINT VINCENT AND THE GRENADINES)</option>
                        <option value="KN">세인트키츠네비스(SAINT KITTS AND NEVIS)</option>
                        <option value="SB">솔로몬아일란드(SOLOMON ISLANDS)</option>
                        <option value="SR">수리남(SURINAME)</option>
                        <option value="LK">스리랑카(SRI LANKA)</option>
                        <option value="SZ">스와질랜드(SWAZILAND)</option>
                        <option value="SE">스웨덴(SWEDEN)</option>
                        <option value="CH">스위스(SWITZERLAND)</option>
                        <option value="ES">스페인(에스파니아)(SPAIN)</option>
                        <option value="SK">슬로바키아(SLOVAKIA)</option>
                        <option value="SI">슬로베니아(SLOVENIA)</option>
                        <option value="SL">시에라리온(SIERRA LEONE)</option>
                        <option value="SG">싱가포르(SINGAPORE)</option>
                        <option value="AE">아랍에미레이트연합국(UNITED ARAB EMIRATES)</option>
                        <option value="AM">아르메니아(ARMENIA)</option>
                        <option value="AR">아르헨티나(ARGENTINA)</option>
                        <option value="IS">아이슬란드(ICELAND)</option>
                        <option value="HT">아이티(HAITI)</option>
                        <option value="IE">아일란드(에이레)(IRELAND)</option>
                        <option value="AZ">아제르바이잔(AZERBAIJAN)</option>
                        <option value="AF">아프가니스탄(AFGHANISTAN)</option>
                        <option value="AD">안도라(ANDORRA)</option>
                        <option value="AL">알바니아(ALBANIA)</option>
                        <option value="DZ">알제리(ALGERIA)</option>
                        <option value="AO">앙골라(ANGOLA)</option>
                        <option value="AG">앤티과바부다(ANTIGUA AND BARBUDA)</option>
                        <option value="ER">에리트리아(ERITREA)</option>
                        <option value="EE">에스토니아(ESTONIA)</option>
                        <option value="EC">에콰도르(ECUADOR)</option>
                        <option value="SV">엘살바도르(EL SALVADOR)</option>
                        <option value="GB">영국(UNITED KINGDOM)</option>
                        <option value="MS">영국(몽세라)(MONTSERRAT)</option>
                        <option value="BM">영국(버뮤다섬)(BERMUDA)</option>
                        <option value="VG">영국(버진제도)(VIRGIN ISLANDS BRITISH)</option>
                        <option value="AI">영국(안귈라섬)(ANGUILLA)</option>
                        <option value="GI">영국(지브롤터)(GIBRALTAR)</option>
                        <option value="KY">영국(케이만제도)(CAYMAN ISLANDS)</option>
                        <option value="TC">영국(터크스케이코스제도)(TURKS AND CAICOS ISLANDS)</option>
                        <option value="YE">예멘(YEMEN)</option>
                        <option value="OM">오만(OMAN)</option>
                        <option value="NF">오스트레일리아(노퍽섬)(NORFOLK ISLAND)</option>
                        <option value="AU">오스트레일리아(호주)(AUSTRALIA)</option>
                        <option value="AT">오스트리아(AUSTRIA)</option>
                        <option value="HN">온두라스(HONDURAS)</option>
                        <option value="JO">요르단(JORDAN)</option>
                        <option value="UG">우간다(UGANDA)</option>
                        <option value="UY">우루과이(URUGUAY)</option>
                        <option value="UZ">우즈베크(UZBEKISTAN)</option>
                        <option value="UA">우크라이나(UKRAINE)</option>
                        <option value="ET">이디오피아(ETHIOPIA)</option>
                        <option value="IQ">이라크(IRAQ)</option>
                        <option value="IR">이란(IRAN(ISLAMIC REP))</option>
                        <option value="IL">이스라엘(ISRAEL)</option>
                        <option value="EG">이집트(EGYPT)</option>
                        <option value="IT">이탈리아(이태리)(ITALY)</option>
                        <option value="IN">인도(INDIA)</option>
                        <option value="ID">인도네시아(INDONESIA)</option>
                        <option value="JP">일본(JAPAN)</option>
                        <option value="JM">자메이카(JAMAICA)</option>
                        <option value="ZM">잠비아(ZAMBIA)</option>
                        <option value="CN">중국(CHINA(PEOPLE'S REP))</option>
                        <option value="MO">중국(마카오)(MACAU)</option>
                        <option value="HK">중국(홍콩)(HONG KONG)</option>
                        <option value="CF">중앙 아프리카(CENTRAL AFRICAN REPUBLIC)</option>
                        <option value="DJ">지부티(DJIBOUTI)</option>
                        <option value="ZW">짐바브웨(ZIMBABWE)</option>
                        <option value="TD">차드(CHAD)</option>
                        <option value="CZ">체코(CZECH REP)</option>
                        <option value="CL">칠레(CHILE)</option>
                        <option value="CM">카메룬(CAMEROON)</option>
                        <option value="CV">카보베르데(CAPE VERDE)</option>
                        <option value="KZ">카자흐(KAZAKHSTAN)</option>
                        <option value="QA">카타르(QATAR)</option>
                        <option value="KH">캄보디아(CAMBODIA)</option>
                        <option value="CA">캐나다(CANADA)</option>
                        <option value="KE">케냐(KENYA)</option>
                        <option value="CR">코스타리카(COSTA RICA)</option>
                        <option value="CI">코트디봐르(COTE D IVOIRE)</option>
                        <option value="CO">콜롬비아(COLOMBIA)</option>
                        <option value="CG">콩고(CONGO)</option>
                        <option value="CU">쿠바(CUBA)</option>
                        <option value="KW">쿠웨이트(KUWAIT)</option>
                        <option value="HR">크로아티아(CROATIA)</option>
                        <option value="KG">키르키즈스탄(KYRGYZSTAN)</option>
                        <option value="KI">키리바티(KIRIBATI)</option>
                        <option value="TH">타이(태국)(THAILAND)</option>
                        <option value="TW">타이완(대만)(TAIWAN)</option>
                        <option value="TJ">타지키스탄(TAJIKISTAN)</option>
                        <option value="TZ">탄자니아(TANZANIA(UNITED REP))</option>
                        <option value="TR">터키(TURKEY)</option>
                        <option value="TG">토고(TOGO)</option>
                        <option value="TO">통가(TONGA)</option>
                        <option value="TM">투르크메니스탄(TURKMENISTAN)</option>
                        <option value="TV">투발루(TUVALU)</option>
                        <option value="TN">튀니지(TUNISIA)</option>
                        <option value="TT">트리니다드토바고(TRINIDAD AND TOBAGO)</option>
                        <option value="PA">파나마(PANAMA(REP))</option>
                        <option value="PY">파라과이(PARAGUAY)</option>
                        <option value="PK">파키스탄(PAKISTAN)</option>
                        <option value="PG">파푸아뉴기니(PAPUA NEW GUINEA)</option>
                        <option value="PE">페루(PERU)</option>
                        <option value="PT">포르투갈(PORTUGAL)</option>
                        <option value="PL">폴란드(POLAND(REP))</option>
                        <option value="FR">프랑스(FRANCE)</option>
                        <option value="GP">프랑스(과데루프섬)(GUADELOUPE)</option>
                        <option value="GF">프랑스(기아나)(FRENCH GUIANA)</option>
                        <option value="NC">프랑스(뉴칼레도니아섬)(NEW CALEDONIA)</option>
                        <option value="RE">프랑스(레위니옹섬)(REUNION)</option>
                        <option value="MQ">프랑스(마르티니크섬)(MARTINIQUE)</option>
                        <option value="PF">프랑스(폴리네시아)(FRENCH POLYNESIA)</option>
                        <option value="FJ">피지(FIJI)</option>
                        <option value="FI">필란드(FINLAND)</option>
                        <option value="PH">필리핀(PHILIPPINES)</option>
                        <option value="HU">헝가리(HUNGARY(REP))</option>
                    </select></td>
                    <td>
                        <div id="cnty_msg" class="msg"></div>

                    </td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>
                        <div class="input-group">
                            <input type="text" name="userEmail1" id="userEmail1" placeholder="이메일을 입력해주세요">
                            <select class="form-control" name="userEmail2" id="userEmail2">
                                <option name="@naver.com">@naver.com</option>
                                <option value="@daum.net">@daum.net</option>
                                <option value="@gmail.com">@gmail.com</option>
                                <option value="@hanmail.com">@hanmail.com</option>
                            </select>
                        </div>
                    </td>
                    <td>
                        <div id="email_msg" class="msg"></div>
                    </td>
                </tr>
                </tbody>
            </table>

            <button type="submit" id="joinBtn">회원가입</button>

        </div>
    </div>

</main>

<footer class="footer mt-auto py-3 bg-light">
    <div class="container">
        <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
            <!-- Left -->
            <div class="me-5 d-none d-lg-block">
                <span>Get connected with us on social networks:</span>
            </div>
            <!-- Left -->

            <!-- Right -->
            <div>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-google"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-linkedin"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-github"></i>
                </a>
            </div>
            <!-- Right -->
        </section>
        <!-- Section: Social media -->

        <!-- Section: Links  -->
        <section class="">
            <div class="container text-center text-md-start mt-5">
                <!-- Grid row -->
                <div class="row mt-3">
                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <!-- Content -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            <i class="fas fa-gem me-3"></i>Company name
                        </h6>
                        <p>
                            Here you can use rows and columns to organize your footer content. Lorem
                            ipsum
                            dolor sit amet, consectetur adipisicing elit.
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Products
                        </h6>
                        <p>
                            <a href="#!" class="text-reset">Angular</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">React</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Vue</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Laravel</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Useful links
                        </h6>
                        <p>
                            <a href="#!" class="text-reset">Pricing</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Settings</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Orders</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Help</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                        <p><i class="fas fa-home me-3"></i> New York, NY 10012, US</p>
                        <p>
                            <i class="fas fa-envelope me-3"></i>
                            info@example.com
                        </p>
                        <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
                        <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
                    </div>
                    <!-- Grid column -->
                </div>
                <!-- Grid row -->
            </div>
        </section>
        <!-- Section: Links  -->

        <!-- Copyright -->
        <div class="text-center p-4 copyright">
            © 2021 Copyright:
            <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
        </div>
        <!-- Copyright -->
    </div>
</footer>

<script>
    $(document).ready(function () {
        var now = new Date();
        var year = now.getFullYear();
        var mon = (now.getMonth() + 1) > 9 ? '' + (now.getMonth() + 1) : '0' + (now.getMonth() + 1);
        var day = (now.getDate()) > 9 ? '' + (now.getDate()) : '0' + (now.getDate());
        //년도 selectbox만들기
        for (var i = 1900; i <= year; i++) {
            $('#year').append('<option value="' + i + '">' + i + '년</option>');
        }

        // 월별 selectbox 만들기
        for (var i = 1; i <= 12; i++) {
            var mm = i > 9 ? i : "0" + i;
            $('#month').append('<option value="' + mm + '">' + mm + '월</option>');
        }

        // 일별 selectbox 만들기
        for (var i = 1; i <= 31; i++) {
            var dd = i > 9 ? i : "0" + i;
            $('#day').append('<option value="' + dd + '">' + dd + '일</option>');
        }
        $("#year  > option[value=" + year + "]").attr("selected", "true");
        $("#month  > option[value=" + mon + "]").attr("selected", "true");
        $("#day  > option[value=" + day + "]").attr("selected", "true");

    })

    $("#idCheckBtn").click(function (){
        $.ajax({
            url:"<c:url value='/join/idduplck'/>",
            type:"POST",
            data:{id:$("#user_id").val()},
            success:function (res){
                alert(res.msg)
            }
        })
    });


    $("#joinBtn").click(function () {
        //비밀번호 확인
        let pwd = document.getElementById('user_pwd');
        let pwdCheck = document.getElementById('pwdCheck');
        let pwd_check_msg = document.getElementById('pwd_check_msg');
        if (pwd.value != pwdCheck.value) {
            alert("비밀번호가 일치하지 않습니다.")
            return;
        }

        let email = $('#userEmail1').val() + $("#userEmail2").val();
        let nic = $('#nic').val();
        let btdt = $('#year').val() + $('#month').val() + $('#day').val();
        let userDto = {
            "user_id": $('#user_id').val(),
            "user_pwd": $('#user_pwd').val(),
            "f_nm": $('#f_nm').val(),
            "l_nm": $('#l_nm').val(),
            "phone_num": $('#phone_num').val(),
            "cnty": $('#cnty').val(),
            "email": email,
            "nic": $('#nic').val(),
            "btdt": btdt,
            "sex": $('#sex').val()
        };

        console.log(userDto)
        $.ajax({
            type: 'POST',
            url: '/psvm/join/join',
            headers: {"content-type": "application/json"},
            dataType: 'text',
            data: JSON.stringify(userDto),
            success: function (response) {
                let result = JSON.parse(response);
                if (result.successJoin !== undefined) {
                    alert(result.successJoin);
                    location.href = "/psvm/login/login";
                }
                console.log(result)
                console.log("result.user_id" + result.user_id)
                console.log("result.user_pwd" + result.user_pwd)
                console.log("result.f_nm+" + result.f_nm)
                console.log("result.l_nm" + result.l_nm)
                console.log("result.phone_num" + result.phone_num)
                console.log("result.cnty" + result.cnty)
                console.log("result.email" + result.email)
                console.log("result.nic" + result.nic)
                console.log("result.btdt" + result.btdt)
                console.log("result.sex" + result.sex)
                console.log("result.id_dupl_err" + result.id_dupl_err);

                $("#user_id_msg").html(result.user_id = (result.user_id !== undefined ? result.user_id : ""));
                $("#user_id_msg2").html(result.id_dupl_err = (result.id_dupl_err !== undefined ? result.id_dupl_err : ""));
                $("#user_pwd_msg").html(result.user_pwd = (result.user_pwd !== undefined ? result.user_pwd : ""));
                $("#f_nm_msg").html(result.f_nm = (result.f_nm !== undefined ? result.f_nm : ""));
                $("#l_nm_msg").html(result.l_nm = (result.l_nm !== undefined ? result.l_nm : ""));
                $("#phone_num_msg").html(result.phone_num = (result.phone_num !== undefined ? result.phone_num : ""));
                $("#cnty_msg").html(result.cnty = (result.cnty !== undefined ? result.cnty : ""));
                $("#email_msg").html(result.email = (result.email !== undefined ? result.email : ""));
                $("#nic_msg").html(result.nic = (result.nic !== undefined ? result.nic : ""));
                $("#btdt_msg").html(result.btdt = (result.btdt !== undefined ? result.btdt : ""));
                $("#sex_msg").html(result.sex = (result.sex !== undefined ? result.sex : ""));
            },
            error: function () {
                alert("error")
            }
        });

    });

</script>


</body>

</html>