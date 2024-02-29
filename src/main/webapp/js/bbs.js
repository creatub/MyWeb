/**
 * 
 */
function bbs_check(){
	var title = document.getElementById('title');
	var writer = document.getElementById('writer');
	var content = document.getElementById('content');
	// document.querySelector('#content')
	if(!title.value){
		alert('글제목을 입력하세요');
		title.focus();
		return false; //유효하지 않은 값일 때
	}
	if(!writer.value){
		alert('작성자를 입력하세요');
		writer.focus();
		return false; //유효하지 않은 값일 때
	}
	if(!content.value){
		alert('글내용을 입력하세요');
		content.focus();
		return false; //유효하지 않은 값일 때
	}
	
	
	return true;
}