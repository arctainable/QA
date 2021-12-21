package All.Notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.NoticeDAO;


@WebServlet("/noticedelete.do")
public class NoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public NoticeDelete() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		new NoticeDAO().getNoticeDelete(bno);

		response.sendRedirect("notice.do");		// 삭제한다음에 다시 notice 목록 페이지로 돌아간다.
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
