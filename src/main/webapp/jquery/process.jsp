<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-26(026)
  Time: 오후 2:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String method = request.getParameter("method");

    String str = "[처리결과]<br>";
    str += "id : " + id + "<br>";
    str += "pwd : " + pwd + "<br>";
    str += "method : " + method + "<br>";
    out.println(str);

%>