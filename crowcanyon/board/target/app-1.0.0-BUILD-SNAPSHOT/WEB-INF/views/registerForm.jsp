<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.net.URLDecoder"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<c:set var="logInOutLink" value="${ sessionScope.id==null ? '/login':'/logout' }" />
<c:set var="logInOutTxt" value="${ sessionScope.id==null ? 'login':'logout' }" />


<!-- WEB-INF > spring > appServlet > servlet-context.xml 에서 resoursec 관련 설정 변경해야함 -->
<!DOCTYPE html>
<html lang="KO">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
   
   <link rel="stylesheet" href="<c:url value='/css/common.css'/>">
   <link rel="stylesheet" href="<c:url value='/css/h_f.css'/>">
    
   <style>
      * {
         box-sizing: border-box;
      }

      form {
         width: 400px;
         height: 600px;
         display: flex;
         flex-direction: column;
         align-items: center;
         position: absolute;
         top: 50%;
         left: 50%;
         transform: translate(-50%, -50%);
         border: 1px solid rgb(89, 117, 196);
         border-radius: 10px;
      }

      .txt {
         width: 300px;
         height: 40px;
         border: 1px solid rgb(89, 117, 196);
         border-radius: 5px;
         padding: 0 10px;
         margin-bottom: 10px;
      }

      label {
         width: 300px;
         height: 30px;
         margin-top: 4px;
      }

      button {
         background-color: #eee8aa;
         color: white;
         width: 300px;
         height: 50px;
         font-size: 17px;
         border: none;
         border-radius: 5px;
         margin: 20px 0 30px 0;
      }

      .title {
         font-size: 50px;
         margin: 40px 0 30px 0;
      }

      .msg {
         text-align: center;
         font-size: 16px;
         color: red;
         margin-bottom: 20px;
      }

      .sns-chk {
         margin-top: 5px;
      }
   </style>
   <title>Register</title>
</head>

<body> 
	<div class="header">
      <div class="content_area">
         <div id="logo"><a href="<c:url value='/'/>">BITSTUDY</a></div>

         <ul class="menu">
            <%-- <li class="item">
               <a href="<c:url value='/'/>">Home</a>
            </li> --%>
            <li class="item">
               <a href="<c:url value='/board/list'/>">Board</a>
            </li>
            <%-- <li class="item">
               <a href="<c:url value='/login'/>">login</a>
            </li> --%>
            <li class="item">
				<a href="<c:url value='${logInOutLink} '/>">${logInOutTxt}</a>	
            </li>
            
            <c:if test="${ sessionScope.id==null }">
	            <li class="item">
	               <a href="<c:url value='/register/join'/>">Sign in</a>
	            </li> 
            </c:if> 
         </ul> 
      </div>
   </div>
   <form action="<c:url value='/register/save'/>" method="POST" onsubmit="return formCheck(this)">
      <div class="title">회원가입</div>
       <div id="msg">
           <c:if test="${not empty param.msg}">
               <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
           </c:if>
       </div>

<%--       <div class="msg"> ${ param.msg } </div>--%>
<%--      자스 msg1: <div id="msg" class="msg"> </div>--%>
<%--      리다이렉트 msg2: <div class="msg"> ${ param.msg } </div>--%>
<%--      인코딩 msg3: <div class="msg"> ${ URLDecoder.decode(param.msg, "utf-8") } </div>--%>
      
      <label for="">아이디</label>
      <input class="txt" type="text" name="id" placeholder="8~12자리의 영대소문자와 숫자 조합" value="asdf" autofocus>
      <label for="">비밀번호</label>
      <input class="txt" type="text" id="pp" name="pw" placeholder="8~12자리의 영대소문자와 숫자 조합" value="1234">
      <label for="">이름</label>
      <input class="txt" type="text" name="name" value="홍길동1" placeholder="홍길동">
      <label for="">이메일</label>
      <input class="txt" type="text" name="email" value="example@bitstudy.co.kr" placeholder="example@bitstudy.co.kr">
      <label for="">생일</label>
      <input class="txt" type="text" name="birth" value="2020/12/31" placeholder="2020/12/31">
      <div class="sns-chk">
          <label><input type="checkbox" name="sns" value="facebook" checked />페이스북</label>
          <label><input type="checkbox" name="sns" value="kakaotalk" checked />카카오톡</label>
          <label><input type="checkbox" name="sns" value="instagram" checked />인스타그램</label>
      </div>
      <button>회원 가입</button> <!-- form 안에 있을때는 type 안써줘도 기본값 submit 으로 됨 -->
   </form>
</body>
<script>
      function formCheck(frm) {
           
          var msg = ''; 

          if (frm.id.value.length < 3) {
              setMessage('id의 길이는 3이상이어야 합니다.', frm.id);
              return false;
          }  
          //if (frm.pp.value.length < 3) {
          if (frm.pw.value.length < 3) { 
              setMessage('pw의 길이는 3이상이어야 합니다.', frm.pw);
              return false;
          }

          return true;
      }
 
      function setMessage(msg, element) {
          document.getElementById("msg").innerHTML = `<b class="fa"> ${'${msg}'} </b>`;

          if (element) {
              // 해당 요소로 focus
              element.select();
          }
      }
      
  </script>
</html>














