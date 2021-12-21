package All.Notice;		//서블릿임

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.MemberDAO;
import DAO.NoticeDAO;
import Util.Criteria;
import VO.MemberVO;
import VO.NoticeVO;


@WebServlet("/noticeview.do")
public class Noticeview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Noticeview() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		String sel = request.getParameter("sel");
		String word = request.getParameter("word");
		
		NoticeDAO dao = new NoticeDAO();		// dao 사용하기 위해 객체생성
		dao.getViewcount(bno);					// 글을 선택했을때 이 조회수 카운트를 한번 발생시키고 이후에 페이지를 이동시킨다.
		
		NoticeVO nvo = dao.getNoticeBno(bno);	// dao 가져왔으니까 사용해서 생성된 객체안에 있는 bno 저장하고 그걸 nvo에 받아라
		NoticeVO preVO = dao.getPreBno(bno);
		NoticeVO nextVO = dao.getNextBno(bno);
		
		Criteria cri = new Criteria();
		cri.setPageNum(pageNum);
		cri.setAmount(amount);
		cri.setType(sel);
		cri.setKeyword(word);
		
		request.setAttribute("nvo", nvo);		// noticeVO nvo에 저장된 값을 nvo에 저장하라. 저장해야 jsp에 보내줄 수 있음 nvo는 나중에 noticeview에서 단품으로 쓸것임
		request.setAttribute("preVO", preVO);
		request.setAttribute("nextVO", nextVO);
		request.setAttribute("cri", cri);
		
// ------------------------계정 정보(grade 같은거)를 세션값에서 찾기 위해 위 내용을 써줌
		MemberDAO mdao = new MemberDAO();
		
		HttpSession session = request.getSession();	// 세션 기능으로 쿠키를 저장시키면 쿠키가 남아 정보가 계속 유지된다(로그인 상태 유지 등 에 사용됨)		
		
		String value = (String)session.getAttribute("userid");
		System.out.println("membercheck에서 나오는 값"+value);
		
		MemberVO mvo = mdao.userProfile(value);
		
		ArrayList<MemberVO> list = mdao.memberlist();
		
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}

		request.setAttribute("list", list);
		request.setAttribute("mvo", mvo);

// -------------------------여기까지가 계정 정보 세션값 받아오기임		
		
		RequestDispatcher rd = request.getRequestDispatcher("noticeview.jsp");	// 포워딩함
		rd.forward(request,  response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
