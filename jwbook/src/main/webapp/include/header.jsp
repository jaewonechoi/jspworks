<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 파일을 include(합칠때) 불필요한부분 html,head,body 생략가능 -->
<!-- 선언문 태그 -->
<%!
	//전역 변수
	int pageCount = 0;

	//자바 함수 정의
	void addCount(){
		pageCount++;
	}
%>

<%
	//함수 호출
	addCount();
%>
<p>이 사이트 방문은 <%=pageCount %>번째 입니다.</p>
