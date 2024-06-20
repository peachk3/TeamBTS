//아이디 
function checkId(){
        var id = $('#user_id').val(); //id값이 "id"인 입력란의 값을 저장
        $.ajax({
            url:'/login/idCheck?user_id='+id, //Controller에서 요청 받을 주소
            type:'get', //get 방식으로 전달
            success:function(res){ //컨트롤러에서 넘어온 cnt값을 받는다 
                if(res == 0){ 
                	alert('사용 가능한 아이디입니다. ');
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                    alert("이미 존재하는 아이디입니다. ");
                    $('#user_id').val('');
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
     };
     
//닉네임
function checkNick(){
            var nick = $('#user_nick').val(); //nick값이 "nick"인 입력란의 값을 저장
            $.ajax({
                url:'/login/nickCheck?user_nick='+nick, //Controller에서 요청 받을 주소
//                data: { user_nick: nick },	// 요청에 파라미터 추가--> 중복체크 안 됨 그래서 주석처리 함!!  
                type:'get', //get 방식으로 전달
                success:function(res) { //컨트롤러에서 넘어온 cnt값을 받는다 
                    if(res == 0) { 
                    	alert('사용 가능한 닉네임입니다. ');
                    } else  { // cnt가 1일 경우 -> 이미 존재하는 아이디
                        alert("이미 존재하는 닉네임입니다. ");
                        $('#user_nick').val(''); //입력란 초기화
                    }
                },
                error:function()
                {
                    alert("시스템 에러입니다");
                }
            });
		};
      
//이메일 	
		function checkEamil(){
            var email = $('#user_email').val(); 
            $.ajax({
                url:'/login/emailCheck?user_email='+email, 
                type:'get', //get 방식으로 전달
                success:function(res) { 
                    if(res == 0) { 
                    	alert('사용 가능한 이메일입니다. ');
                    } else  { // cnt가 1일 경우 -> 이미 존재하는 아이디
                        alert("이미 사용하고 있는 이메일 또는 이메일 형식에 맞지 않습니다. ");
                        $('#user_email').val('');
                    }
                },
                error:function()
                {
                    alert("시스템 에러입니다");
                }
            });
		};	
		

/*
function validateForm() {
    // 폼 유효성 검증 로직을 여기에 추가
    return true; // 예시로 항상 true 반환
}



function sendCode() {
    // 인증번호 전송 로직
    alert('인증번호 전송');
}

function verifyCode() {
    // 인증번호 확인 로직
    alert('인증번호 확인');
}

function resendCode() {
    // 인증번호 재전송 로직
    alert('인증번호 재전송');
}
*/