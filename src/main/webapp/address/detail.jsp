<%@ page import="com.address.Address" %>
<%@ page import="com.address.AddressDAO" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-25(025)
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        request.setCharacterEncoding("utf-8");
        int num = Integer.parseInt(request.getParameter("num"));
        AddressDAO dao = AddressDAO.getInstance();
        Address address = dao.addrView(num);
    %>
    <script>
        function del() {
            if (confirm("정말 삭제할까요?")) {
                location.href="deletePro.jsp?num=<%=num%>";
            }
        }
    </script>
</head>
<body>
<form action="updatePro.jsp" method="post">
    <input type="hidden" name="num" value="<%=num%>">
    <table>
        <tr>
            <th>이름</th>
            <td><input type="text" name="name" value="<%=address.getName()%>"></td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td><input type="text" name="tel" value="<%=address.getTel()%>"></td>
        </tr>
        <tr>
            <th>우편번호</th>
            <td>
                <input type="text" name="zipcode" size="10" value="<%=address.getZipcode()%>">
                <button type="button">검색</button>
            </td>
        </tr>
        <tr>
            <th>주소</th>
            <td><input type="text" name="addr" size="50" value="<%=address.getAddr()%>"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="수정">
                <input type="button" value="전체보기" onclick="location.href='list.jsp'">
                <input type="reset" value="삭제" onclick="location.href='deletePro.jsp?num=<%=address.getNum()%>'">
                <input type="reset" value="자바스크립트삭제" onclick="del()">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
