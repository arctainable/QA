package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBManager.DBManager;
import Util.Criteria;
import VO.NoticeVO;

public class NoticeDAO {

	DBManager dbm = DBManager.getInstance();
	
	public void setNoticeInsert(NoticeVO nvo) {
			
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into notice values(notice_seq.nextval,?,?,?,sysdate,0,?)";
		
		try {
		conn = dbm.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nvo.getTitle());
		pstmt.setString(2, nvo.getContent());
		pstmt.setString(3, nvo.getWriter());
		pstmt.setString(4, nvo.getImgurl());
		pstmt.executeUpdate();
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbm.close(pstmt, conn);
		}
	}
	
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
	
	public List<NoticeVO> getListWithPaging(Criteria cri, String query) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO nvo = null;
		
		String sql = "";
		
		try {
			if(query!="") {
				sql = "select * from (select /*+ index_desc(notice notice_pk) */ rownum rn, bno, title, content, writer, regdate, viewcount, imgurl from notice where ("+query+") and rownum <= ? * ?) where rn > (?-1) * ?";
			} else {
				sql = "select * from (select /*+ index_desc(notice notice_pk) */ rownum rn, bno, title, content, writer, regdate, viewcount, imgurl from notice where rownum <= ? * ?) where rn > (?-1) * ?";
			}
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cri.getPageNum());
			pstmt.setInt(2, cri.getAmount());
			pstmt.setInt(3, cri.getPageNum());
			pstmt.setInt(4, cri.getAmount());
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

	public int getNoticeCount(String query) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		String sql = null;
		
		try {
			if(query!="") {
				sql = "select count(*) as cnt from notice where "+query;
			} else {
				sql = "select count(*) as cnt from notice";
			}
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt("cnt");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbm.close(rs, pstmt, conn);
		}
		return count;
	}
	
	public NoticeVO getNoticeBno(int bno) {	// bno에 해당되는 레코드를 검색하는 메소드
	
//		getViewcount(bno);	 이걸로 카운트를 옮기던지 noticeview.java에서 해당 방법으로 조회수 카운트를 올릴 수 있다.
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		NoticeVO nvo = null;
		
		try {
		String sql = "select* from notice where bno="+bno;
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
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbm.close(rs, pstmt, conn);
		}
		return nvo;
	}
	
	public void getViewcount(int bno) {	// 조회수 올리는 프로그램
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql ="update notice set viewcount = viewcount + 1 where bno="+bno;
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbm.close(pstmt, conn);
		}
	}
	
	public void getNoticeDelete(int bno) { //bno 매개변수를 받아서 해당 변수로 지정되어있는 부분을 삭제하라

		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql ="delete notice where bno ="+bno;
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbm.close(pstmt, conn);
		}
	}
	
	public void setNoticeUpdate(NoticeVO nvo) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql ="update notice set title=?, content=?, imgurl=? where bno=?";
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nvo.getTitle());
			pstmt.setString(2, nvo.getContent());
			pstmt.setString(3, nvo.getImgurl());
			pstmt.setInt(4, nvo.getBno());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbm.close(pstmt, conn);
		}
	}
	
	public NoticeVO getPreBno(int bno) {	// bno값을 () 안에서 받아야 밑에 string sql에 있는  bno<? 값을 줄 수 있음
											// 이전값 찾기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeVO nvo = null;
		
		String sql="select * from notice where bno = (select max(bno) from notice where bno<?)";
		
		try {
			conn=dbm.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bno); // sql문의 첫번째 물음표 값에다가 bno를 대입해준다.
			rs=pstmt.executeQuery();
			if(rs.next()) {
				nvo = new NoticeVO();
				nvo.setBno(rs.getInt("bno"));
				nvo.setTitle(rs.getString("title"));	// nvo에다가 bno랑 title 값을 저장시킴
			}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				dbm.close(rs, pstmt, conn);
			}
			return nvo;
	}

	public NoticeVO getNextBno(int bno) {	// bno값을 () 안에서 받아야 밑에 string sql에 있는  bno<? 값을 줄 수 있음
											// 다음값 찾기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeVO nvo = null;
		
		String sql="select * from notice where bno = (select min(bno) from notice where bno>?)";
		
		try {
			conn=dbm.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bno); // sql문의 첫번째 물음표 값에다가 bno를 대입해준다.
			rs=pstmt.executeQuery();
			if(rs.next()) {
				nvo = new NoticeVO();
				nvo.setBno(rs.getInt("bno"));
				nvo.setTitle(rs.getString("title"));	// nvo에다가 bno랑 title 값을 저장시킴
			}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				dbm.close(rs, pstmt, conn);
			}
			return nvo;
	}
}
