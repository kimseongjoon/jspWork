<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-26(026)
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () { //get ==>가져오는 기능 text(), val(), html()/ set ==> 변경 text(???), val(???)
        $("#getBtn").click(function () { // $("#id").val() input type="text" 태그 값을 가져올 때 val함수 사용 $("#id").text()는 document의 문자를 가져올때 사용
            $.get("process.jsp", {"id": $("#id").val(), "pwd": $("#pwd").val(), "method": "get"})
                .done(function (data) { // get함수 처리결과가 data로 전달되고 function(data)내에서 처리한다.
                        $("#result").html(data); //html태그를 사용할때 사용
                    }
                ) // get
        }); // getBtn


        $("#postBtn").on("click", function () {
            var test = $.post("process.jsp", {"id": $("#id").val(), "pwd": $("#pwd").val(), "method": "post"});

            test.done(function (data) { // get함수 처리결과가 data로 전달되고 function(data)내에서 처리한다.
                $("#result").html(data); //html태그를 사용할때 사용
            })
        })

        $("#loadBtn").on("click", function () {
            $("#result").load("process.jsp", {"id": $("#id").val(), "pwd": $("#pwd").val(), "method": "load"});
        });

        $("#ajaxBtn").on("click", function () {
            $.ajax({
                method: "get",
                // type: "get",
                url: "process.jsp",
                data: {"id": $("#id").val(), "pwd": $("#pwd").val(), "method": "ajax"}
            }).done(function (resp) {
                    $("#result").html(resp);
                }
            ).fail(function (e) {
                    alert("error:" + e);
                }
            )
        })
    }); // document
</script>
<body>
<form action="exam01_process.jsp">
    id : <input type="text" id="id" name="id"><br>
    pwd : <input type="password" id="pwd" name="pwd"><br>
    <input type="button" value="get전송" id="getBtn">
    <input type="button" value="post전송" id="postBtn">
    <input type="button" value="load전송" id="loadBtn">
    <input type="button" value="ajax전송" id="ajaxBtn">
    <div id="result"></div>
</form>
</body>
</html>
