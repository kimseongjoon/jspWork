<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-27(027)
  Time: 오전 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $("#b1").click(function () {
            $.get("test.txt", function (data, status) {
                var str = "데이터:" + data + "\n상태:" + status;
                $("#result").html(str);
            });
        });
        $("#b2").on("click", function () {
            var htmlStr = "";
            $.getJSON("test.txt", function (data) {
                $.each(data, function (key, val) {
                    htmlStr += "회원번호:" + val.memberNumber + "<br>"
                    htmlStr += "이름:" + val.irum + "<br>"
                    htmlStr += "이미지:" + val.picture + "<hr>"
                });
                $("#result").html(htmlStr);
            });
        });
        $("#b3").click(function () {
            // $.get("test.txt", function (data, status) {
            //     $("#result").html(data + "<hr>");
            //     var d = JSON.parse(data);
            //     var str = "";
            //     for (i = 0; i < d.length; i++) {
            //         str += "이름:" + d[i].irum + "<br>";
            //     }
            //     $("#result2").html(str);
            // });
            var htmlStr = "";
            $.getJSON("test.txt", function (data) {
                for (i = 0; i < data.length; i++) {
                    htmlStr += "이름:" + data[i].irum + "<br>";
                }
                $("#result").html(htmlStr);
            });
        });
    });
</script>
<body>
<button id="b1">결과</button>
<button id="b2">결과</button>
<button id="b3">결과</button>
<div id="result"></div>
<div id="result2"></div>
</body>
</html>
