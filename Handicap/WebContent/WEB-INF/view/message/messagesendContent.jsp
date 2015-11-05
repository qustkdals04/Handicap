<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "com.handicap.model.beans.MessageVO" %>
<jsp:useBean id="MessageVO" class="com.handicap.model.beans.MessageVO"></jsp:useBean>
    

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"  src="/Handicap/js/jquery-1.10.2.min.js"></script>
  <link rel="stylesheet" type="text/css" media="all" href="/Handicap/css/styles.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#delete").click(function(){			 //삭제버튼
			if(confirm("정말로 삭제하시겠습니까?") == true){  // 확인
				$("#messageContent").attr({action:'messagedelete', method:'post'});
	            $("#messageContent").submit();
			}
			else{
					return;   // 취소
			}
		});
	});
</script>
</head>
<body>
	<%-- <!-- 상세보기 -->--%>
<form id="messageContent" name="messageContent">
<table class="gmlwn">
		<tr>
			<td>●상세보기(보낸)</td>
		</tr>
	</table>
<table class="list1">
			<tr >
			<th colspan="2" align='left' width="300px">받는사람 : ${messagesendContent.recipient}</th>

				<%-- <td align = "center" width="100px" color = "#678197">받는사람  </td>
				<td style="width: 150px;height:22px;">&nbsp;${messagesendContent.recipient}</td> <!-- 보낸사람 --> --%>
				<th align="right" width="200px">${messagesendContent.senddate }</th>   <!-- 현재시간 -->
				
				
				
			</tr>
</table>

<table class="list1">
			
			<tr height="200px">
				
				
				<td  colspan="5" >
				<textarea rows="10" cols="50" readonly="readonly" style="width: 100%; height: 278px;">
				${messagesendContent.contents }</textarea></td>
			</tr>
			<tr>
			<td width="500px" colspan="4"></td>

				<td width="300px" align="center">
				
					
					<button id="delete" onclick="location.href='/Handicap/messagedelete'">삭제</button>
					
					
					<button id="cancel" onclick="history.back()">취소</button>
				</td>
			<!-- <td width="600px">
			
			</td>
				<td colspan="2" align="right" width="200px" >
					<button id="delete" onclick="location.href='/Handicap/messagedelete'">삭제</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button  id="cancel" onclick="history.back()">취소</button> 

				</td> -->
			</tr>
		</table>
		<input type="hidden" name="messageno" value="${messagesendContent.messageno }">
 </form>
</body>
</html>