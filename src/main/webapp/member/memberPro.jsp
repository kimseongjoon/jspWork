<%@ page import="com.member.dao.MemberDAOimpl" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-27(027)
  Time: 오전 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="md" class="com.member.dto.MemberDTO"/>
<jsp:setProperty name="md" property="*"/>
<%
    MemberDAOimpl dao = MemberDAOimpl.getInstance();
    dao.memberInsert(md);
    response.sendRedirect("memberList.jsp");
%>