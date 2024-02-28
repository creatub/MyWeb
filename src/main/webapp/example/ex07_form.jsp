<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>ex07_form.jsp</h1>
<p>다양한 입력 양식을 이용해 서버에 데이터를 전달해보자</p>
<hr color="red">
<form name="f" method="get" action="ex07_request.jsp">
	<br><br>
        성별:
        <input type="radio" name="gender" value="M">남자
        <input type="radio" name="gender" value="F" checked>여자
        <!-- radio버튼=>단일선택 (동일한 name일때 단일선택 가능)
             checkbox버튼=>다중선택
        -->
        <br><br>
        취미:
        <input type="checkbox" name="hobby" id="hobby1"
         value="reading" checked>독서
        <input type="checkbox" name="hobby" id="hobby2"
         value="music">음악감상
        <input type="checkbox" name="hobby" id="hobby3"
         value="movie">영화감상 
        <br><br>
        
        드롭다운리스트:
        <select name="job"> <!--단일선택-->
            <option value="">::직업을 선택하세요::</option>
            <option value="Backend">백엔드 개발자</option>
            <option value="Frontend" selected>프런트엔드 개발자</option>
            <option value="Engineer">시스템 엔지니어</option>
        </select>
        <br><br>
        다중선택리스트: <!--다중선택하려면 multiple속성을 준다-->
        <select name="lang" id="lang" multiple size="6">
            <option value="">::사용 가능한 언어::</option>
            <option value="HTML">HTML</option>
            <option value="JavaScript">JavaScript</option>
            <option value="Java">Java</option>
            <option value="C">C</option>
        </select>
        <br><br>
        <button>서버에 전송</button>
</form>