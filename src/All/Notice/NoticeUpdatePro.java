package All.Notice;

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


@WebServlet("/noticeupdatepro.do")
public class NoticeUpdatePro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public NoticeUpdatePro() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String savePath = "noticeupload";
		int maxPostSize= 20 * 1024 * 1024;
		String enctype="utf-8";
		
		ServletContext context = getServletContext();
		String path = context.getRealPath(savePath);
		System.out.println("서버상의 실제 디렉토리: "+path);
		
		MultipartRequest multi = new MultipartRequest(request, path, maxPostSize, enctype, new DefaultFileRenamePolicy());
		// 지역변수 생성

		NoticeVO nvo = new NoticeVO();		
		
		int bno = Integer.parseInt(multi.getParameter("bno"));
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String imgurl = multi.getFilesystemName("imgurl"); // 서버에 실제로 업로드된 파일의 이름을 의미
		System.out.println(imgurl);
		
		if(nvo.getImgurl()!=null) {
			imgurl=nvo.getImgurl();
		}
		
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

			nvo.setBno(bno);			
			nvo.setTitle(title);
			nvo.setContent(content);
			nvo.setImgurl(imgurl);
				
			NoticeDAO dao = new NoticeDAO();	// 객체생성
				// 객체생성
		
		dao.setNoticeUpdate(nvo);
		
		response.sendRedirect("notice.do");		//위의 명령이 실행되면 notice.do로 보낸다	
		
//		NoticeVO nvo = null;
//		nvo.setBno(Integer.parseInt(request.getParameter("bno")));
//		nvo.setTitle(request.getParameter("title"));
//		nvo.setContent(request.getParameter("content"));
//		nvo.setWriter(request.getParameter("writer"));
//		
//		
//		// vo객체 생성
//		new NoticeDAO().setNoticeUpdate(nvo);	// 객체생성
//		
//		
//		
//		response.sendRedirect("notice.do");
//		
//		nvo.setTitle(title);
//		nvo.setContent(content);
//		nvo.setWriter(writer);
//		nvo.setBno(bno);
//		
//		dao.setNoticeUpdate(nvo);
	}

}
