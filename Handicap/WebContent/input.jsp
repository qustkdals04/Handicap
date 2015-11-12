<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/jquery.form.min.js"></script>
  <script type="text/javascript">
  $(function(){
		//폼전송
		$('#ajaxform').ajaxForm({
		   //보내기전 validation check가 필요할경우
	            beforeSubmit: function (data, frm, opt) {
				                alert("전송전!!");
				                return true;
				              },
	            //submit이후의 처리
	            success: function(responseText, statusText){
	            	alert("전송성공!!");
	            },
	            //ajax error
	            error: function(){
	            	alert("에러발생!!");
	            }                               
	          });
	});
  </script>
</head>
<body>
   <form id="ajaxform" action="result.jsp" method="post" enctype="multipart/form-data">
		<input type="text" name="test2"/><br/>
		<textarea rows="10" cols="10" name="test3"></textarea><br/>
		<input type="file" name="test4" />
		<input type="submit" value="Submit" />
   </form>
</body>
</html>