package member.servlet;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LifeCycleServlet
 */

/**
 * init() : 클라이언트 첫 요청이 있을 때 딱 한번만 호출되는 메서드
 * service(): 스레드에 의해 호출되는 메서드.
 * 		- 요청방식이 get방식이면 이 안에서 doGet()을 호출한다.
 *      -         post				doPost()
 *      -		  delete			doDelete()
 *      -		  put 				doPut()
 * destroy() : 서버가 shutdown될 때 딱 한번 호출되는 메서드.
 * 				정상종료될 때 딱 한번 호출함
 * 
 */
@WebServlet("/LifeCycle")
public class LifeCycleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	int count;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LifeCycleServlet() {
        super();
        System.out.println("LifeCycleServlet 생성자");
    }
    
    @Override
    public void init() throws ServletException {
    	super.init();
    	count = 0;
    	System.out.println("init() 호출됨...");
    }
    
    
    /**service()메소드는 스레드에 의해 호출되는 메소드다.
     * 첫 요청시 init()호출되고 난 후에 바로 service()가 호출된다.
     * 두번째 요청부터는 init()을 거치지 않고 바로 service()가 호출된다.
     * service()메소드에서는 요청 메소드를 분석해서 get방식이 요청이면 doGet()을 호출하고
     * post=> doPost(), put방식 => doPut(), delete방식=> doDelete() 등의 메소드를 호출한다.
     * String method = req.getMethod();
     * if(method.equals("GET")){
     * 		doGet(req,res);
     * }else if(method.equals("POST")){
     * 	    doPost(req,res);
     * }else if(method.equals("DELETE")){
     * 		doDelete(req,res);     * 		
     * }...
     * */
    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) 
    throws ServletException,IOException{
    	System.out.println("service() 호출됨...");
    	res.setContentType("text/html; charset=utf-8");
    	PrintWriter out = res.getWriter();
    	out.println("<h1>LifeCycleServlet</h1>");
    	count++;
    	out.println("<h2 style='color:red'>" + count + "</h2>");
    	
    	//현재 실행 중인 스레드 이름 얻기
    	Thread tr = Thread.currentThread();
    	out.println("<h2>현재 실행 중인 스레드: "+tr.getName()+"</h2>");
    	
    	//가용 메모리
    	Runtime rt = Runtime.getRuntime();
    	long memory = rt.freeMemory();
    	out.println("<h3>현재 가용 메모리: "+memory+"</h3>");
    	//count가 10을 초과하면 Garbage Collector(메모리 해제하는 역할)를 호출해보자
    	if(count>10) {
    		System.gc();
    		count=0;
    		rt = Runtime.getRuntime();
    		long memory2=rt.freeMemory();
    		out.println("<hr color='blue'>");
    		out.println("<h3>GC호출 후 가용 메모리: "+memory2+"</h3>");
    	}    	
    	//GC 호출 후 가용 메모리
    	
    	out.close();
    }
    
    @Override
    public void destroy() {
    	super.destroy();
    	System.out.println("destroy() 호출됨...");
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

}//////////////////////////////////////////////
