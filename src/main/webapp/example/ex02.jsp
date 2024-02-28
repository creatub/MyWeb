<%@ page contentType = "text/html; charset = utf-8" pageEncoding="utf-8" import="java.util.*,java.text.*"%>
<h1>반복문 이용해서 오늘 날짜를 5번 출력하세요</h1>


<hr color = "red">
<%
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//년월일 시분초

	for(int i =0 ; i<5; i++){
%>
	<h2>오늘 날짜: <%=sdf.format(today)%></h2>
<%
	}//for---------
%>
<hr color = "blue">
<h2>구구단을 테이블 형태로 출력하세요</h2>
<table border="1" style="width:200px">
<%for(int i = 1; i<10; i++){ %>
	<tr>
	<%for(int j = 1; j<10; j++){ %>
		<td style="text-align:center"><%=j%>x<%=i%>=<%=i*j%></td>
	<%}// for()----- %>
	</tr>
<%}//for()------ %>

</table>