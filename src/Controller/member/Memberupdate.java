package Controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.MemberDAO;
import VO.MemberVO;

@WebServlet("/memberupdate.do")
public class Memberupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Memberupdate() {
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
		System.out.println("memberupdate에서 나오는 값 "+value);			
		MemberVO mvo = mdao.userProfile(value);
		
		
		
		String email = request.getParameter("email");
		int grade=0;
		if(email==null) {
			grade = Integer.parseInt(request.getParameter("grade"));
		} else {
			grade = 1;
		}
		String name = request.getParameter("name");
		
		System.out.println(email);
		System.out.println(name);
		
		mvo.setEmail(email);
		mvo.setGrade(grade);
		mvo.setName(name);
		
//		request.setAttribute("mvo", mvo);		
		
		mdao.Insertemail(mvo);
		mdao.changename(mvo);
		mdao.changegrade(mvo);
		response.sendRedirect("membercheck.do");
	}
	
}
