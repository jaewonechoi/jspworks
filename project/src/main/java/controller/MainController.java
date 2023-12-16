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

import board.NBoard;
import board.NoticeBoardDAO;
import board.QABoard;
import board.QABoardDAO;
import board.RBoard;
import board.ReviewBoardDAO;
import member.Member;
import member.MemberDAO;
import product.ProductDAO;
import product.ProductVO;

@WebServlet("*.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 113L;
	MemberDAO mDAO;
	NoticeBoardDAO nDAO;
	QABoardDAO qDAO;
	ReviewBoardDAO rDAO;
	ProductDAO pDAO;

	public MainController() {
		mDAO = new MemberDAO();
		nDAO = new NoticeBoardDAO();
		qDAO = new QABoardDAO();
		rDAO = new ReviewBoardDAO();
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
		
		//세션 발급
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
		if(command.equals("/boardlist.do")) {				//전체 게시판 페이지

			nextPage = "/board/boardlist.jsp";
		}else if(command.equals("/noticeboardlist.do")) {	//공지사항 게시판 목록
			List<NBoard> nb = nDAO.getNBoardList();
			
			request.setAttribute("nboardList", nb);
			nextPage = "/board/noticeboardlist.jsp";
		}else if(command.equals("/qaboardlist.do")) {		//Q&A 게시판 목록
			List<QABoard> qab = qDAO.getQABoardList();
			
			request.setAttribute("qaboardList", qab);
			
			nextPage = "/board/qaboardlist.jsp";
		}else if(command.equals("/reviewboardlist.do")) {	//리뷰 게시판 목록
			List<RBoard> rb = rDAO.getRBoardList();
			
			request.setAttribute("rboardList", rb);
			
			nextPage = "/board/reviewboardlist.jsp";
		}else if(command.equals("/noticewriteform.do")) {	//공지사항 글쓰기 페이지
			
			nextPage = "/board/noticewriteform.jsp";
		}else if(command.equals("/noticewrite.do")) {		//공지사항 글쓰기 처리영역
			String ntitle = request.getParameter("ntitle");
			String ncontent = request.getParameter("ncontent");
			//세션 가져오기
			//String id = (String)session.getAttribute("sessionId");

			//db에 저장
			NBoard nb = new NBoard();
			nb.setNtitle(ntitle);
			nb.setNcontent(ncontent);

			nDAO.nWrite(nb);

			nextPage = "/noticeboardlist.do";
		}else if(command.equals("/noticeboardview.do")) {		//공지사항 글 상세보기
			int nno = Integer.parseInt(request.getParameter("nno"));
			
			NBoard nboard = nDAO.getNBoard(nno);
			
			request.setAttribute("nboard", nboard);
			
			nextPage = "/board/noticeboardview.jsp";
		}else if(command.equals("/qawriteform.do")) {			//Q&A 글쓰기 페이지
			
			nextPage = "/board/qawriteform.jsp";
		}else if(command.equals("/qaboardwrite.do")) {			//Q&A 글쓰기 처리영역
			String qtitle = request.getParameter("qtitle");
			String qcontent = request.getParameter("qcontent");
			//세션 가져오기
			String id = (String)session.getAttribute("sessionId");

			//db에 저장
			QABoard qab = new QABoard();
			qab.setQtitle(qtitle);
			qab.setQcontent(qcontent);
			qab.setId(id);

			qDAO.qaWrite(qab);
			
			nextPage = "/qaboardlist.do";
		}else if(command.equals("/qaboardview.do")) {			//Q&A 글 상세보기
			//글 제목에서 글 번호 받기
			int qno = Integer.parseInt(request.getParameter("qno"));
			//글 상세보기 처리
			QABoard qab = qDAO.getQABoard(qno);
			//모델 생성후 뷰페이지로 보내기
			request.setAttribute("qab", qab);
			
			nextPage = "/board/qaboardview.jsp";
		}else if(command.equals("/deleteqaboard.do")) {
			int qno = Integer.parseInt(request.getParameter("qno"));
			
			//삭제 처리 메서드 실행
			qDAO.deleteQABoard(qno);
			
			nextPage = "/qaboardlist.do";
		}else if(command.equals("/updateqaboardform.do")) {
			
			nextPage = "/board/qaupdateboardform.jsp";
		}else if(command.equals("/updateqaboard.do")) {
			
			nextPage = "/qaboardlist.do";
		}else if(command.equals("/reviewwriteform.do")) {
			
			nextPage = "/board/reviewwriteform.jsp";
		}else if(command.equals("/reviewwrite.do")) {
			String rtitle = request.getParameter("rtitle");
			String rcontent = request.getParameter("rcontent");
			
			String id = (String)session.getAttribute("sessionId");
			
			RBoard rb = new RBoard();
			rb.setRtitle(rtitle);
			rb.setRcontent(rcontent);
			rb.setId(id);
			
			rDAO.rWrite(rb);
			
			nextPage = "/reviewboardlist.do";
		}else if(command.equals("/reviewboardview.do")) {
			int rno = Integer.parseInt(request.getParameter("rno"));
			RBoard rb = rDAO.getRBoard(rno);
			
			request.setAttribute("rboardList", rb);
			
			nextPage = "/board/reviewboardview.jsp";
		}else if(command.equals("/updatereviewboardform.do")) {
			
			nextPage = "/board/updatereviewboardform.jsp";
		}else if(command.equals("/deletereviewboard.do")) {
			
			int rno = Integer.parseInt(request.getParameter("rno"));
			
			rDAO.deleteRBoard(rno);
			
			nextPage = "/reviewboardlist.do";
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

		if(command.equals("/noticewrite.do")) {
			response.sendRedirect("/noticeboardlist.do");
		}else if(command.equals("/qaboardwrite.do")) {
			response.sendRedirect("qaboardlist.do");
		}else if(command.equals("/reviewwrite.do")) {
			response.sendRedirect("/reviewboardlist.do");
		}else {
			RequestDispatcher dpc = request.getRequestDispatcher(nextPage);
			dpc.forward(request, response);
		}
	}	
}
