package kr.ac.doowon.ws;

import java.net.InetSocketAddress;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception { // 웹소켓
																						// 클라이언트와
																						// 연결될때
																						// 호출
	} // WebSocketSession: 클라이언트와의 세션을 관리하는 객체

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception { // 웹소켓
																										// 클라이언트가
																										// 텍스트메시지를
																										// 전송할
																										// 때
																										// 호출
		String msg = message.getPayload();// 클라이언트가 보낸 텍스트 데이터 얻어오기
		
		System.out.println("from Client: " + msg + session.getId());
		// session.sendMessage(WebSocketMessage arg0);//웹소켓 클라이언트에게 데이터 전송
		session.sendMessage(new TextMessage("엿먹어씨벵아"+msg));
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception { // 웹소켓
																										// 클라이언트와
																										// 종료될때
																										// 호출

	}
}
