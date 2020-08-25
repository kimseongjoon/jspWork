<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check() {
	if (document.getElementById("name").value=="") {
		alert("이름을 입력하세요");
		return
	}
	if (document.getElementById("kor").value=="" ||
			isNaN(document.getElementById('kor').value)) {
		alert("국어성적을 입력하세요");
		return
	}
	if (document.getElementById("eng").value=="" ||
			isNaN(document.getElementById('eng').value)) {
		alert("영어성적을 입력하세요");
		return
	}
	if (document.getElementById("math").value=="" ||
			isNaN(document.getElementById('math').value)) {
		alert("수학성적을 입력하세요");
		return
	}
	//frm.submit();
	document.getElementById('frm').submit();
}
</script>
</head>
<body>
<form action="scoreResult.jsp" id="frm" name='frm'>
이름:<input type="text" name="name" id="name"><br/>
국어:<input type="text" name="kor" id="kor"><br/>
영어:<input type="text" name="eng" id="eng"><br/>
수학:<input type="text" name="math" id="math"><br/>
<!-- <button onclick="check()">성적조회</button> -->
<button onclick="check()" type="button">button 성적조회</button>
<!-- <input type="submit" value="submit 전송" onclick="check()"> -->
<input type="button" value="button 전송" onclick="check()">
</form>
</body>
</html>