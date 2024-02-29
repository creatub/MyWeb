<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bbs.model.*"%>
<%@ page errorPage="/error.jsp" %>
<!-- 에러가 발생하면 error.jsp 페이지에서 처리하겠다는 설정 -->
<%
	//1. post방식일 때 한글처리
	//request.setCharacterEncoding("utf-8"); //==>한글 처리 Filter를 만들어 사용하자
	//2. 사용자가 입력한 값 받기
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content =  request.getParameter("content");
	System.out.println(title+"/"+writer+"/"+content);
	//3. 유효성 체크
	if(title==null||title.trim().isBlank()||writer==null||writer.trim().isBlank()){
		response.sendRedirect("input.jsp");
		return;
	}
	//4. 2번에서 받은 값 BbsVO객체에 담아주기
	BbsVO vo = new BbsVO(0,title, writer, content,null);
	//5. BbsDAO의 insertBbs(BbsVO vo객체)
	BbsDAO dao = new BbsDAO();
	int n = dao.insertBbs(vo); // jsp는 try catch해줄 필요 없다
	//6. 그 결과 메시지, 이동경로 처리
	String msg = (n>0)?"글쓰기 성공":"글쓰기 실패";
	String loc = (n>0)?"list.jsp":"javascript:history.back()";

%>

<script>
	alert('<%=msg%>');
	location.href='<%=loc%>';
</script>