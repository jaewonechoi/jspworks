<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//Http 헤더 정보값 출력
	String hostValue = request.getHeader("host");
	String alValue = request.getHeader("accept-language");
	

	//out.println("호스트명: " + hostValue + "<br>");
	//out.println("설정언어: " + alValue + "<br>");
	
	//반복자 객체 얻기
	Enumeration<String> en = request.getHeaderNames();
	while(en.hasMoreElements()){
		//헤더 이름 얻기(키값)
		String headerName = en.nextElement();
		String headerValue = request.getHeader(headerName);
		
		out.println(headerName + ": " + headerValue + "<br>");
	}
%>