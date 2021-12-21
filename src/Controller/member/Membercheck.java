package Controller.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.MemberDAO;
import VO.MemberVO;

@WebServlet("/membercheck.do")
public class Membercheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Membercheck() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		executeDO(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		executeDO(request, response);
	}
	
	protected void executeDO(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();	// 세션 기능으로 쿠키를 저장시키면 쿠키가 남아 정보가 계속 유지된다(로그인 상태 유지 등 에 사용됨)		
		
		MemberDAO mdao = new MemberDAO();
		
		String value = (String)session.getAttribute("userid");
		System.out.println("membercheck에서 나오는 값"+value);
		
		MemberVO mvo = mdao.userProfile(value);
		
//		request.setCharacterEncoding("utf-8");
		
//		MemberDAO mdao = new MemberDAO();
		
		ArrayList<MemberVO> list = mdao.memberlist();
		
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
		
//		System.out.println(list);
		
		request.setAttribute("list", list);
		request.setAttribute("mvo", mvo);
		
		request.getRequestDispatcher("membercheck.jsp").forward(request, response);
		
	}	
	
}
