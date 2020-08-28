<%@ page import="com.address.AddressDAO" %>
<%@ page import="com.jqueryAddress.JAddressDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-25(025)
  Time: 오전 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="ad" class="com.jqueryAddress.AddressVO"/>
<jsp:setProperty name="ad" property="*"/>
<%
    JAddressDAO dao = JAddressDAO.getInstance();
    dao.addressInsert(ad);
    response.sendRedirect("list.jsp");
%>