<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="id" value="${pageContext.request.getSession(false) != null ? pageContext.request.getSession(false).getAttribute('id') : ''}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="../css/crowcanyon_3.css">
    <link rel="stylesheet" href="../css/hf.css">
    <script defer src="../js/m.hf.js"></script>
    <script defer src="../js/list.js"></script>
    <script defer src="../js/m.crowcanyon_3.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
    <div id="wrap" style="max-width: 480px;">
    <div class="search_pan">
        <div class="search_close xi-close"></div>
        <div class="search_center">
            <input class="input_search" type="search" placeholder="SEARCH">
            <p>검색어 입력후에 엔터를 누르세요.</p>
        </div>
    </div>
    <div class="top_banner">
        <div class="tb top_banner1"><a href="#">To my bestie For my bestie</a></div>
        <div class="tb top_banner2"><a href="#">매치프라이스 with 압구정 쇼룸</a></div>
        <div class="tb top_banner3"><a href="#">회원 혜택! 전제품 상시 5% 할인!</a></div>
        <div class="tb top_banner4"><a href="#">스코프서울 홈페이지 바로가기</a></div>
        <div class="close_btn">X</div>
    </div>
    <div class="header">
        <div class="logo"><a href="index.jsp">로고</a></div>
        <ul class="menu">
            <li class="menu_li">
                <a href="#">ABOUT</a>
                <ul class=" pan menu_pan1">
                    <li><a href="#">STORY</a></li>
                    <li><a href="#">COMPANY</a></li>
                    <li><a href="#">CONTACT</a></li>
                    <li><a href="#">STOCKIST</a></li>
                </ul>
            </li>
            <li class="menu_li">
                <a href="#">SHOP</a>
                <ul class=" pan menu_pan2">
                    <li><a href="#">재입고</a></li>
                    <li><a href="/m.list?list_cateno=0">컵</a></li>
                    <li><a href="/m.list?list_cateno=1">보울</a></li>
                    <li><a href="/m.list?list_cateno=2">플레이트</a></li>
                    <li><a href="/m.list?list_cateno=3">키친웨어</a></li>
                    <li><a href="#">선물세트</a></li>
                    <li><a href="#">굿즈</a></li>
                    <li><a href="#">OUTLET</a></li>
                </ul>
            </li>
            <li class="menu_li">
                <a href="#">RECOMMEND</a>
                <ul class=" pan menu_pan3">
                    <li><a href="#">크로우웨어</a></li>
                    <li><a href="#">산뜻한 봄 맞이</a></li>
                    <li><a href="#">반려동물과 함께🐾</a></li>
                    <li><a href="#">집들이 선물</a></li>
                </ul>
            </li>
            <li class="menu_li">
                <a href="#">JOURNAL</a>
                <ul class=" pan menu_pan4">
                    <li><a href="#">MAGAZINE</a></li>
                    <li><a href="#">ARCHIVE</a></li>
                </ul>
            </li>
            <li class="menu_li">
                <a href="#">COMMUNITY</a>
                <ul class=" pan menu_pan5">
                    <li><a href="/m.board/list">NOTICE</a></li>
                    <li><a href="#">Q&A</a></li>
                    <li><a href="#">REVIEW</a></li>
                    <li><a href="#"><i class="xi-instagram"></i></a></li>
                </ul>
            </li>
        </ul>

        <div class="top_btn">
            <i class="search xi-search xi-2x"></i>
            <a href="#" class="basket"><img src="../img/crowcanyon/page1/basket.png" alt=""></a>
            <a href="#"><i class="ham xi-bars xi-2x"></i></a>
        </div>
    </div>
    <div class="ham_pan">
            <i class="ham_close_btn xi-close"></i>
            <ul class="ham_ul2">
                <li class="ham_li2">
                    <a href="#">ABOUT</a>
                    <div class="ham_ul_inner">
                        <div><a href="#">STORY</a></div>
                        <div><a href="#">COMPANY</a></div>
                        <div><a href="#">CONTACT</a></div>
                        <div><a href="#">STOCKIST</a></div>
                    </div>
                </li>
                <li class="ham_li2">
                    <a href="#">SHOP</a>
                    <div class="ham_ul_inner">
                        <div><a href="#">재입고</a></div>
                        <div><a href="/m.list?list_cateno=0">컵</a></div>
                        <div><a href="/m.list?list_cateno=1">보울</a></div>
                        <div><a href="/m.list?list_cateno=2">플레이트</a></div>
                        <div><a href="/m.list?list_cateno=3">키친웨어</a></div>
                        <div><a href="#">선물세트</a></div>
                        <div><a href="#">굿즈</a></div>
                        <div><a href="#">OUTLET</a></div>
                    </div>
                </li>
                <li class="ham_li2">
                    <a href="#">RECOMMEND</a>
                    <ul class="ham_ul_inner">
                        <li><a href="#">크로우웨어</a></li>
                        <li><a href="#">산뜻한 봄 맞이</a></li>
                        <li><a href="#">반려동물과 함께🐾</a></li>
                        <li><a href="#">집들이 선물</a></li>
                    </ul>
                </li>
                <li class="ham_li2">
                    <a href="#">JOURNAL</a>
                    <ul class="ham_ul_inner">
                        <li><a href="#">MAGAZINE</a></li>
                        <li><a href="#">ARCHIVE</a></li>
                    </ul>
                </li>
                <li class="ham_li2">
                    <a href="#">COMMUNITY</a>
                    <ul class="ham_ul_inner">
                        <li><a href="/m.board/list">NOTICE</a></li>
                        <li><a href="#">Q&A</a></li>
                        <li><a href="#">REVIEW</a></li>
                        <li><a href="#"><i class="xi-instagram"></i></a></li>
                    </ul>
                </li>

            </ul>
            <ul class="ham_ul">
                <c:choose>
                    <c:when test="${id==null}">
                        <li class="ham_li"><a href="/m.login">로그인</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="ham_li"><a href="/m.login">${id}님</a></li>
                        <li class="ham_li"><a href="/m.logout">로그아웃</a></li>
                    </c:otherwise>
                </c:choose>
                <li class="ham_li"><a href="#">장바구니</a></li>
                <li class="ham_li"><a href="#">주문조회</a></li>
                <li class="ham_li"><a href="#">마이쇼핑</a></li>
                <li class="ham_li"><a href="#">최근상품</a></li>
            </ul>
        </div>
    <div class="contents">
        <div class="c_inner content_L">
            <img src="../img/crowcanyon/page2/${ListDto.list_cateno}/${ListDto.list_img}" alt="">
            <img src="../img/crowcanyon/page2/ex/${ListDto.list_ex}/1.jpg"alt="">
            <img src="../img/crowcanyon/page2/ex/${ListDto.list_ex}/2.jpg"alt="">
            <img src="../img/crowcanyon/page2/ex/${ListDto.list_ex}/3.jpg"alt="">
            <img src="../img/crowcanyon/page2/ex/${ListDto.list_ex}/4.jpg"alt="">
            <img src="../img/crowcanyon/page2/ex/${ListDto.list_ex}/5.jpg"alt="">
        </div>
        <div class="c_inner content_R">
            <div class="detail_box">
                <h3 class="name">${ListDto.list_name}</h3>
                <div class="dec">${ListDto.list_desc}</div>
                <div class="price">
                    <div class="o_price">￦${ListDto.list_o_price}</div>
                    <div class="s_price">(￦${ListDto.list_s_price})</div>
                </div>
                <div class="delivery">택배 ￦3,000 (￦50,000 이상 구매 시 무료)</div>
                <div class="item_no_box">
                    <div class="name_s">${ListDto.list_name}</div>
                    <div class="si_2">
                        <input type="button" value="▲" class="btn_qty_plus btn">
                        <input type="text" class="txt_qty" value="1">
                        <input type="button" value="▼" class="btn_qty_minus btn">
                    </div>
                </div>
                <div class="each_price">TOTAL : ￦<span class="f_price">0</span> (<span class="f_count">0</span>개)</div>
                <div class="buy long_btn"><a href="#">구매하기</a></div>
                <div class="cart long_btn"><a href="#">장바구니</a></div>
            </div>
        </div>
    </div>
    <div class="sec footer" id="sec5">
        <div class="f_inner_box">
            <div class="inner_L">
                <h2>02-336-5288</h2>
                <h4>CS 고객센터 운영시간 평일 13:00 - 17:00</h4>
                <h4>신한은행 100-035-137650 예금주 : 스코프컴퍼니(주)</h4>
                <h4>협업 및 마케팅 문의 : kim@scopeseoul.kr</h4>
            </div>
            <div class="inner_R">
                <h2>OUR BRAND</h2>
                <h3><a href="#">기업구매 문의하기</a></h3>
                <h3><a href="#">제니아테일러 공식홈페이지</a></h3>
                <h3><a href="#">유니슨 공식홈페이지</a></h3>
                <h3><a href="#">스코프서울 공식홈페이지</a></h3>
                <h3><a href="#">카카오선물하기 크로우캐년</a></h3>
                <h3><a href="#">카카오선물하기 스코프서울</a></h3>
            </div>
        </div>
        <ul class="f_menu">
            <li><a href="#">guide</a></li>
            <li><a href="#">privacy</a></li>
            <li><a href="#">agreement</a></li>
            <li><a href="#">catalog</a></li>
        </ul>
        <div class="address">
            <span>스코프컴퍼니 주식회사 | 설혜윤 |</span>
            <span> 10945 경기도 파주시 월롱면 황소바위길 309-1 에이동 |</span>
            <span> C.P.O: 서동순(cscenter@scopeseoul.kr) |</span>
            <span> License: [347-81-01800] | </span><br>
            <span> Online License: [2023-경기파주-0779] | </span>
            <span> Hosting by 카페24(주)</span>

            <div class="f_icon">
                <a href="#"><i class="xi-facebook"></i></a>
                <a href="#"><i class="xi-instagram"></i></a>
                <a href="#"><i class="xi-youtube"></i></a>
            </div>
        </div>
    </div>
</div>
</body>
</html>