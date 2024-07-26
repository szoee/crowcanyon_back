<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="logInOutLink" value="${ sessionScope.id==null ? '/login/login':'/login/logout' }" />
<c:set var="logInOutTxt" value="${ sessionScope.id==null ? 'login':'logout' }" />

<c:set var="userId" value="${ pageContext.request.getSession(false).getAttribute('id')==null ? '':pageContext.request.getSession(false).getAttribute('id') }" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 페이지</title>
    <link rel="stylesheet" href="<c:url value='/css/common.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/h_f.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/board.css'/> ">

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<body>
<div class="header">
    <div class="content_area">
        <div id="logo">
            <a href="<c:url value='/'/>">BITSTUDY</a>
        </div>

        <ul class="menu">
            <li class="item">
                <a href="<c:url value='/'/>">Home</a>
            </li>
            <li class="item">
                <a href="<c:url value='/board/list'/>">Board</a>
            </li>
            <%-- <li class="item">
               <a href="<c:url value='/login/login'/>">login</a>
            </li>  --%>
            <li class="item">
                <a href="<c:url value='${logInOutLink} '/>">${logInOutTxt}</a>
            </li>

            <c:choose>
                <c:when test="${userId==null}">
                    <li class="item">
                        <a href="<c:url value='/register/add'/>">Sign in</a>
                    </li>
                </c:when>

                <c:otherwise>
                    <li class="item">
                            ${userId} 님
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>

<div class="main">
    <div class="content_area">
        <h2 id="page_mode">게시물 ${mode=="new"?"쓰기":"읽기"}</h2>

        <form action="" id="frm">
            <input type="text" name="bno" value="${boardDto.bno}" readonly >
            <input type="text" name="title" id="title" value="${boardDto.title}" ${mode=="new"?"":"readonly"} >

            <div id="writer" ><b>${boardDto.writer}</b></div>

            <textarea name="content" id="content" ${mode=="new"?"":"readonly"} >${boardDto.content}</textarea>
<%-- 파일 업로드--%>
<input type="file" name="f_file"  multiple="multiple">
<br /><br />

            <c:if test="${mode == 'new'}" >
                <button type="button"  class="btn" id="btn_write">저장</button>
            </c:if>

            <c:if test="${mode != 'new' && boardDto.writer.equals(userId)}">
                <button type="button"  class="btn" id="btn_modify">수정</button>
                <button type="button"  class="btn" id="btn_del">삭제</button>
            </c:if>


            <button type="button" class="btn" id="btn_list">돌아가기</button>
        </form>

        <hr />

        <div id="comment_area" >

            <jsp:include page="comment.jsp" flush="false" />
<%--            flush: 지정한 jsp 페이지를 실행하기 전에 출력 버퍼를 플러지할리 여부 결정--%>


<%--            <form action="" id="reg_comment">--%>
<%--                <input type="text" id="txt_comment" name="comment" placeholder="댓글 추가" >--%>
<%--                <button type="button" id="btn_submit_comment">등록</button>--%>
<%--            </form>--%>
<%--            <div id="list_comment">--%>
<%--                <div class="list_item">--%>
<%--                    <div>--%>
<%--                        <div class="item_head">--%>
<%--                            <span>작성자</span>--%>
<%--                            <span>2020-11-25 05:42</span>--%>
<%--                        </div>--%>
<%--                        <div class="item_body">--%>
<%--                            <input type="text" class="comment_title" name="comment_title" value="댓글 내용" readonly >--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div>--%>
<%--                        <button type="button" class="btn_comment btn_comment_modify">수정</button>--%>
<%--                        <button type="button" class="btn_comment btn_comment_del">삭제</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>

        <script>
            $(document).ready(function(){










                $('#btn_list').on('click', function(){

                    let tmp_param = get_uri_info();

                    <%--location.href = "<c:url value='/board/list' />?page=${param.page}&pageSize=${param.pageSize}";--%>
                    location.href = "<c:url value='/board/list' />?page=${page}&pageSize=${pageSize}&option=${param.option}&keyword=${param.keyword}";
                })

                $('#btn_write').on('click',function(){
                    // 유효성 검사 - title, content 빈칸 체크
                    if($('#title').val().trim() == "") {
                        alert("제목을 입력하시오");
                        $('#title').focus();
                        // return;
                    }
                    else if($('#content').val().trim() == "") {
                        alert("내용을 입력하시오");
                        $('#content').focus();
                        // return;
                    }
                    else {
                        let frm = $("#frm");
                        frm.attr("action", "<c:url value='/board/write'/>")
                        frm.attr("method", "POST");
                        frm.attr('enctype','multipart/form-data');
                        frm.submit();
                    }
                });


                $('#btn_modify').on('click', function(){
                    let isReadonly = $('#title').attr("readonly");

                    // 1. 기존 읽기 상태일때 '수정'버튼 누른 경우
                    //  #page_mode, #title, #content 의 readonly 삭제
                    if(isReadonly == "readonly") {
                        $('#page_mode').text("게시물 수정")
                        $('#title').attr('readonly', false);
                        $('#content').attr('readonly', false);
                        $('#btn_modify').text('확인');
                        $('#title').focus();

                        return;
                    }

                    // 2. 수정 상태일때 또 '수정' 버튼 누른 경우
                    let tmp_param = get_uri_info();

                    let frm = $("#frm");
                    frm.attr("action", "<c:url value='/board/modify'/>?"+tmp_param)
                    frm.attr("method", "post");
                    frm.submit();
                });

                function get_uri_info() {
                    // url 값 모두 가져오기
                    // console.log(location.href);
                    const searchParam = new URLSearchParams(location.search);
                    // [ bno=224,  page=1,  pageSize=10,  option=,  keyword= ]
                    // alert(searchParam.size); // 5
                    let tmp_param=""; // bno=224&page=1&pageSize=10&option=&keyword=&
                    for(const param of searchParam) { // page=1 => [page, 1]
                        console.log(param);
                        tmp_param += param[0]+"="+param[1]+"&"; // page=1&
                        // bno=224&page=1&pageSize=10&option=&keyword=
                    }
                    console.log(tmp_param);

                    return tmp_param;
                }

                $('#btn_del').on("click", function(){
                    if(!confirm("삭제하시겠습니까?")) return;

                    // // url 값 모두 가져오기
                    // // console.log(location.href);
                    // const searchParam = new URLSearchParams(location.search);
                    //
                    // let tmp_param="";
                    // for(const param of searchParam) {
                    //     console.log(param);
                    //     tmp_param += param[0]+"="+param[1]+"&";
                    // }
                    // console.log(tmp_param)
                    let tmp_param = get_uri_info();

                    // get 방식
                    // location.href = "/board/remove?"+tmp_param;

                    // post , get 다 됨
                    let frm = $("#frm");
                    frm.attr("action", "<c:url value='/board/remove'/>?"+tmp_param)
                            // /app/board/remove?tmp_param
                    frm.attr("method", "post");
                    // frm.attr("method", "get");
                    frm.submit();

                });
            })
        </script>
    </div>
</body>
</html>