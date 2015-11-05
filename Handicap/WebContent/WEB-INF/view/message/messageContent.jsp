<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "com.handicap.model.beans.MessageVO" %>
<jsp:useBean id="MessageVO" class="com.handicap.model.beans.MessageVO"></jsp:useBean>
      <link rel="stylesheet" type="text/css" media="all" href="/Handicap/css/styles.css">
      <link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/new.css">

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
<center>
<table class="re">
				<tr>
					  <th colspan="3" class="re2" 
								style="font-size: x-large; font-weight: bold; color: black; padding-top: 30px; width: 800">메세지 상세보기</th>
				</tr>
	

     <!-- 메세지 리스트 제목창 -->
	
</table>
	<%-- <!-- 상세보기 -->--%>
<form id="messageContent" name="messageContent">



<table  class="list1">
			<tr >
				<th colspan="2" width="300" align="left">보낸사람 : ${messageContent.sender}</th>
				 <!-- 보낸사람 -->
				 <th>
				 </th>
				<th align="right" width="200px">${messageContent.senddate }</th>   <!-- 현재시간 -->
				
				
				
			</tr>
			
</table>
<table class="list1">
			
			<tr height="200px">
				


				<td colspan="5" ><textarea rows="10" cols="50" name="contents" id="contents" style="width: 100%; height: 200px;"></textarea> </td>
			</tr>
			<tr>
				<td width="500px" colspan="4"></td>

				<td width="300px" align="center">
				
					
					<button class="ml-button" type="button"  id="send" style="width: 70px">보내기</button>
					
					
					<button class="ml-button" type="button" id="cancel" onclick="history.back()" style="width: 70px">취소</button>
				</td>
			<!-- 	<td align ="center"width="500px"></td>
			<td align="right" width = "300px">
			<button class="ml-button2" type="button" onclick="location.href='/Handicap/messagesendlist'" style="width: 100px">보낸메시지</button>
			<button class="ml-button2" type="button" onclick="location.href='/Handicap/messageWrite'" style="width: 100px">쪽지보내기</button></td>
	</tr> -->
				
			</tr>

		</table>



		<input type="hidden" name="messageno" value="${messageContent.messageno }">
 </form>
      </center>

</body>
</html>