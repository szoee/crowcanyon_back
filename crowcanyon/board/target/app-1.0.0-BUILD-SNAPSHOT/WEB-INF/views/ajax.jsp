<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AJAX 연습</title>

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
    <h1>{id:"asdf", name:"홍길동"}</h1>
    <input type="button" value="보내기" id="btn_send">
    <input type="text">

    <h1>결과:</h1>
    <div id="result">여기</div>

    <script>
        $(document).ready(function(){
            let person = {id:"asdf", name:"홍길동"}
            let person2 = {};

            $('#btn_send').click(function(){
                $.ajax({
                    url: "/send", // 요청할 URI
                    type: "post", // 전송 타입
                    data: JSON.stringify(person), // 서버로 전송할 데이터(직렬화)
                    // data: {id:"asdf", name:"홍길동"},
                    dataType: 'text',
                    headers: {"content-type": "application/json"}, // 요청 헤더
                    success: function(result){
                        person2 = JSON.parse(result);
                        $('#result').html("id="+person2.id+", name="+person2.name);
                    },
                    error: function(){
                        alert("에러")
                    }
                });

                console.log(111)
            });
        });

    </script>
</body>
</html>
