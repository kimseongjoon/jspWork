<%@ page import="com.jqueryAddress.JAddressDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.jqueryAddress.AddressVO" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-28(028)
  Time: 오후 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String field = request.getParameter("field");
    String word = request.getParameter("word");

    JAddressDAO dao = JAddressDAO.getInstance();

    ArrayList<AddressVO> sarr = dao.getSearchList(field, word);
    int count = dao.getSearchCount(field, word);

    JSONObject countObj = new JSONObject();
    countObj.put("count", count);

    JSONArray jarr = new JSONArray();

    for (AddressVO s : sarr) {
        JSONObject obj = new JSONObject();

        obj.put("num", s.getNum());
        obj.put("name", s.getName());
        obj.put("tel", s.getTel());
        obj.put("addr", s.getAddr());

        jarr.add(obj);
    }

    JSONObject mainObject = new JSONObject();
    mainObject.put("jarr", jarr);
    mainObject.put("countObj", countObj);

    out.println(mainObject.toString());
//    out.println(count);
%>