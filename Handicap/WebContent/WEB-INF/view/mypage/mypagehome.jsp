<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mypage home</title>
</head>
<body>
	<table border="1">
		<tr>
			<td width="200px" height="250px" align="center">[이미지]</td>   <!-- 이미지 공간 -->
			<td rowspan="5">
				<table border="1" height="500px" width="500px">
					<tr>
						<td style="vertical-align: top;" height="20px" align="center"><input
							type="radio"> 활동내역 <input type="radio"> 댓글내역</td>   
					</tr>
					<tr>
						<td align="center">[활동내역]</td>     <!-- 리스트 -->
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="center">
				<button type="button">이미지 선택</button>
			</td>
		</tr>
		<tr>
			<td align="center" height="100px">[한줄 말]</td>    <!-- 한줄말 -->
		</tr>
		<tr>
			<td><input type="text" style="width: 100px">
			<button type="button">한마디하기</button></td>  
		</tr>
		<tr>
			<td align="center" height="50px">[현재시간]</td>
		</tr>

	</table>
</body>
</html>  