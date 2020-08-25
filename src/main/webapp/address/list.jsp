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
</head>
<body>
<%
    AddressDAO dao = AddressDAO.getInstance();
    ArrayList<Address> arr = dao.addrList();
    out.println(arr.size());
%>
</body>
</html>
