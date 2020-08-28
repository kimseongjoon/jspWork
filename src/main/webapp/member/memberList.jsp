<%@ page import="com.member.dao.MemberDAOimpl" %>
<%@ page import="com.member.dto.MemberDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.member.dao.MemberDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-27(027)
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function del(userid) {
            location.href="memberDeletePro.jsp?userid=" + userid;
        }
    </script>

    <title>Title</title>
    <%
        request.setCharacterEncoding("utf-8");
        MemberDAO dao = MemberDAOimpl.getInstance();
        ArrayList<MemberDTO> arr = dao.memberList();
    %>
</head>
<body>
<div class="container">
    <div align="right">
        <a href="memberForm.jsp">회원가입</a> / <a href="memberList.jsp">전체보기</a>
    </div>
    <h2>회원목록</h2>
    <table class="table table-hover">
        <thead class="thead-dark">
        <tr>
            <th>이름</th>
            <th>아이디</th>
            <th>전화번호</th>
            <th>이메일</th>
            <th>삭제</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (MemberDTO member : arr) {

            //for (int i = 0; i < arr.size(); i++) {
        %>
        <tr>
            <%--<td><%=arr.get(i).getName()%></td>
            <td><%=arr.get(i).getUserid()%></td>
            <td><%=arr.get(i).getPhone()%></td>
            <td><%=arr.get(i).getEmail()%></td>--%>
            <td><%=member.getName()%></td>
            <td><%=member.getUserid()%></td>
            <td><%=member.getPhone()%></td>
            <td><%=member.getEmail()%></td>
            <td onclick="del('<%=member.getUserid()%>')">삭제</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
