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
</head>
<body>
	<%-- <!-- 상세보기 -->--%>
<table>
			<tr>
				<td>보낸사람 : </td>
				<td style="width: 150px;height:22px;">&nbsp;<%=MessageVO.getSender() %> </td>
			</tr>
			<tr>
				<td>내	용 : </td>
				<td style="width: 150px;height:22px;">&nbsp;<%=MessageVO.getContents()%></td>
			</tr>
			<tr>
				<td></td>
				<td align="right">
					<button type="button" style="width:70px;height: 20px;" id="send">보내기</button>
					<button type="button" style="width:70px;height: 20px;" id="cancel">취소</button>
				</td>
			</tr>
		</table>
 

</body>
</html>