<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>ex04_includeDirective.jsp 페이지 입니다</h1>

<p>
	include 디렉티브를 이용해서 ex03_gugudan.jsp 페이지를 아래에 포함시킵니다
	<br>
	include 지시어는 다른 파일(ex03_gugudan.jsp)의 소스코드를 현재 위치에
	삽입한 후, jsp파일을 servlet으로 변환하고 컴파일하는 방식입니다
</p>
<hr color="red">
<!-- 구구단 페이지를 포함 (소스코드까지 포함됨) -->
<%@include file="ex03_gugudan.jsp" %>
<hr color="blue">
<%@include file="ex01.jsp"%>
<%
	//String a= "지역변수";//error ex01.jsp에 int a = 10; 변수 선언되어 있음
	String astr = "지역변수";
	out.println("astr: "+astr+"<br>");
	out.println("str: "+str+"<br>");
%>
<%=a%>
<%=b%>
<%=str%>