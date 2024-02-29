<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.*"%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	if(id==null||pw==null||id.trim().isBlank()||pw.trim().isBlank()){
		response.sendRedirect("login.jsp");
		return;
	}
	
	MemberDAO userDao = new MemberDAO();
	int result=userDao.loginCheck(id, pw);
	if(result>0){
		//회원인증 성공 시 세션에 id 저장
		//session 내장객체: HttpSession타입
		session.setAttribute("loginId", id);
		//하나의 브라우저 사용하는 동안 또는 세션 타임아웃(30분) 되기 전까지
		//세션에 저장한 정보는 계속 유지된다
	}
	
	
	
	String msg=(result>0)?"환영합니다!! "+id+"님~":"아이디 또는 비밀번호가 일치하지 않습니다.";
	String loc=(result>0)?"../index.jsp":"javascript:history.back()";    
%>
<script>
	alert('<%=msg%>');
	location.href='<%=loc%>';
</script>