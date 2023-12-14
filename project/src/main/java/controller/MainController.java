package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.NoticeBoardDAO;
import board.NBoard;
import member.Member;
import member.MemberDAO;
import product.ProductDAO;
import product.ProductVO;

@WebServlet("*.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 113L;
	MemberDAO mDAO;
	NoticeBoardDAO nDAO;
	ProductDAO pDAO;

	public MainController() {
		mDAO = new MemberDAO();
		nDAO = new NoticeBoardDAO();
		pDAO = new ProductDAO();
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

		HttpSession session = request.getSession();

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
		}else if (command.equals("/memberview.do")) {
			String id =request.getParameter("id");

			Member member = mDAO.getMember(id);

			request.setAttribute("member", member);

			nextPage = "/member/memberview.jsp";
		}else if (command.equals("/memberlist.do")) {

			List<Member> memberList = mDAO.getMemberList();

			request.setAttribute("memberList", memberList);

			nextPage = "/member/memberlist.jsp";
		}else if (command.equals("/loginform.do")) {

			nextPage = "/member/loginform.jsp";
		}else if (command.equals("/login.do")) {
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");

			Member m = new Member();
			m.setId(id);
			m.setPasswd(passwd);

			Member member = mDAO.checkLogin(m);
			String name = member.getName();
			if(name != null) {
				session.setAttribute("sessionId", id);
				session.setAttribute("sessionName", name);

				System.out.println("연결성공");
				nextPage = "/main.do";
			}else {
				String error = "아이디나 비밀번호를 확인해주세요";

				request.setAttribute("error", error);
				nextPage = "/member/loginform.jsp";
			}
		}else if (command.equals("/logout.do")) {
			session.invalidate();
			nextPage = "/main.do";
		}

		//게시판
		if(command.equals("/boardlist.do")) {
			//db에서 list 가져옴
			List<NBoard> nb = nDAO.getNBoardList();
			//모델 생성
			request.setAttribute("NboardList", nb);

			nextPage = "/board/boardlist.jsp";
		}else if(command.equals("/noticeboardlist.do")) {

			nextPage = "/board/nboardlist.jsp";
		}else if(command.equals("/qaboardlist.do")) {

			nextPage = "/board/qaboardlist.jsp";
		}else if(command.equals("/reviewboardlist.do")) {

			nextPage = "/board/rvboardlist.jsp";
		}else if(command.equals("/nwriteform.do")) {

			nextPage = "/board/nwriteform.jsp";
		}else if(command.equals("/write.do")) {
			String ntitle = request.getParameter("ntitle");
			String ncontent = request.getParameter("ncontent");

			//세션 가져오기
			String id = (String)session.getAttribute("sessionId");

			//db에 저장
			NBoard nb = new NBoard();
			nb.setNtitle(ntitle);
			nb.setNcontent(ncontent);
			nb.setNname(id);

			nDAO.nWrite(nb);

			nextPage = "/noticeboardlist.do";
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
		
		//상품
		if(command.equals("/productlist.do")) {
			List<ProductVO> productList = pDAO.getProductList();
			request.setAttribute("productList", productList);
			nextPage = "/product/productlist.jsp";
		}else if(command.equals("/insertproduct.do")) {
			int pno = Integer.parseInt(request.getParameter("pno"));
			String pname = request.getParameter("pname");
			int price = Integer.parseInt(request.getParameter("price"));
			String pcontent = request.getParameter("pcontent");
			String category = request.getParameter("category");

			ProductVO p = new ProductVO();
			p.setPno(pno);
			p.setPname(pname);
			p.setPrice(price);
			p.setPcontent(pcontent);
			p.setCategory(category);

			pDAO.insertProduct(p);

			nextPage = "/productlist.do";
		}else if(command.equals("/deleteproduct.do")) {
			int pno = Integer.parseInt(request.getParameter("pno"));
			pDAO.deleteproduct(pno);

			nextPage = "/product/productlist.jsp";
		}else if(command.equals("/updateproduct.do")) {
			nextPage = "/product/productlist.jsp";
		}else if(command.equals("/productlistbycategory.do")) {
			String category = request.getParameter("category");
			List<ProductVO> productList = pDAO.getProductListCategory(category);

			nextPage = "/product/productlist.jsp";
		}


		RequestDispatcher dpc = request.getRequestDispatcher(nextPage);
		dpc.forward(request, response);

	}	
}
