<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "com.handicap.model.beans.ZipcodeVO" %>
<%@ page import = "com.handicap.model.dao.ZipcodeDAO" %>
<%@ page import="java.util.*, com.handicap.control.*" %>
<jsp:useBean id="address" class="com.handicap.model.beans.ZipcodeVO" />
<%-- <jsp:useBean id="address" class="com.handicap.control.MyController" /> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주소 검색</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
           function addchoice(address) {
                var obj = new Object();
                obj.addchoice = address;
                window.returnValue = obj;
                self.close();
           }
           
           $("#findAddressIn").click(function(){
        	   $("#addressForm").attr({
					action : "addressList",
					method : 'post'
				});
        	   $("#addressForm").submit();
           });
});
</script>
</head>
<body>
<center>
	<h3></h3>
		<form method="post" name="addressForm" id="addressForm">
			<table border="1">
				<tr>
					<td>주소 : </td>
					<td><input type="text" name="area3" id="area3"
						style="width: 100; height: 22">(동/면/읍)</td>
					<td><button type="button" id="findAddressIn">검색</button></td>
				</tr>
				<tr>
					<c:forEach var="address" items="${addressList}">
						<tr>
							<td>
								<tt onclick="addchoice(${address.address});">${address.address}</tt>
							</td>
						</tr>
					</c:forEach>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>