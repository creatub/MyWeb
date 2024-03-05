<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/inc/top.jsp" />
<div class="container">
	<h1>Session Test</h1>
	<h2 style="color:red">JSessionId: <%=session.getId() %></h2>
	<hr color="blue">
	<h2>세션에 저장된 모든 변수를 출력해보자</h2>
	<%
		//서블릿의 경우 : HttpSession session=request.getSession();
		//JSP 경우: 내장객체 => session
		java.util.Enumeration<String> en = session.getAttributeNames();
		
		while(en.hasMoreElements()){
			String key = en.nextElement();
			Object val=session.getAttribute(key);
			%>
			<h3><%=key %> ==> <%=val %></h3>
			<%
		}
	%>
</div>
<jsp:include page="/inc/foot.jsp" />