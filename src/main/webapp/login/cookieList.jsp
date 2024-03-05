<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/inc/top.jsp" />
<div class="container">
	<h1>쿠키 목록</h1>
	<%
	/*쿠키가 전송되면 웹브라우저는 저장된 쿠키를
	매번 서버에 요청을 보낼때 마다 가지고 간다.
	그러면 웹서버는 브라우저가 전송한 쿠키를
	이용해서 필요한 작업을 수행한다.*/
		Cookie[] cks = request.getCookies();
		if(cks!=null){
			for(Cookie ck : cks){
				String key = ck.getName();//쿠키 키값을 반환
				String val = ck.getValue();//쿠키 밸류값을 반환
				%>
				<h3><%=key %> ==> <%=val %></h3>
				<%
			}
		}
	%>
</div>
<jsp:include page="/inc/foot.jsp" />