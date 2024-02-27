package member.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberDAO;
import member.model.MemberVO;

/**
 * Servlet implementation class MemberUpdateEndServlet
 */
@WebServlet("/MemberUpdateEnd")
public class MemberUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		//0. post방식의 한글 처리
		req.setCharacterEncoding("utf-8");
		//1. id,name,tel,pw 값 받기
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");
		String pw = req.getParameter("pw");
		//2. 유효성 체크 => sendRedirect()이용 => member/mypage.html
		if(id==null||id.trim().isEmpty()||name==null||name.trim().isBlank()||tel==null||tel.trim().isBlank()||pw==null||pw.trim().isBlank()) {
			res.sendRedirect("member/mypage.html");
			return;
		}
		//3. MemberVO객체에 1번에서 받은 값 넣어주기
		MemberVO user = new MemberVO(id, pw, name, tel, null);
		//4. MemberDAO의 updateMember(vo객체) 호출
		MemberDAO userDao = new MemberDAO();
		try {
			int n  = userDao.updateMember(user);
			
			//5. 그 결과 메시지 및 이동경로 지정
			String msg = (n>0)?"회원정보 수정 완료":"회원정보 실패";
			String loc = (n>0)?"member/mypage.html":"javascript:history.go(-1)";
			
			out.println("<script>");
			out.println("alert('"+msg+"')");
			out.println("location.href='"+loc+"'");
			out.println("</script>");
			
		} catch (SQLException e) {
			throw new ServletException(e); // 브라우저에 스택기록 출력
//			out.println("<b>서버 에러: "+e.getMessage());
//			e.printStackTrace();
		}
		
		out.close();
	} //doPost

}
