<%@ page import="com.member.dao.MemberDAO" %>
<%@ page import="com.member.dao.MemberDAOimpl" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-27(027)
  Time: 오후 3:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String userid = request.getParameter("userid");
    MemberDAO dao = MemberDAOimpl.getInstance();
    dao.memberDelete(userid);
    response.sendRedirect("memberList.jsp");
%>