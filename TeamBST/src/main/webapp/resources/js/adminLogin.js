/**
 *  관리자 로그인 js
 */

$(document).ready(function(){
	$("#login-btn").click(function(){
		
		var admin_id =$("#admin_id").val();
		var admin_pwd = $("#admin_pwd").val();
		
		if(admin_id==""){
			alert("아이디를 입력하세요");
			
			$("#admin_id").focus(); //입력창으로 이동
			
				return;// 함수종료
		}
		
		if(admin_pwd==""){
			alert("비밀번호를 입력하세요");
			
			$("#admin_pwd").focus();
			
				return;
		}
		
		//폼 내부의 데이터를 전송할 주소
		document.loginForm.action="${path}/admin/loginCheck.do"
			
		//submit
		document.loginForm.submit();
		
	});
	
	
});