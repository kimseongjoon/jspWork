<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-25(025)
  Time: 오전 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <a href="">전체보기</a> <br>
    주소록 등록하기<br>

    <form action="insertPro.jsp" method="post" name="frm">
        <table>
            <tr>
                <td>이름</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>우편번호</td>
                <td><input type="text" name="zipcode"> <input type="button" value="검색"></td>
            </tr>
            <tr>
                <td>주소</td>
                <td><input type="text" name="addr" size="50"></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><input type="text" name="tel"></td>
            </tr>
        </table>
        <input type="submit" value="등록">
        <input type="reset" value="취소">
    </form>
</body>
</html>
