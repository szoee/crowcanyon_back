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
    <link rel="stylesheet" href="../css/crowcanyon_board.css">
    <link rel="stylesheet" href="../css/hf.css">
    <script defer src="../js/m.hf.js"></script>
    <script defer src="../js/list.js"></script>
    <script defer src="../js/crowcanyon_login.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<script>
</script>
<body>
<div id="wrap">
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
    <div class="content">
        <div class="login">게시물 ${mode=="new"?"쓰기":"읽기"}</div>
        <form action="#" id="frm">
            <input type="text" name="bno" value="No.${boardDto.bno}" readonly class="no" >
            <input type="text" name="title" id="title" value="${boardDto.title}" ${mode=="new"?"":"readonly"} class="title">

            <div id="writer" ><span>${boardDto.writer}</span></div>

            <textarea name="content" id="content" ${mode=="new"?"":"readonly"}>${boardDto.content}</textarea>


            <c:if test="${mode == 'new'}" >
                <button type="button"  class="btn" id="btn_write">저장</button>
            </c:if>

            <c:if test="${mode != 'new' && boardDto.writer.equals(id)}">
                <button type="button"  class="btn" id="btn_modify">수정</button>
                <button type="button"  class="btn" id="btn_del">삭제</button>
            </c:if>


            <button type="button"  class="btn" id="btn_list">돌아가기</button>
        </form>

        <hr />

        <div id="comment_area" >
            <c:if test="${mode != 'new'}" >
                <jsp:include page="comment.jsp" flush="false" />
            <%--            flush: 지정한 jsp 페이지를 실행하기 전에 출력 버퍼를 플러지할리 여부 결정--%>
            </c:if>
        </div>
    </div>
</div>
</div>
</body>
<script>
    $(document).ready(function() {
        var listUrl = "${pageContext.request.contextPath}/m.board/list?page=${page}&pageSize=${pageSize}";
        var writeUrl = "${pageContext.request.contextPath}/m.board/write";
        var removeUrl = "${pageContext.request.contextPath}/m.board/remove";

        //돌아가기
        $('#btn_list').on('click',function(){
            location.href="<c:url value="/m.board/list"/>?page=${page}&pageSize=${pageSize}";
        });

        //저장
        $('#btn_write').on('click', function() {
            var title = $('#title').val().trim();
            var content = $('#content').val().trim();

            if (title === "") {
                alert("제목을 입력하세요.");
                $('#title').focus();
            } else if (content === "") {
                alert("내용을 입력하세요.");
                $('#content').focus();
            } else {
                $.ajax({
                    url: writeUrl,
                    method: 'POST',
                    data: {
                        title: title,
                        content: content
                    },
                    success: function(response) {
                        alert('글이 성공적으로 작성되었습니다.');
                        location.href = listUrl;
                    },
                    error: function(xhr, status, error) {
                        alert('글 작성 중 오류가 발생하였습니다.');
                        console.error(xhr.responseText);
                    }
                });
            }
        });

        //삭제하기
        $('#btn_del').on("click", function(){
            if(!confirm("삭제하시겠습니까?")) return;

            let tmp_param = get_uri_info();

            let frm = $("#frm");
            frm.attr("action", "<c:url value='/m.board/remove'/>?"+tmp_param)
            frm.attr("method", "post");
            frm.submit();

        });

        //수정하기
        $('#btn_modify').on('click', function(){
            let isReadonly = $('#title').attr("readonly");

            //읽기 상태에서 수정
            if(isReadonly == "readonly") {
                $('.login').text("게시물 수정")
                $('#title').attr('readonly', false);
                $('#content').attr('readonly', false);
                $('#btn_modify').text('확인');
                $('#title').focus();

                return;
            }

            // 수정상태에서 수정
            let tmp_param = get_uri_info();

            let frm = $("#frm");
            frm.attr("action", "<c:url value='/m.board/modify'/>?"+tmp_param)
            frm.attr("method", "post");
            frm.submit();
        });

        function get_uri_info() {
            const searchParam = new URLSearchParams(location.search);
            let tmp_param="";

            for(const param of searchParam) {
                tmp_param += param[0]+"="+param[1]+"&";
            }

            return tmp_param;
        }


    });
</script>
</html>
