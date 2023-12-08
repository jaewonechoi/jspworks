<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류 정보 페이지</title>
</head>
<body>
   <h2>오류가 발생했습니다. 빠른 조치하겠습니다.</h2>
   <!-- %-- 오류 세부 정보 출력 --% -->
   <p><b>오류 세부 정보:</b> <%= exception.getMessage() %></p>
   %-- 여기에 추가적인 오류 정보나 스택 추적을 출력할 수 있습니다 --%
</body>
</html>