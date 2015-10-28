<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객센터</title>
</head>
<body>

	<center>
	<table>
		<tr>
			<td style="width: 60px; ">카테고리 </td>
			<td>
			 <select style="width: 86px; ">
				<option>Q&A</option>
				<option>게시판 요청</option>
				
			
			</select></td>
		</tr>
		
		<tr>
			<td>제목 </td>  
			<td><input type="text" id="title" style="width: 360px; "></td>
		</tr>
	
		<tr>
			<td> 파일첨부 </td>
			<td> <input type="file" id="file" > </td>
		</tr>
	
		<tr >
			
			<td colspan="2"><textarea  id="Content" style="width: 435px; height: 520px; "></textarea></td>
		</tr>
		
		<tr >
			<td align="center" colspan="2"> <input type="submit" value="확인" > <input type="reset" value="취소" ></td>
		</tr>
	</table>
	</center>
</body>
</html>