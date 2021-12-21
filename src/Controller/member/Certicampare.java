package Controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


@WebServlet("/certicampare.do")
public class Certicampare extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Certicampare() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String AuthenticationKey = (String)request.getSession().getAttribute("AuthenticationKey");
		String certinumber = request.getParameter("certinumber");
		
		JSONObject obj = new JSONObject();
		
		if(!AuthenticationKey.equals(certinumber)) {
			obj.put("msg", "인증번호가 맞지 않습니다.");
			obj.put("check", "nok");
		} else {
			obj.put("msg", "인증이 완료되었습니다.");
			obj.put("check", "ok");
		}
		  
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/x-json; charset=utf-8");
        response.getWriter().print(obj);
		
 	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
