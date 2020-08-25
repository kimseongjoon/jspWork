<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
	<% String name = request.getParameter("name"); // 요청 : request객체가 처리
	String age = request.getParameter("age"); 
	String gender =	request.getParameter("gender");
	//String hobby = request.getParameter("hobby"); 
	String[] hobby = request.getParameterValues("hobby"); 
	String job = request.getParameter("job"); %>
  </head>
  <body>
      이름:<%=name %><br />
      나이:<%=age %><br />
      성별:<%=gender %><br />
      관심분야:<%=hobby %><br />
      직업:<%=job %><br />
  </body>
</html>