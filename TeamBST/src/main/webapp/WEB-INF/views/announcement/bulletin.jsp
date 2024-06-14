<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
    


        <div>
            <input type="text" placeholder="검색어 입력">
            <button>검색</button>
        </div>

        
        <button type="button" class="community" onclick="location.href='/announcement/announcement'">공지사항</button> <br>
        <button type="button" class="community" onclick="location.href='/announcement/bulletin'">문의게시판</button>

        <button onclick="location.href='/announcement/bulletinWrite'">글쓰기</button>


</body>
</html>