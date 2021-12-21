package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import DBManager.DBManager;

public class ChatDAO {

	DBManager dbm = DBManager.getInstance();
	
	public int chatsubmit(String chatid, String chatcontent, String chatfile) {
		
		int result = 0;	// 값이 정상적으로 돌아오나 확인  
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into chat values(chat_seq.nextval, ?, ?, ?, sysdate)";
		
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, chatid);
			pstmt.setString(2, chatcontent);
			pstmt.setNString(3, chatfile);
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbm.close(pstmt, conn);
		}
		return result;
	}
	
}
