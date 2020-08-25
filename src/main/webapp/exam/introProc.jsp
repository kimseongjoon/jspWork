<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-24(024)
  Time: 오후 3:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
    %>
</head>
<body>
    이름:<%=name%>
    성별:<%=gender%>
</body>
</html>
