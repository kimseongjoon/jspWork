<%@ page import="com.address.AddressDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.address.Address" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-25(025)
  Time: 오후 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        AddressDAO dao = AddressDAO.getInstance();
        ArrayList<Address> arr = dao.addrList();
        int count = dao.addrCount();
    %>
</head>
<body>
<div align="right"><a href="insert.jsp">회원추가</a></div>
<table border="1">
    <caption>회원목록(총 <%=count%>명)</caption>
    <thead>
    <tr style="background-color: aquamarine">
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
</body>
</html>
