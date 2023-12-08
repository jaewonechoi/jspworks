package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.Board;
import board.BoardDAO;
import member.Member;
import member.MemberDAO;
import reply.Reply;
import reply.ReplyDAO;

@WebServlet("*.do")	// '/'이하의 경로에서 do로 끝나는 확장자는 모두 허용
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 10L;
	//필드
    MemberDAO mDAO;
    BoardDAO bDAO;
    ReplyDAO rDAO;
	
    public MainController() {	//생성자
        mDAO = new MemberDAO();
        bDAO = new BoardDAO();
        rDAO = new ReplyDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 인코딩
		request.setCharacterEncoding("UTF-8");
		
		//응답할 컨텐츠 유형
		response.setContentType("text/html; charset=UTF-8");
		
		//경로 설정
		//uri - 컨텍스트(/) + 파일(.do)
		String uri = request.getRequestURI();
		System.out.println(uri);
		//command 패턴
		String command = uri.substring(uri.lastIndexOf("/"));
		System.out.println(command);
		//이동 페이지
		String nextPage = "";
		//세션 객체 생성
		HttpSession session = request.getSession();
		
		if(command.equals("/main.do")) {
			//메인 페이지에 보드로 보내기
			List<Board> boardList = bDAO.getBoardList(); 
			System.out.println(boardList.size() + "개");
			
			if(boardList.size() >= 3) {
				//게시글 3개를 저장할 배열 생성
				Board[] newboards = {boardList.get(0), boardList.get(1), boardList.get(2)};
				
				request.setAttribute("boardList", newboards);
			}
			
			nextPage = "/main.jsp";
		}else if(command.equals("/memberlist.do")) {
			//회원정보를 db에서 가져옴
			List<Member> memberList = mDAO.getMemberList();
			//모델 생성
			request.setAttribute("memberList", memberList);
			//이동할 페이지
			nextPage = "/member/memberlist.jsp";
		}else if(command.equals("/joinform.do")) {
			//get 방식
			nextPage = "/member/joinform.jsp";
		}else if(command.equals("/insertmember.do")) {
			//빈 회원 객체를 생성해서 데이터를 받아서 세팅
			//폼 데이터 받기
			String id =request.getParameter("id");
			String passwd =request.getParameter("passwd");
			String name =request.getParameter("name");
			String email =request.getParameter("email");
			String gender =request.getParameter("gender");
			//객체에 데이터 세팅
			Member member = new Member();
			member.setId(id);
			member.setPasswd(passwd);
			member.setName(name);
			member.setEmail(email);
			member.setGender(gender);
			//db에 저장함
			mDAO.insertMember(member);
			
			nextPage = "/index.jsp";
		}else if(command.equals("/memberview.do")) {
			String id = request.getParameter("id");
			
			Member member = mDAO.getMember(id);
			
			//모델 생성
			request.setAttribute("member", member);
			
			nextPage = "/member/memberview.jsp";
		}else if(command.equals("/loginform.do")) {	//로그인 폼 페이지 이동
			nextPage = "/member/loginform.jsp";
		}else if(command.equals("/login.do")) {	//로그인 처리
			
			//view에 출력 객체 생성
			PrintWriter out = response.getWriter();
			
			//아이디와 비밀번호 파라미터 받기
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			
			Member m = new Member();
			m.setId(id);
			m.setPasswd(passwd);
			
			boolean result = mDAO.checkLogin(m);
			
			if(result) {
				session.setAttribute("sessionId", id);
				//로그인 후 페이지 이동
				nextPage = "/index.jsp";
			}else {
				//에러 모델로 보내기
				String error = "아이디나 비밀번호를 다시 확인해주세요";
				request.setAttribute("error", error);
				//에러 발생후 페이지 이동
				nextPage = "member/loginform.jsp";
			}
		}else if(command.equals("/logout.do")) {
			session.invalidate();
			nextPage = "/index.jsp";
		}
		
		//게시판
		if(command.equals("/boardlist.do")) {
			//페이지 처리
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null) {	//페이지 번호를 클릭하지 않았을때 기본값
				pageNum = "1";
			}
			//현재 페이지
			int currentPage = Integer.parseInt(pageNum);
			//페이지당 게시글 수 - 10(pageSize)
			int pageSize = 10;
			//1페이지의 첫번째 행(startRow) : 1페이지 : 1,  2페이지 : 11, 3페이지 : 21
			int startRow = (currentPage - 1) * pageSize + 1;
			System.out.println("페이지 첫행: " + startRow);
			
			//시작페이지(startPage) - 12번 - 2페이지, 22번 - 3페이지
			int startPage = startRow / pageSize + 1;
			
			//종료(끝) 페이지 : 게시글 총수 / 페이지당 개수
			int totalRow = bDAO.getBoardCount();
			int endPage = totalRow / pageSize;			
			//페이지당 개수(10)로 나누어 떨어지지 않는 경구 코딩
			endPage = (totalRow % pageSize == 0) ? endPage : endPage + 1;
			//System.out.println("총 게시글 수: " + totalRow);
			//System.out.println("마지막 페이지: " + endPage);
			
			//검색 처리
			String _field = request.getParameter("field");
			String _kw = request.getParameter("kw");
			
			String field = "";
			String kw = "";
			
			//null 처리
			if(_field != null) { //필드값이 있는 경우
				field = _field;
			}else {	//필드값이 없는 경우(디폴트)
				field = "title";
			}
			
			if(_kw != null) { //검색어가 있는 경우
				kw = _kw;
			}else { //검색어가 없는 경우
				kw = ""; 
			}
				
			//페이지 처리 목록 메서드 호출
			//List<Board> boardList = bDAO.getBoardList(currentPage);
			//검색 처리
			//List<Board> boardList = bDAO.getBoardList(field, kw);
			//페이지와 검색 처리
			List<Board> boardList = bDAO.getBoardList(field, kw, currentPage);
			
			//모델로 생성
			request.setAttribute("boardList", boardList);
			request.setAttribute("page", currentPage);	  //현재 페이지
			request.setAttribute("startPage", startPage); //시작 페이지
			request.setAttribute("endPage", endPage);	  //종료 페이지
			request.setAttribute("field", field);		//필드
			request.setAttribute("kw", kw);		//검색어
			
			nextPage = "/board/boardlist.jsp";
		}else if(command.equals("/writeform.do")) {
			nextPage = "/board/writeform.jsp";
		}else if(command.equals("/write.do")) {
			//폼 데이터 받기
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			//세션 가져오기
			String id = (String)session.getAttribute("sessionId");
			//db에 저장
			Board b = new Board();
			b.setTitle(title);
			b.setContent(content);
			b.setId(id);
			//write 메서드 실행
			bDAO.write(b);
		}else if(command.equals("/boardview.do")) {
			//글제목에서 요청한 글 번호 받기
			int bno = Integer.parseInt(request.getParameter("bno"));
			//글 상세보기 처리
			Board board = bDAO.getBoard(bno);
			
			//댓글 목록 보기
			List<Reply> replyList = rDAO.getReplyList(bno);
			
			//모델 생성해서 뷰로 보내기
			request.setAttribute("board", board);
			request.setAttribute("replyList", replyList);
			
			nextPage = "/board/boardview.jsp";
		}else if(command.equals("/deleteboard.do")) {
			int bno = Integer.parseInt(request.getParameter("bno"));
			//삭제 처리
			bDAO.deleteboard(bno);
			
			nextPage = "/boardlist.do";
		}else if(command.equals("/updateBoardform.do")) {
			//수정을 위해서 게시글 가져오기
			int bno = Integer.parseInt(request.getParameter("bno"));
			//게시글 1건 가져오기
			Board board = bDAO.getBoard(bno);
			//모델 생성
			request.setAttribute("board", board);
			
			nextPage = "/board/updateBoardform.jsp";
		}else if(command.equals("/updateboard.do")) {
			//게시글 제목, 내용을 파라미터로 받음
			int bno = Integer.parseInt(request.getParameter("bno"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			//수정 처리 메서드
			Board b = new Board();
			b.setTitle(title);
			b.setContent(content);
			b.setBno(bno);
			
			bDAO.updateboard(b);
			
			nextPage = "/boardlist.do";
		}
		
		//댓글
		if(command.equals("/insertreply.do")) {
			//댓글 폼 데이터 받기
			int bno = Integer.parseInt(request.getParameter("bno"));
			String rcontent = request.getParameter("rcontent");
			String replyer = request.getParameter("replyer");
			
			//댓글 등록 처리
			Reply r = new Reply();
			r.setBno(bno);
			r.setRcontent(rcontent);
			r.setReplyer(replyer);
			
			rDAO.insertreply(r);
		}else if(command.equals("/deletereply.do")) {
			int rno = Integer.parseInt(request.getParameter("rno"));
			//삭제 처리 메서드 호출
			rDAO.deletereply(rno);
		}
		
		//redirect와 forword 구분하기
		//새로고침하면 게시글, 댓글 중복 생성 문제 해결
		if(command.equals("/write.do") || command.equals("/updateboard.do")) {
			response.sendRedirect("/boardlist.do");
		}else if(command.equals("/insertreply.do") || command.equals("/deletereply.do")) {
			int bno = Integer.parseInt(request.getParameter("bno"));
			response.sendRedirect("/boardview.do?bno=" + bno);
		}else {
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}
	}

}
