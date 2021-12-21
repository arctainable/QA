package All.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.MemberDAO;


@WebServlet("/expertchat.do")
public class Expertchat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Expertchat() {
        super();
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url= request.getRequestURI();	// uri는 프로젝트 이름과 .jsp까지 구해짐
		String context = request.getContextPath();	// uri에서 프로젝트명만 따와서 구하는 코드 
				
		HttpSession session = request.getSession();	// 세션 기능으로 쿠키를 저장시키면 쿠키가 남아 정보가 계속 유지된다(로그인 상태 유지 등 에 사용됨)
		MemberDAO mdao = new MemberDAO();
		
		String viewPage= null;		
		
		viewPage="expertchat.jsp";

		
			RequestDispatcher rd = request.getRequestDispatcher(viewPage);
			rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		executeDO(request, response);
	}
	
	protected void executeDO(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url= request.getRequestURI();	// uri는 프로젝트 이름과 .jsp까지 구해짐
		String context = request.getContextPath();	// uri에서 프로젝트명만 따와서 구하는 코드 
				
		HttpSession session = request.getSession();	// 세션 기능으로 쿠키를 저장시키면 쿠키가 남아 정보가 계속 유지된다(로그인 상태 유지 등 에 사용됨)
		MemberDAO mdao = new MemberDAO();
		
		String viewPage= null;		
		
		viewPage="expertchat.jsp";


			RequestDispatcher rd = request.getRequestDispatcher("expertchat.jsp");
			rd.forward(request,  response);

	}	
		
	
}
