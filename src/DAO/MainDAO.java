package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import VO.NoticeVO;

public class MainDAO extends NoticeDAO {
		
public List<NoticeVO> getNoticeList(String query) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<NoticeVO> list = new ArrayList<NoticeVO>();	// noticevo 타입의 가변배열을 담을수 있는 객체 list를 만들고 각 객체에 값을 담으려 한다.
		NoticeVO nvo = null;
		
		String sql = null;
		
		try {
			if(query!="") {
				sql = "select * from notice where "+query+" order by bno desc";	// 검색하고자 하는 값이 있을때 실행됨 order by ~는 bno 순으로 정렬한다는 뜻
			} else {
				sql = "select * from notice order by bno desc";		// 검색하고자 하는 값이 없을때 실행됨
			}
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				nvo = new NoticeVO();
				nvo.setBno(rs.getInt("bno"));
				nvo.setTitle(rs.getString("title"));
				nvo.setContent(rs.getString("content"));
				nvo.setWriter(rs.getString("writer"));
				nvo.setRegdate(rs.getString("regdate"));
				nvo.setViewcount(rs.getInt("viewcount"));
				nvo.setImgurl(rs.getString("imgurl"));
				list.add(nvo);
				
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbm.close(rs, pstmt, conn);
		}
		return list;
	}
}
