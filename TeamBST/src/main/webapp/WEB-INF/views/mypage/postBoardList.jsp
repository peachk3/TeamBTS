<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

${pMatchList}
    <h1>내 게시글 목록</h1>
    <table border="1">
        <tr>
            <th>게시글 번호</th>
            <th>제목</th>
            <th>내용</th>
            <th>작성일</th>
        </tr>
        <c:forEach var="post" items="">
            <tr>
<%--                 <td>${pMatchList.post_id}</td> --%>
<%--                 <td>${pMatchList.title}</td> --%>
<%--                 <td>${pMatchList.content}</td> --%>
<%--                 <td>${pMatchList.created_date}</td> --%>
            </tr>
        </c:forEach>
    </table>
    <a href="/mypage/mypage">마이페이지로 돌아가기</a>
</body>
</html>
