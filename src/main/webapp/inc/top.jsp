<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//컨텍스트명 구하기 
String ctx = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyWeb</title>
	<link rel="stylesheet" type="text/css" href="<%=ctx%>/css/style.css">
</head>
<body>
	<div class="wrap">
		<header>
			<!-- top menu -->
			<ul class="topMenu">
				<li><a href="<%=ctx%>/index.jsp">Home</a></li>
				<li><a href="">로그인</a></li>
				<li><a href="">로그아웃</a></li>
				<li><a href="<%=ctx%>/member/join.jsp">회원가입</a></li>
				<li><a href="<%=ctx%>/board/input.jsp">게시판 글쓰기</a></li>
				<li><a href="<%=ctx%>/board/list.jsp">게시판 글목록</a></li>
			</ul>
		</header>