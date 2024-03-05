<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ---------------------------------------- -->
<%@include file="/login/loginCheckModule.jsp" %>
<!-- ---------------------------------------- -->    
<jsp:include page="/inc/top.jsp" />
<div class="container">
	
	<h1>MyPage- 회원 인증 페이지</h1>
	<p style ="color:red">
		회원들만 들어올 수 있는 페이지 입니다.
		<br>
		회원 아이디 : <%=loginId %>
	</p>


</div>
<jsp:include page="/inc/foot.jsp" />