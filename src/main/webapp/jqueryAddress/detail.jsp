<%@ page import="com.jqueryAddress.JAddressDAO" %>
<%@ page import="com.jqueryAddress.AddressVO" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-28(028)
  Time: 오후 3:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        request.setCharacterEncoding("utf-8");
        int num = Integer.parseInt(request.getParameter("num"));
        JAddressDAO dao = JAddressDAO.getInstance();
        AddressVO address = dao.adressDetail(num);
    %>
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
    </table>
</form>
</body>
</html>