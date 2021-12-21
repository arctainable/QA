package All.Notice; //servlet 임

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.NoticeDAO;
import Util.Criteria;
import VO.NoticeVO;
import VO.PageVO;


@WebServlet("/notice.do")	// url 요청 주소가 notice.do가 들어오면 밑에 있는 class notice를 실행하게 해줌
public class Notice extends HttpServlet {				// get set을 사용하여 제어 역할을 하는 servlet
	private static final long serialVersionUID = 1L;
       
	
    public Notice() {	// 기본 생성자
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doDO(request, response);	// doget 메소드를 사용하면 dodo메소드를 대신 실행하라
		
		// response.sendRedirect("notice/notice.jsp");
		
		}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doDO(request, response);	// dopost 메소드를 사용하면 dodo메소드를 대신 실행하라
	}

	protected void doDO(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int pageNum = 1;
		int amount = 10;
		
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount = Integer.parseInt(request.getParameter("amount"));
		}
		
		String sel="";		// 저장소에서 제목 또는 내용이 출력되는 값 
		String word="";		// 검색하려고 사용자가 입력한 단어가 저장되는 곳
		String query="";	// 내가 실행하려고 하는 쿼리문
		
		sel = request.getParameter("sel");		// notice.jsp에서 sel 값을 지정하고(title인지 content인지)
		word = request.getParameter("word");	// notice.jsp에서 word에 들어갈 값을 외부에서 입력한다.
		
//		if(sel == null) {
//			sel="title";
//		}
		
		if(sel != null && word != null) {
			query = sel+" like '%"+word+"%'";	// 만약 sel에 title값이 왔다면 query=title like %word%; 가 됨
		} else {
			sel="title";
		}
		
		NoticeDAO dao = new NoticeDAO();
		Criteria cri = new Criteria();
		
		cri.setPageNum(pageNum);
		cri.setAmount(amount);
		cri.setType(sel);
		cri.setKeyword(word);
		
		PageVO pvo = null;
		
		int count = dao.getNoticeCount(query);
//		List<NoticeVO> list = dao.getNoticeList(query);
		List<NoticeVO> list = dao.getListWithPaging(cri, query);
		pvo = new PageVO(cri, count);
		
		request.setAttribute("count", count);	// 속성 변수값, 변수 값
		request.setAttribute("pagemaker", pvo);	// 변수명을 똑같게 해줘야한다.
		request.setAttribute("list", list);
		
		//doget이건 dopost이건 일단 값이 오면 둘다 doDO를 실행하라.
		RequestDispatcher rd = request.getRequestDispatcher("notice.jsp");
		rd.forward(request,  response);	// notice.jsp를 실행하여 위에서 저장된 request값과 response 값을 저장한 후 notice.jsp에 두 값을 넘겨줘라
		// dao에 접속하여 처리된 결과를 forward 문법을 통해 jsp 문서에 넘겨줘야한다.
		
	}
	
	
}
