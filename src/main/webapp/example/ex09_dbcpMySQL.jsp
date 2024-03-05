<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, javax.sql.*, javax.naming.*" %>
<jsp:include page="/inc/top.jsp" />

<div class ="container">
	<h1>DBCP Test - MySQL</h1>
<%
	//JNDI : Java Naming and Directory Interface
	//DBUtil.getCon()을 대체!!
	Context ctx = new InitialContext(); // 리소스를 이름으로 찾아 사용할 수 있도록 하는 api
	Context ctxWas = (Context) ctx.lookup("java:comp/env"); // tomcat을 먼저 찾음 object Type을 반환
	DataSource ds = (DataSource)ctxWas.lookup("jdbc/mysql");// dbcp 찾는다
	out.println("ds: "+ds+"<br>");
	Connection con = ds.getConnection();
	out.println("con: "+con+"<br>");
	
	if(con!=null) con.close(); // 연결을 끊는 것이 아니라 커넥션 풀에 반납을 한다.
%>

</div>

<jsp:include page="/inc/foot.jsp" />