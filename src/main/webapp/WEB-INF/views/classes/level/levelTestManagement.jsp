<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레벨 테스트 관리</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="${contextPath}/resources/css/levelTest.css" rel="stylesheet">
<link href="${contextPath}/resources/css/css.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap" rel="stylesheet">
<style type="text/css">
   #ltTitle{
   width: 100%;
   height: 150px;
   resize: none;
}
</style>

</head>
<body>
   <jsp:include page="../../common/top.jsp" />
   <div class="container">
      <div class="levelTestManagement">
         <div id="title">레벨 테스트 관리</div>
         <div id="levelMenu">
            <div id="selectLevelButton" class="levelMenu">레벨테스트 목록</div>
            <div id="addLevelButton" class="levelMenu">레벨테스트 추가</div>
         </div>
         <div id="selectLevelTest">
            <form method="get" id="selectLevelTestForm">
               <div id="searchNum">
                  <input type="search" name="search" id="search" value="${ search }">
                  <button id="searchButton">검색</button>
               </div>
                  
               <div id="updateDelete">
                  <button id="updateButton">수정</button>
                  <button id="deleteButton">삭제</button>
               </div>
               
               <c:if test="${ !empty list }">
                  <c:forEach items="${ list }" var="l">
                     <table>
                        <tr>
                           <th colspan="2">
                              <input type="checkbox" name="ltNo" value="${ l.ltNo }">
                              ${ l.ltNo }. ${ l.ltTitle }
                           </th>
                        </tr>
                        <tr>
                           <td>1)</td>
                           <td>${ l.ltNo1 }</td>
                        </tr>
                        <tr>
                           <td>2)</td>
                           <td>${ l.ltNo2 }</td>
                        </tr>
                        <tr>
                           <td>3)</td>
                           <td>${ l.ltNo3 }</td>
                        </tr>
                        <tr>
                           <td>4)</td>
                           <td>${ l.ltNo4 }</td>
                        </tr>
                     </table>
                  </c:forEach>
                  <div class="pagination">
                  
                     <c:if test="${ pi.currentPage <= 1 }">
                          <a>&laquo;</a>
                     </c:if>
                       <c:if test="${ pi.currentPage > 1 }">
                          <c:url var="goBack" value="${ loc }">
                             <c:param name="page" value="${ pi.currentPage - 1 }"/>
                             <c:param name="search" value="${ search }"/>
                          </c:url>
                          <a href="${ goBack }">&laquo;</a>
                       </c:if>
                       
                       <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                          <c:url var="goNum" value="${ loc }">
                             <c:param name="page" value="${ p }"/>
                             <c:param name="search" value="${ search }"/>
                          </c:url>
                          <a href="${ goNum }">${ p }</a>
                       </c:forEach>
                       
                    <c:if test="${ pi.currentPage >= pi.maxPage }">
                       <a>&raquo;</a>
                    </c:if>
                    <c:if test="${ pi.currentPage < pi.maxPage }">
                       <c:url var="goNext" value="${ loc }">
                          <c:param name="page" value="${ pi.currentPage + 1 }"/>
                          <c:param name="search" value="${ search }"/>
                       </c:url>
                       <a href="${ goNext }">&raquo;</a>
                    </c:if>
                    
                  </div>
               </c:if>
               
               <c:if test="${ empty list }">
                  <div style="text-align: center; padding: 200px; margin: 50px;" >
                     <h2>검색 결과가 없습니다.</h2>
                  </div>
               </c:if>
            
               <div class="bt_wrap">
                  <a href='javascript:history.back();' class="on_1">이전</a>
               </div>
            </form>
         </div>
         
         <div id="addLevelTest">
            <form action="${ contextPath }/insertLevelTest.rs" method="POST">
               <table>
                  <tr>
                     <th>질문</th>
                     <th id="correctAnswer">정답
                        <select name="ltAnswer">
                           <option value="1">1</option>
                           <option value="2">2</option>
                           <option value="3">3</option>
                           <option value="4">4</option>
                        </select>
                     </th>
                  </tr>
                  <tr>
                     <td colspan="2" id="td2">
                        <textarea name="ltTitle" id="ltTitle" required></textarea>
                     </td>
                  </tr>
                  <tr>
                     <td id="td3">1번 : </td>
                     <td>
                        <input type="text" name="ltNo1" id="ltNo1" required>
                     </td>
                  </tr>
                  <tr>
                     <td>2번 : </td>
                     <td>
                        <input type="text" name="ltNo2" id="ltNo2" required>
                     </td>
                  </tr>
                  <tr>
                     <td>3번 : </td>
                     <td>
                        <input type="text" name="ltNo3" id="ltNo3" required>
                     </td>
                  </tr>
                  <tr>
                     <td>4번 : </td>
                     <td>
                        <input type="text" name="ltNo4" id="ltNo4" required>
                     </td>
                  </tr>
               </table>
               <div class="bt_wrap">
                  <input type="submit" value="완료" id="submit">
                  <a href='index.jsp' class="on_1">이전</a>
               </div>
            </form>
         </div>
      </div>
      
   <jsp:include page="../../common/footer.jsp" />
   </div>
   
   <script>
      window.onload = () =>{
         const selectLevelTest = document.getElementById('selectLevelTest');
         const addLevelTest = document.getElementById('addLevelTest');
      
         document.getElementById('selectLevelButton').addEventListener('click',() => {
            selectLevelTest.style.display = 'block';
            addLevelTest.style.display = 'none';
            location.href = '${contextPath}/levelTestManagement.rs';
         });
         
         document.getElementById('addLevelButton').addEventListener('click',() => {
            selectLevelTest.style.display = 'none';
            addLevelTest.style.display = 'block';
         });
      }
   
       $(document).ready( () => {
           const form = $('#selectLevelTestForm');
   
           const updateButton = $('#updateButton');
           updateButton.on('click', () => {
               const selectedQuestions = $('input:checkbox[name="ltNo"]:checked');
   
               if (selectedQuestions.length === 1) {
                   form.attr('action', '${contextPath}/goEditLevelTest.rs');
                   form.submit();
               } else if (selectedQuestions.length > 1) {
                   alert("수정은 한 문제씩 가능합니다.");
               } else {
                   alert("수정할 문제를 선택하세요.");
               }
           });
           
           const deleteButton = $('#deleteButton');
           
           deleteButton.on('click', () =>{
              const selectedQuestions = $('input:checkbox[name="ltNo"]:checked');
              
              if(selectedQuestions.length >= 1){
                 if(confirm("정말 삭제하시겠습니까?") == true){
                    form.attr('action', '${contextPath}/deleteLevelTest.rs');
                      form.submit();
                 } else{
                    return;
                 }
              } else{
                 alert("삭제할 문제를 선택하세요.");
              }
           });
           
           const searchButton = $('#searchButton');
           searchButton.on('click', () =>{
              let search = $('#search').val();
              form.attr('action', '${contextPath}/searchLevelTest.rs?search=' + search);
                form.submit();
           });
           
       });
   </script>

</body>
</html>