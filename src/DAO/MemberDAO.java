package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBManager.DBManager;
import VO.MemberVO;
import VO.NoticeVO;

public class MemberDAO {

	DBManager dbm = DBManager.getInstance();
	
	public int getCheckId(String uid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member where id='"+uid+"'";
		int result = 0;
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result=1;
			} else {
				result=-1;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbm.close(rs, pstmt, conn);
		}
		return result;
	}
	
	public void memberInserts(MemberVO mvo) {	// 비밀번호를 암호화하는 변수
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into member values (member_seq.nextval,?,?,?,?,null,0)";
		
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, mvo.getBno());
			pstmt.setString(1, mvo.getId());
			pstmt.setString(2, mvo.getName());				
			pstmt.setString(3, mvo.getPw());
			pstmt.setString(4, mvo.getTel());	
//			pstmt.setString(5, mvo.getEmail());			
//			pstmt.setInt(5, mvo.getGrade());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbm.close(pstmt, conn);
		}
		
	}
	
	public void Insertemail(MemberVO mvo) {	// 비밀번호를 암호화하는 변수
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update member set email=?, grade=1 where id='"+mvo.getId()+"'";
		System.out.println("sql문의 값은 "+sql);
		System.out.println(mvo.getEmail());
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, mvo.getEmail());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbm.close(pstmt, conn);
		}
	}
	
	public void changename(MemberVO mvo) {	// 비밀번호를 암호화하는 변수
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update member set name=? where id='"+mvo.getId()+"'";
		System.out.println("sql문의 값은 "+sql);
		System.out.println(mvo.getEmail());
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, mvo.getName());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbm.close(pstmt, conn);
		}
	}
	
public void changegrade(MemberVO mvo) {	// 비밀번호를 암호화하는 변수
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update member set grade=? where id='"+mvo.getId()+"'";
		System.out.println("sql문의 값은 "+sql);
		System.out.println(mvo.getEmail());
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, mvo.getGrade());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbm.close(pstmt, conn);
		}
	}
	
	public int loginSearch(String userid, String userpw) {
		
		Connection conn = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result=-1;
		String sql = "select pws from member where id=?";
		System.out.println(userid);
		System.out.println(sql);
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();		
			if(rs.next()) {

				if(rs.getString("pws") != null && rs.getString("pws").equals(userpw)) {
					
					result = 1;		// id와 pw 모두 같을땐 1 출력
					System.out.println("로그인 잘됨");
				} else {
					result = 0;		// id는 같은데 pw가 다르면 0 출력
					System.out.println("아이디가 틀림");
				}	
			} else {
				System.out.println("아이디도 없음");
				result = -1;		// id 자체가 없으면 -1 출력
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbm.close(rs, pstmt, conn);
		}
		System.out.println(result);
		return result;
		
	}
	
	public MemberVO userProfile(String value) {
		Connection conn = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		System.out.println(value);
		String sql = "select * from member where id like '"+value+"'";
//		System.out.println(sql);
		MemberVO mvo = null;
		
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, value);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mvo = new MemberVO();
				mvo.setBno(rs.getInt("bno"));
				mvo.setId(rs.getString("id"));
				mvo.setName(rs.getString("name"));
				mvo.setTel(rs.getString("tel"));
				mvo.setEmail(rs.getString("email"));
				mvo.setGrade(rs.getInt("grade"));
			} 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbm.close(rs, pstmt, conn);
		}
		return mvo;
	}
	
	public ArrayList<MemberVO> memberlist() {
		
		Connection conn = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		System.out.println(value);
		String sql = "select * from member order by grade desc";

		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		MemberVO mvol=null;
		
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, value);
			rs = pstmt.executeQuery();
			while(rs.next()) {		//if 로 하면 1개만 출력 while이면 끝까지 출력
				mvol = new MemberVO();
				mvol.setBno(rs.getInt("bno"));
				mvol.setId(rs.getString("id"));
				mvol.setName(rs.getString("name"));
				mvol.setTel(rs.getString("tel"));
				mvol.setEmail(rs.getString("email"));
				mvol.setGrade(rs.getInt("grade"));
				list.add(mvol);
			} 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbm.close(rs, pstmt, conn);
		}
		return list;
	}
	

}
	
