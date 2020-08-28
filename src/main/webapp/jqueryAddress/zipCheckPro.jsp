<%@ page import="com.jqueryAddress.JAddressDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.jqueryAddress.ZipCodeVO" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%--
Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-28(028)
  Time: 오전 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
//    String dong = request.getParameter("dong");
    String dong = "서면";
    JAddressDAO dao = JAddressDAO.getInstance();
    ArrayList<ZipCodeVO> zarr = dao.getZipcode(dong);

    // zarr -> JSON으로 변환
    JSONArray jarr = new JSONArray();

    for (ZipCodeVO z : zarr) {
        JSONObject obj = new JSONObject();

        obj.put("bunji", z.getBunji());
        obj.put("dong", z.getDong());
        obj.put("gugun", z.getGugun());
        obj.put("sido", z.getSido());
        obj.put("zipcode", z.getZipcode());

        jarr.add(obj);
    }

//    response.getWriter().print(jarr);
    out.println(jarr);
%>