package member.servlet;
// Servlet은 처음 만들면 서버 재시작해줘야 함
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberDAO;

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/MemberDelete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
	throws ServletException, IOException{
		doGet(req,res);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();//2byte기반 출력 스트림
		//ServletOutputStream sos = res.getOutputStream(); // 1byte 기반 : 다운로드 받을 때 씀
		req.setCharacterEncoding("utf-8");
		String uid = req.getParameter("id"); // form.html에 있는 id
		
		out.println("<b>"+uid+"</b><br>");//브라우저에 출력
		System.out.println("uid: "+uid);//톰캣 콘솔에 출력
		
		//유효성 체크
		if(uid==null||uid.trim().isEmpty()) {
			res.sendRedirect("member/mypage.html");
			//페이지를 이동시킴 ==> 브라우저의 url을 member/mypage.html
			//로 변경해서 서버에 새롭게 요청을 보내는 방식으로 페이지를 이동한다.
//			out.println("<script>");
//			out.println("alert('아이디를 입력하세요')");
//			out.println("history.back();");//뒤로가기
//			out.println("</script>");
			
			return;
		}
		//MemberDAO 객체 생성
		MemberDAO user = new MemberDAO();
		try {
			int n = user.deleteMember(uid);
			String msg = (n>0) ? "회원탈퇴가 완료되었습니다":"회원탈퇴 실패-아이디를 확인하세요";
			String loc = (n>0) ? "index.html":"javascript:history.back()";
			out.println("<script>");
			out.println("alert('"+msg+"')");
			out.println("location.href='"+loc+"'");
			out.println("</script>");
		} catch (SQLException e) {
			out.println("<script>");
			out.println("alert('아이디가 없거나 서버에러입니다.')");
			out.println("history.back();");
			out.println("</script>");
			e.printStackTrace();
		}
		out.close();
	}//doGet

}

