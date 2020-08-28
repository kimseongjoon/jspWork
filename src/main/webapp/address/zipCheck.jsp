<%@ page import="com.address.AddressDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.address.ZipCodeDTO" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-26(026)
  Time: 오전 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--<style>
        a:link {text-decoration: none; color: #000}
        a:hover {text-decoration: none; color: #000}
        a:visited {text-decoration: none; color: #000}
    </style>--%>
    <%
        request.setCharacterEncoding("utf-8");
        String dong = request.getParameter("dong");
        AddressDAO dao = AddressDAO.getInstance();

        ArrayList<ZipCodeDTO> zipArr = dao.zipcodeRead(dong);
    %>
    <script>
        function dongCheck() {
            // if (document.getElementById("dong").value == "") {
            if (document.querySelector("#dong").value == "") {
                alert("동이름을 입력하세요");
                return;
            }
            frm.submit();
        }

        function send(code, sido, gugun, dong, bunji) {
            var address = sido + " " + gugun + " " + dong + " " + bunji;

            // opener.document.frm.zipcode.value = code;
            // opener.document.frm.addr.value = address;

            opener.document.querySelector("#zipcode").value = code;
            opener.document.querySelector("#addr").value = address;

            self.close();
        }
    </script>
</head>
<body>
<form name="frm" action="zipCheck.jsp">
    <table>
        <tr>
            <td>
                동이름입력:<input type="text" name="dong" id="dong">
                <input type="button" value="검색" onclick="dongCheck()">
            </td>
        </tr>
        <%
            if (zipArr.isEmpty()) {
        %>
        <tr>
            <td>
                검색된 결과가 없습니다
            </td>
        </tr>

        <%
            } else {
        %>

        <tr>
            <td>*검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td>
        </tr>

        <%
            for (ZipCodeDTO z : zipArr) {
                String zip = z.getZipcode();
                String sido = z.getSido();
                String bunji = z.getBunji();
                String gugun = z.getGugun();
                String d = z.getDong();
        %>
        <tr>
            <td>
                <a href="javascript:send('<%=zip%>', '<%=sido%>', '<%=gugun%>', '<%=d%>', '<%=bunji%>')">
                    <%=zip%> <%=sido%> <%=gugun%> <%=d%> <%=bunji%>
                </a>
            </td>
        </tr>
        <%

                }
            }
        %>
    </table>
</form>
</body>
</html>
