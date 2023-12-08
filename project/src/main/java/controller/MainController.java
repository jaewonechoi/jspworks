package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.Member;
import member.MemberDAO;

@WebServlet("*.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 113L;
	MemberDAO mdao;
       
    public MainController() {
    	mdao = new MemberDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 인코딩
		request.setCharacterEncoding("UTF-8");
		
		//응답할 컨텐츠 유형
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();
		String command = uri.substring(uri.lastIndexOf("/"));
		String nextPage = "";
		
		if(command.equals("/main.do")) {	//메인 페이지 경로
			nextPage = "main.jsp";
		}else if(command.equals("/joinform.do")) {	//회원가입 페이지 경로
			nextPage = "/member/joinform.jsp";
		}else if(command.equals("/join.do")) {
			String uid = request.getParameter("uid");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			int zip_code = Integer.parseInt(request.getParameter("zip_code"));
			String address = request.getParameter("address");
			String daddress = request.getParameter("detailaddress");

			Member m = new Member();
			
			nextPage = "main.jsp";
		}
		
		RequestDispatcher dpc = request.getRequestDispatcher(nextPage);
		dpc.forward(request, response);
	}

}
