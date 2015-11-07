<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.handicap.model.beans.MessageVO"%>
<jsp:useBean id="MessageVO" class="com.handicap.model.beans.MessageVO"></jsp:useBean>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/styles.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#delete").click(function() { //삭제버튼
			if (confirm("정말로 삭제하시겠습니까?") == true) { // 확인
				$("#messageContent").attr({
					action : 'messagedelete',
					method : 'post'
				});
				$("#messageContent").submit();
			} else {
				return; // 취소
			}
		});
	});
</script>
</head>
<body>
	<center>
		<%-- <!-- 상세보기 -->--%>
		<form id="messageContent" name="messageContent">
			<table class="re">
				<tr>
					<th colspan="3" class="re2"
						style="font-size: x-large; font-weight: bold; color: black; padding-top: 30px; width: 800">메세지
						상세보기</th>
				</tr>

			</table>
			<table class="list1" >
				<tr>
					<th colspan="2" align='left' width="300px">받는사람 :
						${messagesendContent.recipient}</th>

					<%-- <td align = "center" width="100px" color = "#678197">받는사람  </td>
				<td style="width: 150px;height:22px;">&nbsp;${messagesendContent.recipient}</td> <!-- 보낸사람 --> --%>
					<th align="right" width="200px">${messagesendContent.senddate }</th>
					<!-- 현재시간 -->



				</tr>
			</table>

			<table class="list1">

				<tr height="200px">


					<td colspan="2" width="800px"><textarea rows="10" cols="50"
							readonly="readonly" style="width: 100%; height: 200px;">${messagesendContent.contents }</textarea></td>
				</tr>
				<tr>



					<!-- <button type="button" id="delete" onclick="location.href='/Handicap/messagedelete'" class="ml-button" style="float: right;">삭제</button></td>
				<td width="200px" align="left" >			
					
					<button type="button" id="cancel" onclick="history.back()" class="ml-button" style="float: left;">취소</button>
				</td> -->
					<!-- <td width="300px"  align="right">			
					<button type="button" id="send" class="ml-button">보내기</button>
					<button type="button" id="cancel" onclick="history.back()" class="ml-button">취소</button>
				</td> -->
					<td width="500px"></td>

					<td width="300px" align="center">

						<button class="ml-button" type="button" id="delete"
							style="width: 100px">삭제</button>
						<button class="ml-button" type="button" onclick="history.back()"
							id="cancel" style="width: 100px">취소</button>
					</td>





				</tr>
			</table>
			<input type="hidden" name="messageno"
				value="${messagesendContent.messageno }">
		</form>
	</center>
</body>
</html>