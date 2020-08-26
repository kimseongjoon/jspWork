<%@ page import="com.address.AddressDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-26(026)
  Time: 오전 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="ad" class="com.address.Address"/>
<jsp:setProperty name="ad" property="*"/>
<%
    AddressDAO dao = AddressDAO.getInstance();
    dao.addrUpdate(ad);
    response.sendRedirect("list.jsp");
%>