<%@ page import="com.address.AddressDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-25(025)
  Time: 오후 3:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    int num = Integer.parseInt(request.getParameter("num"));
    AddressDAO dao = AddressDAO.getInstance();
    dao.addrDelete(num);
    response.sendRedirect("list.jsp");
%>