<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/styles.css">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/new.css">
<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
	var searchNick = false;
	$(document).ready(function() {
		$("#send").click(function() { //보내기버튼
			if ($("#recipient").val() == "") {
				alert("받는사람을 입력해주세요..");
				$("#recipient").focus();
			} else if ($("#contents").val() == "") {
				alert("내용을 입력해주세요..");
				$("#contents").focus();
			} else if (searchNick != true) {
				alert("받는사람에 닉네임을 입력하고 검색을 해주세요.");
			} else {
				$("#messageWrite").attr({
					action : 'messageWriteAction',
					method : 'post'
				});
				$("#messageWrite").submit();
			}
		});
		$("#findnick").click(function() {
			var checkNick = "nickname=" + $("#recipient").val();
			if ($("#recipient").val() == "") {
				alert("받는사람을 입력해주세요..");
				$("#recipient").focus();
			} else {
				$.ajax({
					type : "GET",
					url : "nickCheck",
					data : checkNick,
					success : function(data) {
						if ($.trim(data) != "") {
							searchNick = true;
							alert("닉네임이 존재합니다. 내용을 입력해주세요");
							$("#contents").focus();
						} else {
							searchNick = false;
							alert("존재하지 않는 닉네임입니다.");
							$("#recipient").val() == "";
							$("#recipient").focus();
						}
					},
					error : function(status) {
						alert(status + "error");
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<center>
		<form name="messageWrite" id="messageWrite">
			<table class="re">
				<tr>
					<th colspan="3" class="re2"
						style="font-size: x-large; font-weight: bold; color: black; padding-top: 30px; width: 800">메시지
						쓰기</th>
				</tr>
			</table>
			<table class="list3">
				<tr>
					<th align="left" width="600px" colspan="5" >받는사람 입력&nbsp;&nbsp;<input
						type="text" name="recipient" id="recipient"
						style="width: 300px; height: 22px; text-align: left;"><button type="button" class="ml-button" id="findnick" width="70px" style="vertical-align: middle;">검색</button><!-- <button id="findnick">검색</button> --></th>
					
					
					
				</tr>
				<tr>

				<td colspan="5" ><textarea rows="10" cols="50" name="contents" id="contents" style="width: 100%; height: 200px;"></textarea> </td>
			</tr>			
				<tr>
					<td width="300px" align="left"  colspan="5">
						<button class="ml-button" type="button" id="send">보내기</button>
						<button class="ml-button" type="button" id="cancel" onclick="history.back()">취소</button>
					</td>


				</tr>
			</table>
			<input type="hidden" name="userid" value="${userid }">
		</form>
	</center>
</body>
</html>