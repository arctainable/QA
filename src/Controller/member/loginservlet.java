package Controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ChatDAO;
import DAO.MemberDAO;
import Util.Utility;
import VO.MemberVO;

@WebServlet("*.do")
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public loginservlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		executeDO(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		executeDO(request, response);
		
	}
	
	protected void executeDO(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url= request.getRequestURI();	// uri는 프로젝트 이름과 .jsp까지 구해짐
		String context = request.getContextPath();	// uri에서 프로젝트명만 따와서 구하는 코드 
		String doExe = url.substring(context.length());
				
		HttpSession session = request.getSession();	// 세션 기능으로 쿠키를 저장시키면 쿠키가 남아 정보가 계속 유지된다(로그인 상태 유지 등 에 사용됨)
		MemberDAO mdao = new MemberDAO();
		
		String viewPage= null;		
		switch(doExe) {

		case "/member.do":
			viewPage="signup1.jsp";
			break;
		case "/member2.do":
			viewPage="signup2.jsp";
			break;	
		case "/checkUserid.do":
				String id = request.getParameter("id");
				int idResult = mdao.getCheckId(id);
				request.setAttribute("idResult", idResult);
				
				response.setContentType("text/plain");
				response.setCharacterEncoding("utf-8");
				
				PrintWriter out = response.getWriter();
				out.println(idResult);	
			break;
		case "/memberinsertpro.do":
				
			request.setCharacterEncoding("utf-8");
			
			MemberVO mvo = new MemberVO();

			mvo.setId(request.getParameter("id"));
			mvo.setName(request.getParameter("name"));			
			mvo.setPw(Utility.encoding(request.getParameter("pw")));
			mvo.setTel(request.getParameter("tel"));
			mvo.setGrade(0);
			System.out.println(request.getParameter("id"));
			System.out.println(request.getParameter("name"));			
			System.out.println(request.getParameter("pw"));
			System.out.println(request.getParameter("tel"));

			mdao.memberInserts(mvo);
			response.sendRedirect("signup3.jsp");
			break;
			
		case "/login.do":
			
			viewPage = "login.jsp";
			break;
		case "/loginpro.do":
			
			request.setCharacterEncoding("utf-8"); // 전송받을 언어 설정
			
			String userid = request.getParameter("id");	// 전송받는 내용 설정(로그인 창이라 아이디와 비밀번호 요청)
//			System.out.println(userid);
			String userpw = Utility.encoding(request.getParameter("pw"));
//			System.out.println(userpw);
			int memResult = mdao.loginSearch(userid, userpw);		// memberVO에 set 시켜서 넘겨도 되지만 dao에 set시켜셔 넘겨도 되긴 한다.
//			System.out.println(memResult);
			if(memResult == 1) {
				session.setAttribute("userid", userid);
				response.sendRedirect("index.do");
			} else if(memResult == 0) {
				session.setAttribute("message", "아이디와 패스워드 확인 바람");
				response.sendRedirect("login.do");
			} else if(memResult == -1) {
				session.setAttribute("message", "존재하지 않는 계정입니다");
				response.sendRedirect("login.do");
			}
			break;
		case "/logout.do":
			session.invalidate();				// 세션을 삭제하겠다는 뜻
			response.sendRedirect("index.do");
			break;
		case "/chatting.do":
				viewPage = "chatroom3.jsp";
			break;
		case "/chatsubmit.do":
			request.setCharacterEncoding("UTF-8");
			String chatid = request.getParameter("id");
			String chatcontent = request.getParameter("content");
			String chatfile = request. getParameter("file");
			ChatDAO chdao = new ChatDAO();
			int chatreuslt = chdao.chatsubmit(chatid, chatcontent, chatfile);
			if(chatreuslt == 0) {
				System.out.println("로그인 서블릿에서 저장 실패!");
			} else {
				System.out.println("로그인 서블릿에서 저장 성공!");
			}
		case "/expertlist.do":
			
			request.setCharacterEncoding("utf-8");

			session = request.getSession();	// 세션 기능으로 쿠키를 저장시키면 쿠키가 남아 정보가 계속 유지된다(로그인 상태 유지 등 에 사용됨)		
			
			mdao = new MemberDAO();
			
			String value = (String)session.getAttribute("userid");
			System.out.println("membercheck에서 나오는 값"+value);
			
			mvo = mdao.userProfile(value);
			
			request.setAttribute("mvo", mvo);
			
			
			viewPage="expertlist.jsp";
			break;
		case "/expertdetail.do":
			
			request.setCharacterEncoding("utf-8");

			session = request.getSession();	// 세션 기능으로 쿠키를 저장시키면 쿠키가 남아 정보가 계속 유지된다(로그인 상태 유지 등 에 사용됨)		
			
			mdao = new MemberDAO();
			
			value = (String)session.getAttribute("userid");
			System.out.println("membercheck에서 나오는 값"+value);
			
			mvo = mdao.userProfile(value);
			
			request.setAttribute("mvo", mvo);
			
			
			viewPage="expertdetail.jsp";
			break;		
			
		}
		
		if(viewPage != null) {
			RequestDispatcher rd = request.getRequestDispatcher(viewPage);
			rd.forward(request, response);
		}
		
	}

}
