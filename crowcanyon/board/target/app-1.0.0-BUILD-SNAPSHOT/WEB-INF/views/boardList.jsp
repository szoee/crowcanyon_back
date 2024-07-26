<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="logInOutLink" value="${ sessionScope.id==null ? '/login':'/logout' }" />
<c:set var="logInOutTxt" value="${ sessionScope.id==null ? 'login':'logout' }" />
<c:set var="userId" value="${sessionScope.id==null?'':sessionScope.id}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 페이지</title>
    <link rel="stylesheet" href="<c:url value='/css/common.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/h_f.css'/> ">
    <%--    <link rel="stylesheet" href="<c:url value='/css/board.css'/> ">--%>
    <link rel="stylesheet" href="<c:url value='/css/boardList.css'/> ">

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<body>
<div class="header">
    <div class="content_area">
        <div id="logo"><a href="<c:url value='/'/>">BITSTUDY</a></div>

        <ul class="menu">
            <li class="item">
                <a href="<c:url value='/board/list'/>">Board</a>
            </li>
            <%-- <li class="item">
               <a href="<c:url value='/login'/>">login</a>
            </li> --%>
            <li class="item">
                <a href="<c:url value='${logInOutLink} '/>">${logInOutTxt}</a>
            </li>
            <c:choose>

<%--                <c:set var="userId" value="${sessionScope.id==null?'Sign in':'asdf'}" />--%>
<%--                <c:set var="loginttt" value="${ sessionScope.id==null ? '/register/join':'/myPage' }" />--%>
<%--                <li class="item">--%>
<%--                    <a href="<c:url value='${loginttt}'/>">${userId}</a>--%>
<%--                </li>--%>


                <c:when test="${ sessionScope.id==null }">
                    <li class="item">
                        <a href="<c:url value='/register/join'/>">Sign in</a>
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
        <h2>게시판 리스트</h2>

        <div class="search_area">
            <select name="sel_filter" id="sel_filter">
                <option value="TC" ${param.option=="TC"?"selected":""}>제목+내용</option>
                <option value="T" ${param.option=="T"?"selected":""}>제목</option>
                <option value="W" ${param.option=="W"?"selected":""}>작성자</option>
            </select>

            <div id="search_box">
                <input type="text" id="txt_search" name="txt_search" placeholder="검색어를 입력하시오" value="${param.keyword}">
                <%--                <input type="button" value="검색" id="btn_search">--%>
                <button id="btn_search">검색</button>
            </div>

            <div id="btn_write" onclick="location.href='<c:url value="/board/write" />'">글쓰기</div>
        </div>

        <c:choose>
            <c:when test="${empty list}">
                <h1>일치하는 결과가 없습니다.</h1>
            </c:when>

            <c:otherwise>
                <table>
                    <thead>
                    <tr>
                        <th class="no">번호</th>
                        <th class="title">제목</th>
                        <th class="writer">이름</th>
                        <th class="regdate">등록일</th>
                        <th class="viewcnt">조회수</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="boardDto" items="${list}">
                        <tr>
                            <td class="no">${boardDto.bno}</td>
                            <td class="title">
<%--                                <a href="/app/board/read?bno=${boardDto.bno}&page=${ph.page}&pageSize=${ph.pageSize}&option=${param.option}&keyword=${param.keyword}">${boardDto.title}</a>--%>

                                <a href="<c:url value="/board/read?bno=${boardDto.bno}&page=${ph.page}&pageSize=${ph.pageSize}&option=${param.option}&keyword=${param.keyword}" />">
                                    ${boardDto.title}
                                </a>
                            </td>
                            <td class="writer">${boardDto.writer}</td>
                            <td class="regdate">
<%--                                <fmt:formatDate value="${boardDto.reg_date}" pattern="yyyy-MM-dd HH:mm:ss" type="date" />--%>

                                <c:set var="today" value="<%= new java.util.Date() %>" /> <%-- Fri May 17 09:16:29 KST 2024--%>
                                <c:set var="date"> <fmt:formatDate value="${today}" pattern="yyyy-MM-dd" type="date" /> </c:set> <%-- 2024-05-17 --%>

                                <c:set var="date2"> <fmt:formatDate value="${boardDto.reg_date}" pattern="yyyy-MM-dd" type="date" /> </c:set> <%-- 2024-05-17 --%>

<%--                                <c:out value="${date}" /> , <c:out value="${date2}" />--%>

                                <c:choose>
                                    <c:when test="${date == date2}">
                                        <fmt:formatDate value="${boardDto.reg_date}" pattern="HH:mm:ss" type="date" />
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:formatDate value="${boardDto.reg_date}" pattern="yyyy-MM-dd" type="date" />
                                    </c:otherwise>
                                </c:choose>

                            </td>
                            <td class="viewcnt">${boardDto.view_count}</td>
                        </tr>

                    </c:forEach>
                    </tbody>

                </table>
            </c:otherwise>
        </c:choose>

        <div class="pagination">
            <c:if test="${ph.showPrevBtn}">
                <a href="<c:url value="/board/list?page=${ph.startPage - 1}&pageSize=${ph.pageSize}&option=${param.option}&keyword=${param.keyword}" />" class="startPage">[이전]</a>
            </c:if>

            <c:forEach var="i" begin="${ph.startPage}" end="${ph.endPage}">
                <a href="<c:url value="/board/list?page=${i}&pageSize=${ph.pageSize}&option=${param.option}&keyword=${param.keyword}" />" class="${i==ph.page?"pageActive":""}">${i}</a>
            </c:forEach>

            <c:if test="${ph.showNextBtn}">
                <a href="<c:url value="/board/list?page=${ph.endPage + 1}&pageSize=${ph.pageSize}&option=${param.option}&keyword=${param.keyword}" />" class="endPage">[다음]</a>
            </c:if>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('#btn_search').on('click',function(){
            location.href="<c:url value="/board/search" />?option="+$('#sel_filter').val()+"&keyword="+$('#txt_search').val().trim();
        });

        $('#txt_search').on('keydown',function(e){
            if(e.keyCode == 13 && $('#txt_search').val().trim().length > 0) {
                $('#btn_search').trigger('click');
            }
        })

    });

</script>

</body>
</html>


















