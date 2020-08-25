<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
</head>
<body>
<form action="introProc.jsp" method="post">
    <table border="1">
        <tr>
            <th>성명</th>
            <td><input type="text" /></td>
            <th>성별</th>
            <td>
                <center>
                    <input type="radio" name="gender" value="male" id="sex_btn1"/>
                    <label for="sex_btn1">남</label>
                    <input type="radio" name="gender" value="female" id="sex_btn2"/>
                    <label for="sex_btn2">여</label>
                </center>
            </td>
        </tr>
        <tr>
            <th>생년월일</th>
            <td colspan="3">
                <input type="text" />년
                <input type="text" />월
                <input type="text" />일
                <input type="radio" name="calendar" id="calendar_btn1" />
                <label for="calendar_btn1">양력</label>
                <input type="radio" name="calendar" id="calendar_btn2" />
                <label for="calendar_btn2">음력</label>
            </td>
        </tr>
        <tr>
            <th>주소</th>
            <td colspan="3"><input type="text" /></td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td colspan="3">
                <input type="text" />-<input type="text" />-<input type="text" />
            </td>
        </tr>
        <tr>
            <th colspan="4">사용가능한 프로그램 선택하기</th>
        </tr>
        <tr>
            <td colspan="4" style="padding:3%;">
                A. <input type="checkbox" name="" id="prg_btn1" />
                <label for="prg_btn1">한글</label> <br />
                B. <input type="checkbox" name="" id="prg_btn2" />
                <label for="prg_btn2">포토샵</label> <br />
                C. <input type="checkbox" name="" id="prg_btn3" />매크로 미디어 디렉터<br />
                D. <input type="checkbox" name="" id="prg_btn4" />드림위버<br />
                E. <input type="checkbox" name="" id="prg_btn5" />3D MAX<br />
            </td>
        </tr>
        <tr>
            <th colspan="4">가고싶은 여행지를 모두 선택하세요.</th>
        </tr>
        <tr>
            <td colspan="4">
                <select name="job" size="3" multiple>
                    <option value="설악산" selected>설악산</option>
                    <option value="경포대">경포대</option>
                    <option value="토발">토발</option>
                </select><br />
            </td>
        </tr>
        <tr>
            <th colspan="4">미래의 꿈은 어떠한가요?</th>
        </tr>
        <tr>
            <td colspan="4">
                <textarea name="" id="" cols="30" rows="10">미래의 꿈은 희망입니다.</textarea>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <center>
                    <input type="submit" value="전송">
                    <input type="reset" value="다시쓰기">
                </center>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
