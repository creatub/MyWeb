<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/inc/top.jsp" />
<div class="container">
	<form name="mf" method="post" action="../Signup">
		<table border="1" style="width:80%; margin:auto">
			<tr>
				<th colspan="2">Signup-회원가입</th>
			</tr>
			<tr>
				<th>
					이   름
				</th>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<th>
					아 이 디
				</th>
				<td>
					<input type="text" name="id">
				</td>
			</tr>
			<tr>
				<th>
					비밀번호
				</th>
				<td>
					<input type="password" name="pw">
				</td>
			</tr>
			<tr>
				<th>
					연 락 처
				</th>
				<td>
					<input type="text" name="tel">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<button>회원가입</button>
				<button type="reset">다시쓰기</button>
				</td>
			</tr>
			
		</table>
	</form>
</div>



<jsp:include page="/inc/foot.jsp" />