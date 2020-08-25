<%@ page import="com.address.AddressDAO" %>
<%@ page import="com.address.Address" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-25(025)
  Time: 오전 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>Title</title>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="ad" class="com.address.Address"/>
<jsp:setProperty name="ad" property="*"/>
<%
    AddressDAO dao = AddressDAO.getInstance();
    dao.addrInsert(ad);
    response.sendRedirect("list.jsp");
%>