<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>ex07_request.jsp</h1>

<%
/* request 내장객체: HttpServletRequest 타입
	<1> 단일값을 받을 경우
		- String getParameter("파라미터명")
	<2> 다중값을 받을 경우
		- String[] getParameterValues("파라미터명")
	
*/
//(1) 성별, 직업 값을 받아서 출력하세요
String gender = request.getParameter("gender");
String job = request.getParameter("job");

//(2) 취미, 언어 값들을 받아서 출력하세요
String[] hobbies = request.getParameterValues("hobby");
String[] langs = request.getParameterValues("lang");

%>

<br />
성별 : <%=(gender.equals("F"))?"여성":"남성"%>
<br />
직업 : <%=job%>
<br />
취미 :
<%
	if(hobbies!=null){
		for(String hobby:hobbies){
			out.println(hobby+", ");
		}
	}
%>
<br />
<h3>언어 : 
<%
	if(langs!=null){
		for(String lang:langs){
			out.println(lang+", ");
		}
	}
%>
</h3>
<hr color="blue">
http://localhost:9090/MyWeb/example/ex07_request.jsp?gender=F&hobby=reading&job=Backend&lang=HTML&lang=JavaScript&lang=Java
<%
	String server = request.getServerName();//호슽명
	int port = request.getServerPort();//포트번호
	StringBuffer url = request.getRequestURL();//url정보 반환
	String uri = request.getRequestURI();//url정보 반환
	
	String queryStr = request.getQueryString();//query string
	String ctx = request.getContextPath();//컨택스트명 "/MyWeb"
	
	String protocol = request.getProtocol();//프로토콜
	String cip = request.getRemoteAddr();
%>
<h3>호스트명: <%=server %></h3>
<h3>서버 포트번호: <%=port %></h3>
<h3>요청 url: <%=url %></h3>
<h3>요청 uri: <%=uri %></h3>
<h3>쿼리스트링: <%=queryStr %></h3>
<h3>컨텍스트명: <%=ctx%></h3>
<h3>프로토콜: <%=protocol%></h3>
<h3>클의 ip: <%=cip%></h3>
<h3>컨텍스트명 이후의 경로: <%=request.getServletPath()%></h3>
<hr color = "orange">

[문제1] 요청 URI 중에서 /MyWeb/example/ex07_request.jsp
==> /example/ex07_request.jsp 정보만 추출해서 브라우저에 출력하세요
<br/>
<%
	String ans = uri.substring(ctx.length());
%>
<h3><%=ans %></h3>
[문제2] /example/ex07_request.jsp 에서 확장자를 제외한
"/example/ex07_request" 정보만 추출해서 출력하세요
<br>
<%
	int idx = ans.lastIndexOf(".jsp");
	//검색한 문자열이 없으면 -1을 반환
	System.out.println("idx: "+idx);
	if(idx!=-1){
		ans = ans.substring(0, idx);
	}

	//String[] str = ans.split("\\.");
	//out.println(str[0]);
%>

<h3><%=ans %></h3>
