<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="${pageContext.request.contextPath }/resources/css/noticeList.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap" rel="stylesheet">
<style>
.container2{
   width : 100%;
   height: 90vh; /*height는 100% 적용이 되지 않음*/
   background: url(../pic/cook1.jpg);
   background-color: rgb(246, 244, 238 );
   background-size: cover;
}
   .lists { cursor:pointer;}
   .buttons{
   display: inline-block; min-width: 80px; margin-left: 10px; padding : 10px; border : 1px #655345;
    border-radius: 2px; font-size:1.4rem; background : #655345; color : white; cursor: pointer;
   }
   .board_page_hj {text-align: center; margin-top: 25px;}
   .pageButton {font-size: 1.4rem; color: #655345;  padding: 10px 10px 10px 10px; 
             display: inline;}
             
</style>
</head>
<body>
   <jsp:include page="../common/top.jsp"/>
   <div class="container2">
	   <div class="board_wrap">
	      <div class="board_title">
	         <strong>공지사항</strong>
	         <p>공지사항 페이지입니다.</p>
	      </div>
	      <div class="board_list_wrap"> <!-- 1.보드 리스트 2. 페이지영역 3. 버튼 영역 wrap으로 감쌈 -->
	         <div class="board_list">
	            <div class="top"> 
	               <div class = "no">번호</div>         
	               <div class = "title" style="text-align: center">제목</div>
	               <div class = "writer">글쓴이</div>
	               <div class = "date">작성일</div>
	               <div class = "count">조회수</div>
	            </div>
	            <c:forEach items="${ nList }" var ="n">
	               <div class="lists">
	                  <div class = "no">${ n.noticeNo }</div>
	                  <div class = "title">${ n.noticeTitle }</div>
	                  <div class = "writer">${ n.mbName }</div>
	                  <div class = "date">${ n.noticeDate }</div>
	                  <div class = "count">${ n.noticeNum }</div>
	               </div>
	            </c:forEach>
	         </div>
	         
	         <div class="board_page_hj"> <!--페이지 넘기는 버튼-->   <!-- 버튼들 보이게 수정 -->
	            <c:if test="${ pi.currentPage > 1 }">
	               <c:url var="goBack" value="${ loc }">
	                  <c:param name="page" value="${ pi.currentPage -1 }"></c:param>
	               </c:url>
	               <a class="pageButton" href="${ goBack }" aria-label="Previous">
	                  <span aria-hidden="true">&laquo;</span>
	               </a>
	            </c:if>
	            
	            <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	               <c:url var="goNum" value="${ loc }">
	                  <c:param name="page" value="${ p }"></c:param>
	               </c:url>
	               <p class="pageButton"><a class="page-link" href="${ goNum }">${ p }</a></p>
	            </c:forEach>
	            
	            <c:if test="${ pi.currentPage < pi.maxPage }">
	               <c:url var="goNext" value="${ loc }">
	                  <c:param name="page" value="${ pi.currentPage +1 }"></c:param>
	               </c:url>
	               <a class="pageButton" href="${ goNext }" aria-label="Next">
	                  <span aria-hidden="true">&raquo;</span>
	               </a>
	            </c:if>
	         </div>
	         <div class="bt_wrap">
	                  <!-- css 확인 및 나중에 로그인 유저 관련해서 넣기 -->
	            <c:if test="${ !empty loginUser && loginUser.mbIsAdmin == 3}">      
	               <button class="buttons" type="button" onclick="location.href='${ contextPath }/noticeWrite.hj'">WRITE</button>
	            </c:if>
	         </div>
	      </div>
      </div>
   </div>
   
   
    <script>
         window.onload = () => {
             const lists = document.querySelectorAll('.lists');

             for (const list of lists) {
                 list.addEventListener('click', function () {
                     const noticeNoElement = list.querySelector('.no');

                     const noticeNo = noticeNoElement.textContent;

                     location.href = "${contextPath}/noticeDetail.hj?nId=" + noticeNo + "&page=" + ${pi.currentPage};
                 });
             }
         }
     </script>
</body>
<jsp:include page="../../views/common/footer.jsp" />
</html>