package my.com;
import javax.servlet.*; // apache-tomcat-9.0.86/lib/servlet-api.jar
						//							jsp-api.jar
import javax.servlet.http.*;
import java.io.*;
// [1] Servlet이 되기 위해서는 HttpServlet을 상속받는 클래스를 작성
// [2] 메서드를 오버라이드 한다
//	- doGet(), doPost(), doDelete(), doPut(),.....
// [3] 작성한 서블릿을 "컨텍스트/WEB-INF/web.xml"에 등록하거나, 아니면 어노테이션을 이용해 등록한다
// Servlet : Server Side Applet
// - 서버쪽에서 실행되는 프로그램.
// - DB관련 로직 처리를 하고 동적으로 HTML을 생성해준다.

public class HelloServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	throws ServletException, IOException
	{
		//응답 보낼 문서의 컨텐트 타입을 지정하자
		// response가 브라우저와 연결되어있다. 내가 보내는 문서가 html문서라는 걸 응답한다.
		res.setContentType("text/html; charset=UTF-8");
		// res ==> 브라우저와 연결된 객체 ==> 브라우저에 html을 쓰기 위한 스트림을 얻자
		PrintWriter pw = res.getWriter();
		pw.println("<html>");
		pw.println("<head><title>hello servlet</title></head>");
		pw.println("<body>");
		pw.println("<h1>Hello Servlet~~</h1>");
		pw.println("<h2>안녕 서블릿?</h2>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}//doGet()-------------------------
	
}////////////////////////////////////
