<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<style>
    .bg-schedule {
        border: 1px solid #ddd;
        background: none;
        display: flex;
        flex-direction: column;
        gap: 20px;
    }
    
    .post {
        border: 1px solid #ccc;
        padding: 0;
        margin-bottom: 20px;
        width: 100%;
    }

    .post-info {
        border: 1px solid #ccc;
        padding: 20px;
        padding-bottom: 10px;
        background-color: #E1E6F6;
    }

    .post-header {
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 10px;
    }

    .post-meta {
        color: #666;
        font-size: 14px;
        margin-bottom: 10px;
        
    }

    .post-content {
        font-size: 16px;
        padding: 50px 20px;
        overflow-wrap: break-word;
        white-space: pre-wrap;
    }

    .buttons {
        display: flex;
        justify-content: flex-end;
        margin-top: 10px; /* 버튼 간격 추가 */
    }
    
    textarea {
        padding: 10px;
        width: 100%;
        height: 100px;
    }

    .withdrawal-section {
        border: 1px solid #ccc;
        padding: 30px;
        border-radius: 30px;
        background-color: #f9f9f9;
    }

    .agreement {
        margin-top: 10px;
        margin-bottom: 20px;
    }
</style>

<section class="page-title bg-title overlay-dark">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <div class="title">
                    <h3>MYPAGE</h3>
                </div>
                <ol class="breadcrumb p-0 m-0">
                    <li class="breadcrumb-item active">회원탈퇴</li>
                </ol>
            </div>
        </div>
    </div>
</section>

<section class="section schedule">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="withdrawal-section">
                    <fieldset>
                        <h3>회원탈퇴</h3>
                        	<hr>
                        <h5>회원탈퇴 전, 유의사항을 확인해 주시기 바랍니다.</h5>
                        - 회원탈퇴 시 회원전용 웹 서비스 이용이 불가합니다.<br>
                        - 거래정보가 있는 경우, 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 계약 또는 청약철회에 관한 기록, 대금결제 및 재화 등의 공급에 관한 기록은 5년동안 보존됩니다.<br>
                        - 유효기간이 경과되지 않은 미사용 티켓관련 정보는 유효기간 만료일까지 보관되며, 탈퇴 후에도 유효기간 내 사용하실 수 있습니다.<br>
                        - 회원탈퇴 후 서비스에 입력하신 문의 및 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없어 편집 및 삭제처리가 원천적으로 불가능 합니다.<br>
                        - 상품문의 및 후기, 댓글 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기 바랍니다.<br>
                        <form action="/TeamBST/mypage/deleteMember" method="post" name="fr">
                        	<hr>
                            <div class="agreement" style="color:blue;">
                                <input type="checkbox" id="agreementCheckbox" onclick="toggleSubmitButton()"> 회원탈퇴 시 처리사항 안내를 확인하였음에 동의합니다.<br><br>
                            </div>
                            아이디 <input type="text" name="user_id" value="${resultDTO.user_id}" readonly style="margin:10px;">
                            비밀번호 <input type="password" name="user_pwd" placeholder="비밀번호를 입력하세요" required style="margin:10px;"><br>
                            <input type="submit" class="btn" value="회원탈퇴" id="submitButton" disabled>
                            <input type="button" class="btn" value="취소" onclick="history.back();">
                        </form>
                        <c:if test="${not empty error}">
                            <p style="color:red">${error}</p>
                        </c:if>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    function toggleSubmitButton() {
        const checkbox = document.getElementById('agreementCheckbox');
        const submitButton = document.getElementById('submitButton');
        submitButton.disabled = !checkbox.checked;
    }
</script>

<%@ include file="../include/footer.jsp"%>
</body>
</html>
