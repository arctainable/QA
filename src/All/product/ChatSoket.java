package All.product;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatsoket")
public class ChatSoket {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());	// 세션을 열었을때
	@OnMessage
    public void onMessage(String message, Session session) throws IOException {
        System.out.println(message);
        synchronized(clients) {
            for(Session client : clients) {
                if(!client.equals(session)) {
                    client.getBasicRemote().sendText(message);
                }
            }
        }
    }
    
    @OnOpen
    public void onOpen(Session session) throws IOException {		// 이게 발동되고
        System.out.println(session);
        clients.add(session);
    }
    
    @OnClose
    public void onClose(Session session) {			// 세션을 닫았을때(사람이 나갔을 때) 이게 발동한다
        clients.remove(session);
    }
    @OnError
    public void onError(Throwable t) throws IOException {
    	t.printStackTrace();
    }
}
