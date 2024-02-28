<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- page directive element -->
<!-- 1. html 주석 -->
<h1>처음 해보는 JSP</h1>
<!-- 
script element
 -->
 <%
 //2. 자바 주석
 //scriptlet 태그
 /* : 스크립트렛 태그 안에서는
 	 자바코드를 기술할 수 있어요
 */
 	int a = 10; // 지역변수(local variable)
 	int b = 20; // scriptlet태그 안에서 선언된 변수들은 모두 지역변수
 	//내장 객체 사용 가능
 	out.println("<h2>"+a+"+"+b+"="+(a+b)+"</h2>");
 	// out : JspWriter 타입의 출력스트림
 %>
 
 <%-- <% int c = 10; %> --%>
 <%--3. JSP 주석 --%>
 <%!
 //declaration : 메서드를 구성할 수 있다
 	String str ="나는 멤버변수(인스턴스 변수)";
 	public String sayHello(String name){
 		return "<h2>Hello " +name+"</h2>";
 	}
 %>
 <%-- <3> expression : 출력식
 	<%=변수 %>
 --%>
 <%=str%><br>
 
 <!-- sayHello()호출해서 결과값 출력 -->
 <%=sayHello("Kyle")%>
 
 <%--
 JSP가 서블릿으로 변환되어 실행된다.
 이클립스에서 서블릿 코드가 생성되는 곳
 C:\multicampus\java-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work
 
 
  --%>
 
 
 