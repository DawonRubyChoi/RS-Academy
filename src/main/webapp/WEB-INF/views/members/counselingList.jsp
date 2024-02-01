<%@ page language="java" contentType="text/html; charset=UTF-8 "
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 상담</title>
<link href="${pageContext.request.contextPath}/resources/css/css.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap" rel="stylesheet">
</head>
<body>
   <jsp:include page="../../views/common/top.jsp" />
   <form action="counselingList.dw" method="post">
      <div class="container">
         <div class="board_wrap">
            <div class="board_title">
               <strong>1:1 상담</strong>
               <p>1:1 상담 페이지입니다. 문의 사항을 남겨주세요.</p>
            </div>
            <div class="board_list_wrap"> <!-- 1.보드 리스트 2. 페이지영역 3. 버튼 영역 wrap으로 감쌈 -->
               <div class="board_list">
                  <div class="top"> 
                     <div class = "no">번호</div>
                     <div class = "title">제목</div>
                     <div class = "writer">글쓴이</div>
                     <div class = "date">작성일</div>
                     <div class = "count">조회</div>
                  </div>
                  <c:forEach items="${ list }" var="b" varStatus="status">
                  <div class="center">
                  	<input type="hidden" name="${ b.cbNo }" value="${ b.cbNo }">
                     <div class = "no">${ b.cbNo }</div>
                     <div class = "title" style="cursor : pointer">${ b.cbTitle }</div>
                     <div class = "writer">${ b.mbName }</div>
                     <div class = "date">${ b.cbDate }</div>
                     <div class = "count">${ b.cbNum }</div>
                  </div>
                  </c:forEach>
               </div>
               
            <div class="board_page"> <!--페이지 넘기는 버튼-->
                 <c:url var="goBack" value="${ loc }">
                    <c:param name="page" value="${ pi.currentPage -1 }"/>
                  </c:url>
                  <a href="${ goBack }" class="bt first"><</a>
             <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
               <c:url var="goNum" value="${ loc }">
                  <c:param name="page" value="${ p }"/>
               </c:url>
               <li class="page-item"><a class="bt num" href="${ goNum }">${ p }</a></li>
               </c:forEach>
                
               <c:if test="${ pi.currentPage != pi.maxPage  }">
                 <c:url var="goNext" value="${ loc }">
                    <c:param name="page" value="${ pi.currentPage +1 }"/>
                 </c:url>
                    <a href="${ goNext }" class="bt first" aria-label="Next">></a>
                 </c:if>
                 </div>
                 <!-- 로그인한 유저만 보이게하기 -->
               <c:if test="${ !empty loginUser }">
                 <div class="bt_wrap">
                  <a href="${ contextPath }/writeCounselingBoard.dw" class="on">WRITE</a>
                  <!-- <a href="" class="on_1">DELETE</a> -->
                 </div>
                 </c:if>
            </div>
         </div>
      </div>
   </form>
   
   <script >
         window.onload= () =>{
            const center = document.getElementsByClassName('center');
            
            for(const divs of center){
               const boards = divs.children;
               boards[2].addEventListener('click', function(){
                  const boardNo =boards[0].value;
                 location.href='${contextPath}/counselingDetail.dw?cbNo=' + boardNo + "&page=" + ${pi.currentPage};
               });
            }
         }
   </script>
</body>
   <jsp:include page="../../views/common/footer.jsp" />
</html>