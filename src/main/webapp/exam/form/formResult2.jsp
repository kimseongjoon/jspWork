<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Insert title here</title>
<%--    FormBean fb = new FormBean();--%>
    <jsp:useBean id="fb" class="com.exam.FormBean"/> 
    <jsp:setProperty name="fb" property="*"/>
    <%
        String h[] = fb.getHobby();
        String tmp = "";
        for (int i = 0; i < h.length; i++) {
            tmp += h[i] + " ";
        }
    %>
</head>
<body>
<%--<jsp:getProperty name="fb" property="name"/>--%>
이름:<%=fb.getName() %><br/>
나이:<%=fb.getAge() %><br/>
성별:<%=fb.getGender() %><br/>
취미:<%=tmp %><br/>
직업:<%=fb.getJob() %><br/>
</body>
</html>