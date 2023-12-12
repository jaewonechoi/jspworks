package fileup_down;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/cos")
public class CosFileUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 인코딩
		request.setCharacterEncoding("UTF-8");
		
		//브라우저로 응답 컨텐트 형식
		response.setContentType("text/html; charset=UTF-8");
		
		//브라우저 데이터 출력
		PrintWriter out = response.getWriter();
		
		String realFolder = "C:\\jspworks\\jwbook2\\src\\main\\webapp\\upload";
		int maxSize = 10*1024*1024;	//10MB
		String encType = "UTF-8";	//파일이름 한글 인코딩
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, policy);
		
		//일반 name 속성
		String comment = multi.getParameter("comment");
		out.println("설명: " + comment);
		
		//file 파라미터 추출
		Enumeration<?> files = multi.getFileNames();
		
		while(files.hasMoreElements()) {	//파일이름이 있는동안 반복
			String userFilename =  (String)files.nextElement();
		
			//원본 파일 이름
			String originalFilename = multi.getOriginalFileName(userFilename);
			if(originalFilename != null) {
				out.println("원본 파일: " + originalFilename + "<br>");
				//실제 저장될 이름
				String fileSystemname = multi.getFilesystemName(userFilename);
				out.println("실제 파일: " + fileSystemname + "<br>");
				out.println("<a href=cosdown.do?filename=" + fileSystemname + ">다운로드</a><br>");
				
				//file 객체 생성
				File userFile = multi.getFile(userFilename);
				
				//파일의 크기
				long fileSize = userFile.length();
				
				//파일의 크기와 타입 출력
				if(fileSize > 0) {
					out.println("크기: " + fileSize + "B<br>");
					out.println("유형: " + multi.getContentType(userFilename) + "<br>");
					out.println("<p>===================================================</p>");
					
				}
			}
		}
	}
}
