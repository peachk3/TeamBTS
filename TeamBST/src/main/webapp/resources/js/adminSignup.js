//이름

function regMemberName(admin_name) {
	var regExp = /^[가-힣]{1,10}$/;
	return regExp.test(admin_name);
}

function checkName() {
	var admin_name = $('#admin_name').val();
	if (!regMemberName(admin_name)) {
		$('#admin_name').val('');
		alert('유효하지 않은 이름입니다.');
	} else {
		alert('사용가능한 이름입니다. ');
	}
}

// 이름 필드에서 포커스가 벗어날 때마다 checkName 함수를 호출합니다.
$('#admin_name').on('blur', function() {
	checkName();
});
//아이디
function regMemberId(admin_id) { // 아이디는 영문자 또는 숫자 조합 6~16자
	if (admin_id.indexOf(' ') >= 0) {
		return false; // 공백 문자가 있는 경우 유효하지 않음
	}
	var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,16}$/;
	return regExp.test(admin_id);
}

// 아이디 중복체크
$('#aidCheck').click(function(event) {
	var id = document.getElementById("admin_id").value;

	if (!regMemberId(id)) {
		document.getElementById("admin_id").value = '';
		alert('6~16자의 영문자와 숫자를 조합해서 입력해주세요.');
		return;
	} else {
		$.ajax({
			url : '/TeamBST/login/aidCheck?admin_id=' + id, // Controller에서 요청 받을 주소
			type : 'get', // get 방식으로 전달
			success : function(res) { // 컨트롤러에서 넘어온 cnt값을 받는다
				if (res == 0) {
					alert('사용 가능한 아이디입니다.');
				} else { // cnt가 1일 경우 -> 이미 존재하는 아이디
					alert("이미 존재하는 아이디입니다.");
					$('#admin_id').val('');
				}
			},
			error : function() {
				alert("에러입니다");
			}
		});
	}
});

//닉네임
//닉네임 유효성 검사
function regMemberNick(admin_nick) { //닉네임 // 공백,특수문자,숫자 제외 영어 한글 가능 3글자~12자
	var regExp = /^[a-zA-Z가-힣]{3,12}$/;
	return regExp.test(admin_nick);
}


//비밀번호		
//패스워드 유효성
function regMemberPassword(admin_pwd) { //패스워드 //8~16자 영문,숫자,특수기호 숫자최소 1 특수기호최소 1
	var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}$/;
	return regExp.test(admin_pwd);
}
$('.button-primary').click(function(event) {
	event.preventDefault(); // 폼 제출 막기
	var apwd = document.getElementById("admin_pwd").value;
	var cpwd = document.getElementById("apwdCheck").value;

	if (!regMemberPassword(apwd)) {
		document.getElementById("admin_pwd").value = '';
		alert('비밀번호는 8~16자의 영문, 숫자, 특수기호를 포함해야 합니다.');
		return;
	}
	if (apwd != cpwd) {
		document.getElementById("apwdCheck").value = '';
		alert('비밀번호가 일치하지 않습니다.');
		return;
	} else {
		alert('비밀번호가 일치합니다.');
	}
});

//핸드폰
//핸드폰 유효성 
$(document).ready(function() {
	let isPhoneVerified = false; // 중복 확인 여부 저장

	function regMemberPhone(phone) {
		var regExp = /^010-\d{4}-\d{4}$/;
		return regExp.test(phone);
	}

	function checkPhone() {
		var phone = document.getElementById("admin_phone").value;
		if (!regMemberPhone(phone)) {
			document.getElementById("admin_phone").value = '';
			alert('유효하지 않은 핸드폰 번호입니다.');
			return;
		}

		$.ajax({
			url : '/TeamBST/login/aphoneCheck',
			type : 'get',
			data : {
				admin_phone : phone
			},
			success : function(res) {
				if (res == 0) {
					alert('유효한 핸드폰 번호입니다.');
				} else {
					alert("이미 사용하고 있는 핸드폰 번호입니다.");
					$('#admin_phone').val('');
				}
			},
			error : function() {
				alert("시스템 에러입니다");
			}
		});
	}

	$('#aphoneCheck').click(function(event) {
		event.preventDefault();
		checkPhone();
	});

	// 이메일 유효성 검사
	function regMemberEmail(admin_email) { //이메일 //공백, 특수문자,한글 제외 
		var regExp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		return regExp.test(admin_email);
	}

	// 이메일 중복 체크
	$('#aemailCheck').click(function(event) {
		event.preventDefault();
		var email = document.getElementById("admin_email").value;

		if (!regMemberEmail(email)) {
			$('#admin_email').val('');
			alert('유효한 이메일을 입력해주세요.');
			return;
		}

		$.ajax({
			url : '/TeamBST/login/aemailCheck?admin_email=' + email,
			type : 'get', //get 방식으로 전달
			success : function(res) {
				if (res == 0) {
					alert('사용 가능한 이메일입니다.');
				} else if (res == 1) { // cnt가 1일 경우 -> 이미 존재하는 이메일
					alert("이미 사용하고 있는 이메일입니다.");
					$('#admin_email').val('');
				} else {
					alert("유효하지 않은 이메일 형식입니다.");
				}
			},
			error : function() {
				alert("시스템 에러입니다");
			}
		});
	});
});
