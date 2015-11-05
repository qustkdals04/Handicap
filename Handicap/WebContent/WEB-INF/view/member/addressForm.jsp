<%@page import="java.awt.Window"%>
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
<script type="text/javascript"  src="/Handicap/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
           var length = 0;
           var addressVal = "";
           $("#findAddressIn").click(function(){   	   
        	   if (length != 0){
        		   for (i=0; i<length+1; i++){
        			   $('#'+i).remove();
        		   }
        	   }
        	   var dong = "dong="+$("#dong").val();
        	   $.ajax({
        		  type:'post',
        		  url:'addressList',
        		  data:dong,
        		  dataType:'json',
        		  success:function(data){
        		  	  //addchoice(addressVal);
        			  $.each(data, function(i,dataObj){
        			  	  addressVal = dataObj.sido+" "+dataObj.gugun+" "+dataObj.dong+" "+dataObj.bunji;
        				  $('#addressList').append('<tr id='+ i.toString() +' onclick=\"addchoice(\''+dataObj.zipcode+'\', \'' + addressVal + '\')\"><td>'+dataObj.zipcode+'</td><td colspan="2">'+dataObj.sido+" "+dataObj.gugun+" "+dataObj.dong+" "+dataObj.bunji+'</td></tr>');
        				  length = i;
        			  })
               	   	}
               	  
        	   });
        	});
});
function addchoice(address1, address2) {
                opener.$("#companyaddress1").val(address1);
                opener.$("#companyaddress2").val(address2);
                opener.$("#companyaddress3").attr('readonly', false);
                self.close();
            }
</script>
</head>
<body>
<center>
	<h3></h3>
		<form method="post" name="addressForm" id="addressForm">
			<table border="1" id="addressList">
				<tr>
					<td >주소 :</td>
					<td ><input type="text" name="dong" id="dong"
						style="width: 100; height: 22">(동/면/읍)</td>
					<td><button type="button" class="ml-button" id="findAddressIn">검색</button></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>