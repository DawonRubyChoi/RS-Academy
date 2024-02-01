<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap" rel="stylesheet">
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

   <style>
      .container2{
      width : 100%;
      height: 90vh; /*height는 100% 적용이 되지 않음*/
      background-color: rgb(246, 244, 238 );
      background-size: cover;
   }
   
      body {
         background-color: rgb(246, 244, 238);
      }
      
      .board_wrap{
         width: 1000px;
         margin: 100px auto;
         color: #655345;
         font-family: 'Noto Sans KR';
      }
      
      .board_title { margin-bottom: 30px;
               display: block;
               color: #655345;
               font-family: 'Noto Sans KR';
               font-size: 10px;
               margin-top: 100px;
               }
       .board_title strong {
          font-size: 3rem;
          font-family: 'Noto Sans KR';
          font-weight: bold;
          color: #655345;
       }
       
       .board_title p {
          margin-top: 5px;
          font-size: 1.4rem;
          dlsplay: block;
          margin-block-start: 1em;
          margin-block-end: 1em;
          margin-inline-start: 0px;
          margin-inline-end: 0px;
          color: #655345;
          font-family: 'Noto Sans KR';
       }
       
       .album .col{
          cursor: pointer;
       }
       
       .card *:hover{
          cursor:pointer;
       }
       
       .board_page_hj {
          text-align: center; margin-top: 25px;
       }
       
       .pageButton {
          font-size: 1.4rem; color: #655345;
          padding: 10px 10px 10px 10px; 
         display: inline-block;
       }
       
       .album {
          border-top: 2px solid #655345;
          color: black;
       }
       
       .bt_wrap{
          text-align: center;
       }
       
       .buttons{
         display: inline-block; 
         min-width: 80px; 
         margin-left: 10px; 
         padding : 10px; 
         border : 1px #655345;
          border-radius: 2px;
          font-size:1.4rem;
          background : #655345;
          color : white;
          cursor: pointer;
          
      }
   </style>

   <!-- 카드에 커서 넣기 -->
</head>
<body>
   <jsp:include page="../common/top.jsp"/>
   <div class="container2">
      <div class="board_wrap">
         <div class="board_title">
            <strong>포트폴리오</strong>
            <p>포트폴리오 페이지입니다.</p>
         </div>
         <div class="album py-5">
            <div class="container">
               <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                  <c:forEach items="${ list }" var="p">
                     <div class="col">
                        <div class="card shadow-sm">
                           <img src="${ contextPath }/resources/uploadPort/${ p.ocbImage }" width="100%" height="225">
                           <div class="card-body">
                              <p class="card-text">
                                 <label class="bId">번호. ${ p.ocbNo }</label> | <label class="writer">${ p.mbName }</label>
                              </p>
                              <div class="d-flex justify-content-between align-items-center">
                                 ${ p.ocbTitle }
                                 <small class="text-muted">조회수. ${ p.ocbNum } </small>
                              </div>
                           </div>
                        </div>
                     </div>
                  </c:forEach>
               </div>
            </div>
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
         <div class="bt_wrap">   <!-- 강사 로그인인 경우 -->
            <c:if test="${ !empty loginUser && loginUser.mbIsAdmin == 2 }">      
               <button class="buttons" type="button" onclick="location.href='${ contextPath }/portWrite.hj'">WRITE</button>
            </c:if>
         </div>
      </div>
      <jsp:include page="../../views/common/footer.jsp" />
   </div>
   <script>
      window.onload = () => {
         const divs = document.getElementsByClassName('card');
         for(const div of divs) {
            div.addEventListener('click', function() {
               const fullId = this.querySelector('.bId').innerText;
               const boardId = fullId.split(' ')[1];
               location.href = '${contextPath}/portDetail.hj?bId=' + boardId + "&page=" + ${pi.currentPage};
            });
         }
      }
   </script>

</body>
</html>