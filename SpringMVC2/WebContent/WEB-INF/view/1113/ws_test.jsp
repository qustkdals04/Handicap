<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/SpringMVC2/js/jquery.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
      $('#sendBtn').click(function(){
    	  sendMessage();
      })
    });
    
    var wsocket;
    function sendMessage(){
      wsocket = new WebSocket('ws://192.168.0.171/SpringMVC2/echo-ws');
      wsocket.onmessage = onMessage;
      wsocket.onclose = onClose;
      wsocket.onopen = function(){//서버에 연결되면 실행
    	wsocket.send($('#message').val());//서버에 메시지 전송
      }
    }
    
    function onMessage(evt){//서버에서 메시지를 받으면 실행
      var data = evt.data;
      alert('서버에서 데이터 받음: '+ data);
      wsocket.close();//연결 종료
    }
    
    function onClose(evt){//연결이 종료되면 실행
      alert('연결 끊김')
    }
</script>
</head>
<!-- ws_test.jsp -->
<body>
	<input type="text" id="message">
  <input type="button" id="sendBtn" value="전송">
</body>
</html>