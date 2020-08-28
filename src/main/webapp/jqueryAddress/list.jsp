<%@ page import="com.jqueryAddress.JAddressDAO" %>
<%@ page import="com.jqueryAddress.AddressVO" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-25(025)
  Time: 오후 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    <title>Title</title>
    <%
        request.setCharacterEncoding("utf-8");
        JAddressDAO dao = JAddressDAO.getInstance();
        ArrayList<AddressVO> arr = dao.addrList(); // 검색아닌거, 검색
        int count = dao.addrCount();
    %>
    <script>
        $(document).ready(function () {
            $("#cntSpan").text("<%=count%>");
            $("#btnSearch").click(function () {
                $.ajax({
                    type : "get",
                    url : "searchPro.jsp",
                    data : {"field" : $("#field").val(), "word" : $("#word").val()},
                    // success : function (result) {
                    success : function (result) {
                        var d = JSON.parse(result);

                        var htmlStr = ""
                        $.each(d.jarr, function (key, val) {
                            htmlStr += "<tr>"
                            htmlStr += "<td align='right'>" + val.num + "</td>"
                            htmlStr += "<td><a href='detail.jsp?num=" + val.num + "'>" + val.name + "</a></td>";
                            htmlStr += "<td align='right'>" + val.tel + "</td>"
                            htmlStr += "<td>" + val.addr + "</td>"
                            htmlStr += "</tr>"
                        });
                       /* for (var i = 0; i < d.jarr.length; i++) {
                            htmlStr += "<tr>"
                            htmlStr += "<td>" + d.jarr[i].num + "</td>"
                            htmlStr += "<td>" + d.jarr[i].name + "</td>"
                            htmlStr += "<td>" + d.jarr[i].tel + "</td>"
                            htmlStr += "<td>" + d.jarr[i].addr + "</td>"
                            htmlStr += "</tr>"
                        }*/
                        $("tbody").html(htmlStr);


                        $("#cntSpan").text(d.countObj.count);
                    },
                    error : function (e) {
                        alert("error:" + e);
                    }
                })
            })
        })
    </script>
</head>
<body>
<div class="container">
    <div align="right">
        <a href="insert.jsp">회원추가</a> / <a href="list.jsp">전체보기</a>
    </div>
    <h2>회원목록</h2>
    <h1 align="right">(총 <span id="cntSpan"></span>명)</h1>
    <table class="table table-hover">
        <thead class="thead-dark">
        <tr>
            <th>번호</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>주소</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (int i = 0; i < arr.size(); i++) {
        %>
        <tr>
            <td align="right"><%=arr.get(i).getNum()%></td>
            <td><a href="detail.jsp?num=<%=arr.get(i).getNum()%>"><%=arr.get(i).getName()%></a></td>
            <td align="right"><%=arr.get(i).getTel()%></td>
            <td><%=arr.get(i).getAddr()%></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <select name="field" id="field">
        <option value="name">이름</option>
        <option value="tel">전화번호</option>
    </select>
    <input type="text" name="word" id="word">
    <input type="button" value="검색" id="btnSearch">
</div>
</body>
</html>
