<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>welcome.jsp</h1>
<h1 style="color:red"><%=request.getAttribute("msg")%></h1>


<h1 style="color:blue"><%=session.getAttribute("msg")%></h1>