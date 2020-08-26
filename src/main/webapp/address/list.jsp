<%@ page import="com.address.AddressDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.address.Address" %>
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

    <script>
        function searchCheck() {
            // if (document.getElementById("word").value == "") {
            if (document.querySelector("#word").value == "") {
                alert("검색어를 입력하세요");
                return
            }

            frm.submit(); // list.jsp로 field, word값 가지고 이동
        }
    </script>
    <title>Title</title>
    <%
        request.setCharacterEncoding("utf-8");
        String field = "";
        String word = "";
        if (request.getParameter("word") != null) {
            word = request.getParameter("word");
            field = request.getParameter("field");

        }
        AddressDAO dao = AddressDAO.getInstance();
        ArrayList<Address> arr = dao.addrList(field, word); // 검색아닌거, 검색
        int count = dao.addrCount(field, word);
    %>
</head>
<body>
<div class="container">
    <div align="right">
        <a href="insert.jsp">회원추가</a> / <a href="list.jsp">전체보기</a>
    </div>
    <h2>회원목록</h2>
    <h1 align="right">(총 <%=count%>명)</h1>
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
    <form action="list.jsp" name="frm">
        <select name="field" id="field">
            <option value="name">이름</option>
            <option value="tel">전화번호</option>
        </select>
        <input type="text" name="word" id="word">
        <input type="button" value="검색" onclick="searchCheck()">
    </form>
</div>
</body>
</html>
