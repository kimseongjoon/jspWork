<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        // $(document).ready(function(){
        $(function(){
            $("#btn").click(function(){
                if($('#name').val() == "") {
                    alert("이름을 입력하세요");
                    return false
                }
                if( $('#kor').val() == "" || !($.isNumeric($('#kor').val())) ) {
                    alert("국어 점수를 입력하세요");
                    return false;
                }
                if($('#eng').val() == "" || isNaN($('#eng').val())) {
                    alert("영어 점수를 입력하세요");
                    return false;
                }
                if($('#math').val() == "" || isNaN($('#math').val())) {
                    alert("수학 점수를 입력하세요");
                    return false;
                }
                $('#frm').submit();
            });
        });
    </script>
  </head>
  <body>
    <form action="scoreResult.jsp" id="frm" name="frm">
      이름:<input type="text" name="name" id="name" /><br />
      국어:<input type="text" name="kor" id="kor" /><br />
      영어:<input type="text" name="eng" id="eng" /><br />
      수학:<input type="text" name="math" id="math" /><br />
      <button type="button" id="btn">button 성적조회</button>
    </form>
    <!-- <script>
        // $(document).ready(function(){
            $("#btn").click(function(){
                if($('#name').val() == "") {
                    alert("이름을 입력하세요");
                    return false
                }
                if( $('#kor').val() == "" || !($.isNumeric($('#kor').val())) ) {
                    alert("국어 점수를 입력하세요");
                    return false;
                }
                if($('#eng').val() == "" || isNaN($('#eng').val())) {
                    alert("영어 점수를 입력하세요");
                    return false;
                }
                if($('#math').val() == "" || isNaN($('#math').val())) {
                    alert("수학 점수를 입력하세요");
                    return false;
                }
                $('#frm').submit();
            });
        // });
    </script> -->
  </body>
</html>
