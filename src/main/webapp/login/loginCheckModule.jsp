<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인 여부를 체크하는 모듈. 세션에 저장된 loginId를 꺼내서 해당 값이 null이라면 return 시킨다 -->

<%
	String loginId=(String)session.getAttribute("loginId");
	if(loginId==null){
		%>
		<script>
			alert('로그인 해야 이용 가능합니다');
			location.href="<%=request.getContextPath()%>/login/login.jsp";
		</script>
		<%
		return;
	}
%>
