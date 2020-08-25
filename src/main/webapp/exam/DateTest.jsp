<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
    // 스크립트릿
    Calendar ca = Calendar.getInstance();
    
    String[] arr = {"일", "월", "화", "수", "목", "금", "토"};
    String dayOfWeek = "";
    int num = ca.get(Calendar.DAY_OF_WEEK);
    switch (ca.get(Calendar.DAY_OF_WEEK)) {
        case 1 :
            dayOfWeek = "일";
            break;
        case 2 :
            dayOfWeek = "월";
            break;
        case 3 :
            dayOfWeek = "화";
            break;
        case 4 :
            dayOfWeek = "수";
            break;
        case 5 :
            dayOfWeek = "목";
            break;
        case 6 :
            dayOfWeek = "금";
            break;
        case 7 :
            dayOfWeek = "토";
            break;
    }

%>
</head>
<body>
    <%=ca.get(Calendar.YEAR)%>년
    <%=ca.get(Calendar.MONTH) + 1%>월
    <%=ca.get(Calendar.DATE)%>일
    <%=dayOfWeek%>요일
    <hr>
    배열사용:<%=arr[num - 1]%>
</body>
</html>