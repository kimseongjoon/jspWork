<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-28(028)
  Time: 오전 9:13
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
        $("#send").click(function () {
            // $.getJSON("zipCheckPro.jsp", {"dong": $("#dong").val()}, function (data) {
            //     var htmlStr = "<table>"
            //     $.each(data, function (key, val) {
            //         htmlStr += "<tr>"
            //         htmlStr += "<td>" + val.zipcode + "</td>"
            //         htmlStr += "<td>" + val.sido + "</td>"
            //         htmlStr += "<td>" + val.gugun + "</td>"
            //         htmlStr += "<td>" + val.dong + "</td>"
            //         htmlStr += "<td>" + val.bunji + "</td>"
            //         htmlStr += "</tr>"
            //     });
            //     htmlStr += "</table>"
            //     $("#area").html(htmlStr);
            // })

            // $("#send").click(function () {
                $.get("zipCheckPro.jsp", {"dong" : $("#dong").val()},
                function (result) {

                    d = JSON.parse(result);
                    var htmlStr = "<table>"
                    for (var i = 0; i < d.length; i++) {
                        htmlStr += "<tr>"
                        htmlStr += "<td>" + d[i].zipcode + "</td>"
                        htmlStr += "<td>" + d[i].sido + "</td>"
                        htmlStr += "<td>" + d[i].gugun + "</td>"
                        htmlStr += "<td>" + d[i].dong + "</td>"
                        htmlStr += "<td>" + d[i].bunji + "</td>"
                        htmlStr += "</tr>"
                    }
                    htmlStr += "</table>"
                    $("#area").html(htmlStr);
                })
        })

        $("#area tr").on("click", function () {
        // $("#area").on("click", "tr", function () {
            var address = $("td:eq(1)", this).text() + " " +
                $("td:eq(2)", this).text() + " " +
                $("td:eq(3)", this).text() + " " +
                // $("td:eq(4)", this).text() + " ";
                $(this).children("td:eq(4)").text() + " ";

            $(opener.document).find("#zipcode").val($("td:eq(0)", this).text());
            $(opener.document).find("#addr").val(address);

            self.close();
        })
    });
</script>
<body>
<table>
    <tr>
        <td>
            동이름입력:<input type="text" name="dong" id="dong">
            <input type="button" value="검색" id="send">
        </td>
    </tr>
    <%--        <%--%>
    <%--            if (zipArr.isEmpty()) {--%>
    <%--        %>--%>
    <tr>
        <td>
            검색된 결과가 없습니다
        </td>
    </tr>

    <%--        <%--%>
    <%--        } else {--%>
    <%--        %>--%>

    <tr>
        <td>*검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td>
    </tr>

    <%-- <%
         for (ZipCodeVO z : zipArr) {
             String zip = z.getZipcode();
             String sido = z.getSido();
             String bunji = z.getBunji();
             String gugun = z.getGugun();
             String d = z.getDong();
     %>
     <tr>
         <td>
             <a href="javascript:send('<%=zip%>', '<%=sido%>', '<%=gugun%>', '<%=d%>', '<%=bunji%>')">
                 <%=zip%> <%=sido%> <%=gugun%> <%=d%> <%=bunji%>
             </a>
         </td>
     </tr>
     <%

             }
         }
     %>--%>
</table>
<div id="area"></div>
</body>
</html>
