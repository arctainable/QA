package All.Notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.NoticeDAO;
import VO.NoticeVO;


@WebServlet("/noticeupdate.do")
public class NoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public NoticeUpdate() {
        super();
  
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		NoticeVO nvo = new NoticeDAO().getNoticeBno(bno);	
		
//		NoticeDAO dao = new NoticeDAO();		밑에 이 두줄이 위에 한줄과 같은뜻이다.			
//		NoticeVO nvo = dao.getNoticeBno(bno);
		
		request.setAttribute("nvo", nvo);
		
		RequestDispatcher rd = request.getRequestDispatcher("noticeupdate.jsp");
		rd.forward(request, response);		// 위에 줄이랑 왼쪽 줄이랑 두개 합쳐서 noticeupdate.do 가 시스템에서 입력이 되면 notice 폴더에 있는 noticeupdate.jsp 를 실행하겠다 는 뜻 
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
