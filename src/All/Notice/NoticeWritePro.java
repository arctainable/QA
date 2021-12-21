package All.Notice; // servlet 임

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.NoticeDAO;
import VO.NoticeVO;


@WebServlet("/noticewritepro.do")
public class NoticeWritePro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public NoticeWritePro() {
        super();
    
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		

//		String title = request.getParameter("title");
//		String content = request.getParameter("content");
//		String writer = request.getParameter("writer");
		
//		DBManager dbm = DBManager.getInstance();
//		dbm.getConnection();
//		System.out.println("DB 사용 가능합니다.");
		
		//VO 객체 생성
		
//		NoticeVO nvo = new NoticeVO();
		
		// insert하기 위해 vo를 담는다

		String savePath = "noticeupload";
		int maxPostSize= 20 * 1024 * 1024;
		String enctype="utf-8";
		
		ServletContext context = getServletContext();
		String path = context.getRealPath(savePath);
		System.out.println("서버상의 실제 디렉토리: "+path);
		
		MultipartRequest multi = new MultipartRequest(request, path, maxPostSize, enctype, new DefaultFileRenamePolicy());
		// 지역변수 생성
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String writer = multi.getParameter("writer");

				;
		String imgurl = multi.getFilesystemName("imgurl"); // 서버에 실제로 업로드된 파일의 이름을 의미
		System.out.println(imgurl);
		if(imgurl == null ) {
			System.out.println("제목: "+multi.getParameter("title"));
			System.out.println("내용: "+multi.getParameter("content"));
			System.out.println("이미지 업로드 없이 글만 씀");
			
			if(multi.getParameter("imgurl") != null){	// 이미지를 없이 글을 썼기 때문에 기존 이미지를 수정되는 글에 그대로 적용시킨다.
				imgurl=multi.getParameter("imgurl");
			}
		} else {
			System.out.println("제목: "+multi.getParameter("title"));
			System.out.println("내용: "+multi.getParameter("content"));
			System.out.println("파일명: "+imgurl);	
		}
			NoticeVO nvo = new NoticeVO();	
			

			nvo.setTitle(title);
			nvo.setContent(content);
			nvo.setWriter(writer);
			nvo.setImgurl(imgurl);
				
			NoticeDAO dao = new NoticeDAO();	// 객체생성
			
		dao.setNoticeInsert(nvo);
		
		response.sendRedirect("notice.do");		//위의 명령이 실행되면 notice.do로 보낸다	
	}
}
