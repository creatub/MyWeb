<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ex03_gugudan.jsp -->
<style>
	table{
		width: 80%;
		margin: 3em auto;
	}
</style>
<h1>구구단 전체를 테이블 형태로 출력하세요</h1>
<table border="1" style="width:200px">
<%for(int i = 0; i<10; i++){ %>
	<tr>
	<%for(int j = 1; j<10; j++){
		if(i==0){
		%>
			<td style="text-align:center"><%=j%>단</td>
		<%}else{ %>
		<td style="text-align:center"><%=j%>x<%=i%>=<%=i*j%></td>
		<%} %>
	<%}// for()----- %>
	</tr>
<%}//for()------ %>

</table>