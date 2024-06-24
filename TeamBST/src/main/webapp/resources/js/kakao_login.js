/**
 * 
 */

//아이디 중복확인 checkDuplicate()
//2a477e4fdca6fb1b392bf0762777d70d

//카카오 sdk 초기화
//window.kakao.init('2a477e4fdca6fb1b392bf0762777d70d'); //카카오 앱 키
console.log(kakao.isInitialized()); //sdk 초기화 확인



function kakaoLogin() {
    window.Kakao.Auth.login ({
        scope: 'profile_nickname,profile_image,talk_message',
        success: function(authObj) {
            console.log(authObj); //기져온 데이터를 콘솔에 출력됨

            // 로그인 성공 시, 사용자 정보 요청
            window.Kakao.API.request({
                url: '/v2/user/me', // 현재 로그인한 사용자 정보 받기
                success: function(res) {  
                   
                    console.log(res);
                    alert('카카오 계정으로 로그인 성공!');
                    // 여기서 서버로 사용자 정보를 전송하여 회원가입 처리
                },
                fail: function(error) {
                    console.log(error);
                    alert('사용자 정보 요청 실패');
                }
            });
        },
        fail: function(err) {
            console.log(err);
            alert('카카오 로그인 실패');
        }
    });
}
