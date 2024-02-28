<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>ex08_response.jsp 페이지입니다.</h1>
<p> response객체의 주요 메서드<br>
	-sendRedirect(페이지)<br>
	-sendError(에러코드)<br>
	
</p>

<%
//1. 아이디와 비번값 받아서 브라우저에 출력하세요
	String id = request.getParameter("uid");
	String pw = request.getParameter("pwd");
	out.println("<h3>id ="+id+", pw="+pw+" </h3>");
	
//2. null값이면 ex08_form.jsp로 redirect 이동시키기
	if(id == null||pw == null){
		response.sendRedirect("ex08_form.jsp");
		return;
	}

//3. //빈문자열일 경우 잘못된 요청 에러를 출력하세요 -400
	if(id.trim().isBlank()||pw.trim().isBlank()){
		//response.sendError(400, "메시지");
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);//400
	}
//4. killer가 들어오면 접근 금지 에러를 출력하세요 -403
	if(id.equals("killer")){
		response.sendError(response.SC_FORBIDDEN, "killer는 접근 금지");//403
	}
//5.uid가 redirect라면 "welcome.jsp"로 redirect방식으로 이동시키세요
//6.uid가 forward라면 "welcome.jsp"로 forward방식으로 이동시키세요
	if(id.equals("redirect")){
		request.setAttribute("msg", id+"님 정말 환영해요");//redirect로는 전달되지 않음
		session.setAttribute("msg", id+"님 정말 환영해요");
		response.sendRedirect("welcome.jsp");
	}else if(id.equals("forward")){
		request.setAttribute("msg", id+"님 정말 환영해요");
		session.setAttribute("msg", id+"님 정말 환영해요");
%>
		<jsp:forward page="welcome.jsp" />
<%
	}

%>
