<%@ page import="com.exam.DateBean" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-24(024)
  Time: 오후 3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    DateBean bean = new DateBean();
%>

<%=bean.getToday()%>
</body>
</html>
