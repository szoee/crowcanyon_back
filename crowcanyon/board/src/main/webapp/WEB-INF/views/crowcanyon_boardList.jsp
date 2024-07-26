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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="../css/crowcanyon_boardList.css">
    <link rel="stylesheet" href="../css/hf.css">
    <script defer src="../js/hf.js"></script>
    <script defer src="../js/list.js"></script>
    <script defer src="../js/crowcanyon_login.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<script>
    let sp = ["android", "iphone", "ipad", "macintosh"];

    for(let i=0; i<sp.length; i++) {
        if(navigator.userAgent.toLowerCase().match(sp[i])) {
            location.replace("<c:url value='/m.board/list'/>")
        }
    }
</script>
<body>
<div id="wrap" style="min-width: 1440px">
    <div class="search_pan">
        <div class="search_close xi-close"></div>
        <div class="search_center">
            <form id="search">
                <input class="input_search" name="search" type="search" placeholder="SEARCH">
                <button class="search_btn">검색</button>
            </form>
            <p>검색어 입력후에 버튼을 누르세요.</p>
        </div>
    </div>
    <div class="top_banner">
        <div class="tb top_banner1"><a href="#">To my bestie For my bestie</a></div>
        <div class="tb top_banner2"><a href="#">매치프라이스 with 압구정 쇼룸</a></div>
        <div class="tb top_banner3"><a href="#">회원 혜택! 전제품 상시 5% 할인!</a></div>
        <div class="tb top_banner4"><a href="#">스코프서울 홈페이지 바로가기</a></div>
        <div class="close_btn">X</div>
    </div>
    <div class="header" style="min-width: 1440px">
        <div class="logo"><a href="/">로고</a></div>
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
                    <li><a href="/list?list_cateno=0">컵</a></li>
                    <li><a href="/list?list_cateno=1">보울</a></li>
                    <li><a href="/list?list_cateno=2">플레이트</a></li>
                    <li><a href="/list?list_cateno=3">키친웨어</a></li>
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
                    <li><a href="/board/list">NOTICE</a></li>
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
                    <div><a href="/list?list_cateno=0">컵</a></div>
                    <div><a href="/list?list_cateno=1">보울</a></div>
                    <div><a href="/list?list_cateno=2">플레이트</a></div>
                    <div><a href="/list?list_cateno=3">키친웨어</a></div>
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
                    <li><a href="/board/list">NOTICE</a></li>
                    <li><a href="#">Q&A</a></li>
                    <li><a href="#">REVIEW</a></li>
                    <li><a href="#"><i class="xi-instagram"></i></a></li>
                </ul>
            </li>

        </ul>
        <ul class="ham_ul">
            <c:choose>
                <c:when test="${id==null}">
                    <li class="ham_li"><a href="/login">로그인</a></li>
                </c:when>
                <c:otherwise>
                    <li class="ham_li"><a href="/login">${id}님</a></li>
                    <li class="ham_li"><a href="/logout">로그아웃</a></li>
                </c:otherwise>
            </c:choose>
            <li class="ham_li"><a href="#">장바구니</a></li>
            <li class="ham_li"><a href="#">주문조회</a></li>
            <li class="ham_li"><a href="#">마이쇼핑</a></li>
            <li class="ham_li"><a href="#">최근상품</a></li>
        </ul>
    </div>
    <div class="content">
        <div class="login">공지사항</div>
        <c:if test="${id == 'crowcanyon'}">
        <button type="button" class="btn" id="btn_write">글쓰기</button>
        </c:if>
        <table>
            <tr>
                <th class="tr_top">NO</th>
                <th class="tr_top">SUBJECT</th>
                <th class="tr_top">NAME</th>
                <th class="tr_top">DATE</th>
                <th class="tr_top">HIT</th>
            </tr>
            <c:forEach var="boardDto" items="${list}">
            <tr>
                <td>${boardDto.bno}</td>
                <td>
                    <a href="<c:url value="/board/read?bno=${boardDto.bno}&page=${ph.page}&pageSize=${ph.pageSize}" />">
                        ${boardDto.title}
                    </a>
                </td>
                <td>${boardDto.writer}</td>
                <td>
                    <span>
                        <fmt:formatDate value="${boardDto.reg_date}" pattern="yyyy-MM-dd" />
                    </span>
                    <span><fmt:formatDate value="${boardDto.reg_date}" pattern="HH:mm:ss" /></span>
                </td>
                <td>${boardDto.view_count}</td>
            </tr>
            </c:forEach>
        </table>
        <div class="pagination">
            <c:if test="${ph.showPrevBtn}">
                <a href="<c:url value="/board/list?page=${ph.startPage - 1}&pageSize=${ph.pageSize}" />" class="startPage">[PREV]</a>
            </c:if>

            <c:forEach var="i" begin="${ph.startPage}" end="${ph.endPage}">
                <a href="<c:url value="/board/list?page=${i}&pageSize=${ph.pageSize}" />" class="${i==ph.page?"pageActive":""}">${i}</a>
            </c:forEach>

            <c:if test="${ph.showNextBtn}">
                <a href="<c:url value="/board/list?page=${ph.endPage + 1}&pageSize=${ph.pageSize}" />" class="endPage">[NEXT]</a>
            </c:if>
        </div>
    </div>
</div>
</body>
<script>
    $(document).ready(function() {
        $('#btn_write').on('click',function(){
            location.href="<c:url value="/board/write"/>";
        });

    });

</script>
</html>
