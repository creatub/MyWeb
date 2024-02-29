<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/inc/top.jsp" />

<div class="container">
	<h1>Login</h1>
	<br><br>
	<form name="loginF" method="post" action="loginEnd.jsp">
	<table border="1" style="width:60%;margin:auto">
		<tr>
			<th width="20%">아이디</th>
			<td>
			<input type="text" name="id" required><!-- required하면 유효성 체크 안해도 입력안하면 alert -->
			</td>
		</tr>
		<tr>
			<th width="20%">패스워드</th>
			<td>
			<input type="text" name="pw" required>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center">
				<label for="saveId">
					<input type="checkbox" name="saveId" id="saveId" style="width:10%">아이디 저장
				</label>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button>로그인</button>
			</td>
	</table>
	</form>
</div>



<jsp:include page="/inc/foot.jsp" />