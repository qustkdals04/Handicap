<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "com.handicap.model.beans.MessageVO" %>
<jsp:useBean id="MessageVO" class="com.handicap.model.beans.MessageVO"></jsp:useBean>
    

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" media="all" href="/Handicap/css/styles.css">
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

<table class="gmlwn">
				<tr>
						<td >● 상세보기(받는)</td>
				</tr>
		</table>

<table  class="list1">
			<tr >
				<th colspan="2" width="300" align="left">보낸사람 : ${messageContent.sender}</th>
				 <!-- 보낸사람 -->
				 <td>
				 </td>
				<th align="right" width="200px">${messageContent.senddate }</th>   <!-- 현재시간 -->
				
				
				
			</tr>
			
</table>
<table class="list1">
			
			<tr height="200px">
				


				<td colspan="5" ><textarea rows="10" cols="50" name="contents" id="contents" style="width: 100%; height: 278px;"></textarea> </td>
			</tr>
			<tr>
				<td width="600px" colspan="4" align="center"></td>

				<td>
				
					
					<button type="button"  id="send">보내기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					
					<button type="button" id="cancel" onclick="history.back()">취소</button>
				</td>
			</tr>

		</table>



		<input type="hidden" name="messageno" value="${messageContent.messageno }">
 </form>


</body>
</html>