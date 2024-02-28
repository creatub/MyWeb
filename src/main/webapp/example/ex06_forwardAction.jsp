<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>ex06_forwardAction 페이지 입니다</h2>
<p>
	forward 액션태그를 이용해 ex01.jsp페이지로 이동할 예정입니다 <br>
	
	서버 내부에서 페이지 이동을 한다. 따라서 브라우저는 이동한 페이지의 url이 아니라
	이전 페이지의 url을 유지한다
	
</p>
<hr color ="red">
<jsp:forward page="ex01.jsp" />

<%--
	RequestDispatcher disp = request.getRequestDispatcher("ex01.jsp");
	disp.forward(request,response);
	와 동일
	==> 페이지를 이동시킨다
--%>