<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<meta content="" name="Author">
<meta content="" name="keywords">
</head>
<body>

	<center>
	<table style="width:800px;">
		<tr>
			<td style="width: 100px; ">카테고리 </td>
			<td>
			 <select style="width: 100px; ">
				<option>신체적장애</option>
				<option>정신적장애</option>
				<option>동호회</option>
				<option>여행</option>
			
			</select></td>
		</tr>
		
		<tr>
			<td>제목 </td>  
			<td><input type="text" id="title" style="width: 360px; "></td>
		</tr>	
	
		<tr >
			<td colspan="2"><textarea  id="Content" style="width: 435px; height: 520px; "></textarea></td>
			
		</tr>
		<tr>
			<td> 파일첨부 </td>
			<td> <input type="file" id="file" > </td>
		</tr>
		<tr >
			<td align="center" colspan="2"> <input type="submit" value="확인" > <input type="reset" value="취소" ></td>
		</tr>
		
	</table>
	</center>
</body>
</html>