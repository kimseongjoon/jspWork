<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String name = request.getParameter("name"); // 요청 : request객체가 처리
	String addr = request.getParameter("addr");
%>
</head>
<body>
	이름:<%out.println(name);%><br/>
	주소:<%out.println(addr);%><br/>
	<hr/>
	
	이름:<%=name %><br/>
	주소:<%=addr %><br/>
</body>
</html>