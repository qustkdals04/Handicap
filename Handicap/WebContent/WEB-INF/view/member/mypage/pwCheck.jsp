<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btnOk").click(function(){
			if($("#passwd").val()==""){
				alert("비밀번호를 입력해주세요!!");
				$("passwd").focus();
			} else{
				$("#pwcheckForm").attr({
					action : "pwcheckaction",
					method : 'get'
				});
				$("#pwcheckForm").submit();
			}
		});
	});
</script>
</head>
<body>
	<h3>비밀번호확인</h3>
	<form name="pwcheckForm" id="pwcheckForm">
		<table>
			<tr>
				<td>
					<input type="password" name="passwd" id="passwd"><button type="button" id="btnOk">확인</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>