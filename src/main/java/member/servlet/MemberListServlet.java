package member.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberDAO;
import member.model.MemberVO;

/**
 * Servlet implementation class MemberListServlet
 */
@WebServlet("/MemberList")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		
//		String id = req.getParameter("id");
//		String name = req.getParameter("name");
//		String tel = req.getParameter("tel");
//		String indate = req.getParameter("date");
		
		MemberDAO userDao = new MemberDAO();
		try {
			ArrayList<MemberVO> arr = userDao.selectAll();
			req.setAttribute("userAll", arr);
			RequestDispatcher disp = req.getRequestDispatcher("member/list.jsp");//이동할 페이지 지정
			disp.forward(req, res);//forward 방식으로 이동
		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}//goGet()---------

}///////////////
