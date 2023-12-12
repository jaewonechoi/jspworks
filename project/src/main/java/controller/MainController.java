package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import member.Member;
import member.MemberDAO;

@WebServlet("*.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 113L;
	MemberDAO mDAO;
	BoardDAO bDAO;

	public MainController() {
		mDAO = new MemberDAO();
		bDAO = new BoardDAO();
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
			nextPage = "/main.jsp";
		}else if(command.equals("/joinform.do")) {	//회원가입 페이지 경로
			nextPage = "/member/joinform.jsp";
		}else if(command.equals("/insertmember.do")) {
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String zip_code = request.getParameter("zip_code");
			String address = request.getParameter("address");
			String detailaddress = request.getParameter("detailaddress");

			Member m = new Member();
			m.setId(id);
			m.setPasswd(passwd);
			m.setName(name);
			m.setEmail(email);
			m.setPhone(phone);
			m.setZip_code(zip_code);
			m.setAddress(address);
			m.setDetailaddress(detailaddress);
			mDAO.insertMember(m);

			nextPage = "/main.jsp";
		}else if (command.equals("/loginform.do")) {

			nextPage = "/member/loginform.jsp";
		}

		//게시판 영역
		if(command.equals("/boardlist.do")) {

			nextPage = "/board/neboardlist.jsp";
		}else if(command.equals("/writeform.do")) {

			nextPage = "/board/writeform.jsp";
		}else if(command.equals("/qaboardlist.do")) {
			nextPage = "/qa/qaboardlist.jsp";
		}else if(command.equals("/qawriteform.do")) {
			nextPage = "/qa/qawriteform.jsp";
		}else if(command.equals("/qaboardview.do")) {
			nextPage = "/qa/qaboardview.jsp";
		}else if(command.equals("/deleteqaboard.do")) {
			nextPage = "/qa/qaboardlist.jsp";
		}else if(command.equals("/updateqaboard.do")) {
			nextPage = "/qa/qaupdateboardform.jsp";
		}else if(command.equals("/qaupdateboard.do")) {
			nextPage = "/qa/qaboardlist.jsp";
		}


		RequestDispatcher dpc = request.getRequestDispatcher(nextPage);
		dpc.forward(request, response);
	}

}
