<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-26(026)
  Time: 오후 2:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");
    %>
</head>
<body>

id:<%=id %><br/>
pw:<%=pwd %><br/>
</body>
</html>