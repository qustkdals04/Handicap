<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "com.handicap.model.beans.MessageVO" %>
<jsp:useBean id="MessageVO" class="com.handicap.model.beans.MessageVO"></jsp:useBean>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"  src="/Handicap/js/jquery-1.10.2.min.js"></script>
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
<table style="width: 618px; ">
			<tr style="width: 495px; ">
				<td align = "center">보낸사람 : </td>
				<td style="width: 150px;height:22px;">&nbsp;${messageContent.sender}</td> <!-- 보낸사람 -->
				<td align="right">${messageContent.senddate }</td>   <!-- 현재시간 -->
				
			</tr>
			
			<tr>
				<td align = "center">내	용 : </td>
				
				<td  colspan="2"><textarea style="width: 490px; height: 172px" readonly="readonly">${messageContent.contents }</textarea></td>
			</tr>
			<tr>

				<td colspan="3" align="right">
					<button type="button" style="width:70px;height: 20px;" id="delete">삭제</button>
					<button type="button" style="width:70px;height: 20px;" id="cancel" onclick="history.back()">취소</button>
				</td>
			</tr>
		</table>
		<input type="hidden" name="messageno" value="${messageContent.messageno }">
 </form>
</body>
</html>