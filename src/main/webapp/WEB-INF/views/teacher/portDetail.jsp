<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세</title>
<link
   href="${pageContext.request.contextPath }/resources/css/noticeList.css"
   rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
.port_img {
   width: 1000px;
   height: 500px;
   object-fit: cover;
}

.buttons {
   display: inline-block;
   min-width: 80px;
   margin-left: 10px;
   padding: 10px;
   border: 1px #655345;
   border-radius: 2px;
   font-size: 1.4rem;
   background: #655345;
   color: white;
   cursor: pointer;
}

.on_1 {
   display: inline-block;
   min-width: 80px;
   margin-left: 10px;
   padding: 10px;
   border: 1px solid grey;
   border-radius: 2px;
   font-size: 1.4rem;
   background: rgba(0, 0, 0, 0);
   color: grey;
   cursor: pointer;
}

.reply_content {
   font-family: 'Noto Sans KR';
}

.comment {
   border: 1px solid #ccc;
   margin: 10px;
   padding: 10px;
}

.comment_title {
   font-weight: bold;
}

.comment-info dl {
   display: inline-block;
   margin-right: 10px;
}

.dotted {
   border-bottom: 1px dashed #ccc;
   margin: 10px 0;
}

.comment-text {
   margin-top: 10px;
}
</style>

</head>
<body>
   <jsp:include page="../common/top.jsp" />
   <div class="container">
      <div class="board_wrap">
         <div class="board_title">
            <strong>포트폴리오</strong>
            <p>${ p.ocbCategory } 포트폴리오입니다.</p>
         </div>
         <form class="port_form" method="POST" id="detailForm">
            <div class="board_view_wrap">
               <!-- 1.보드 리스트 2. 페이지영역 3. 버튼 영역 wrap으로 감쌈 -->
               <input type="hidden" name="ocbNo" value="${ p.ocbNo }"> <input
                  type="hidden" name="page" value="${ page }"> <input
                  type="hidden" name="ocbImage" value="${ p.ocbImage }">
               <div class="board_view">
                  <div class="title">
                     <!--글 제목-->
                     ${ p.ocbTitle }
                  </div>
                  <div class="info">
                     <!--글 정보-->
                     <dl>
                        <dt>번호</dt>
                        <dd>${ p.ocbNo }</dd>
                     </dl>
                     <dl>
                        <dt>글쓴이</dt>
                        <dd>${ p.mbName }</dd>
                        <!-- 나중에 닉네임으로 -->
                     </dl>
                     <dl>
                        <dt>작성일</dt>
                        <dd>${ p.ocbDate }</dd>
                     </dl>
                     <dl>
                        <dt>조회</dt>
                        <dd>${ p.ocbNum }</dd>
                     </dl>
                  </div>
                  <div class="text">
                     <!--글 내용-->
                     <img src="${ contextPath }/resources/uploadPort/${ p.ocbImage }"
                        class="port_img"> <br> <br>
                     <pre class="content_text">${ p.ocbContent }</pre>
                  </div>
               </div>

               <!-- 수정, 삭제버튼 -->
               <div class="bt_wrap">
                  <c:if test="${ loginUser.mbId eq p.ocbId }">
                     <button class="buttons" type="button" id="updatePort">수정</button>
                     <button class="buttons" type="button" id="deleteConfirm">삭제</button>
                  </c:if>
                  <button class="on_1" type="button"
                     onclick="location.href='${contextPath}/portList.hj?page=${ page }'">목록으로</button>
               </div>
            </div>
         </form>

         <!-- 댓글 시작 -->
         <h3 class="reply">댓글</h3>

         <div class="inputReply">
            <table>
               <tr>
                  <td><textarea class="reply_content" rows="5" cols="120"
                        id="replyContent" style="resize: none;"></textarea></td>
                  <td>
                     <button id="insertReply" class="on_1" type="button"
                        <c:if test="${ empty loginUser }">disabled</c:if>>댓글 등록</button>
                  </td>
               </tr>
            </table>
         </div>

         <!-- 댓글 리스트 -->
         <div id="isTrue">
            <c:forEach items="${ list }" var="r" varStatus="loop">
               <div class="comment">
                  <div class="comment_title">
                     <div class="comment-info">
                        <dl>
                           <dt>번호</dt>
                           <dd class="port_reply_no">${ fn:length(list) -loop.index }</dd>
                        </dl>
                        <dl>
                           <dt>글쓴이</dt>
                           <dd>${ r.mbName }</dd>
                        </dl>
                        <dl>
                           <dt>작성일</dt>
                           <dd>${ r.ocrDate }</dd>
                        </dl>
                     </div>
                  </div>
                  <div class="dotted"></div>
                  <!-- 선긋기 -->
                  <div class="comment-text">${ r.ocrContent }</div>
                  <input type="hidden" name="ocrOcbNo" value="${ r.ocrOcbNo }">
                  <input type="hidden" name="ocrNo" value="${ r.ocrNo }">
                  <div class="void">
                     <c:if test="${ loginUser.mbId eq r.ocrId  }">
                        <button type="button" class="replyUpdate">수정</button>
                        <button type="button" class="replyDelete">삭제</button>
                     </c:if>
                  </div>
               </div>
            </c:forEach>
         </div>
      </div>
      <jsp:include page="../../views/common/footer.jsp" />
   </div>

   <script>
       $().ready(function(){
          const del = document.getElementById('deleteConfirm');
          
          $(document).on('click', '#updatePort', function () {
              const form = $('#detailForm');
              form.attr('action', '${contextPath}/updatePortGo.hj');
              form.submit();
          });
          
          $(document).on('click', '#deleteConfirm', function () {
              const yes = window.confirm("정말 삭제하시겠습니까?");
              if (yes) {
                  window.alert("정상적으로 포트폴리오가 삭제되었습니다.");
                  const form = $('#detailForm');
                  form.attr('action', '${contextPath}/deletePort.hj');
                  form.submit();
              }
          });
          
          
          $(document).on('click', '#insertReply', function () {
              const replyContent = $('#replyContent').val();
              console.log(replyContent);
             
              if (replyContent !== '') {
                  $.ajax({
                      url: '${contextPath}/insertReply.hj',
                      data: { ocrContent: replyContent, ocrId: '${loginUser.mbId}', ocrOcbNo: ${p.ocbNo} },
                      success: function (data) {
                          const isTrueDiv = $('#isTrue'); // 제이쿼리로 생성 시 문법 달라짐
                          isTrueDiv.empty();

                          for (let i = 0; i < data.length; i++) {
                              const comment = data[i];

                              const commentDiv = document.createElement('div');
                              commentDiv.classList.add('comment');
                              
                              const commentTitleDiv = document.createElement('div');
                              commentTitleDiv.classList.add('comment_title');
                              
                              const commentInfoDiv = document.createElement('div');
                              commentInfoDiv.classList.add('comment-info');
                              
                              const dl1 = document.createElement('dl');
                              const dt1 = document.createElement('dt');
                              dt1.innerText = '번호';
                              const dd1 = document.createElement('dd');
                              dd1.innerText = data.length - i;
                              dl1.appendChild(dt1);
                              dl1.appendChild(dd1);

                              const dl2 = document.createElement('dl');
                              const dt2 = document.createElement('dt');
                              dt2.innerText = '글쓴이';
                              const dd2 = document.createElement('dd');
                              dd2.innerText = comment.mbName;
                              dl2.appendChild(dt2);
                              dl2.appendChild(dd2);

                              const dl3 = document.createElement('dl');
                              const dt3 = document.createElement('dt');
                              dt3.innerText = '작성일';
                              const dd3 = document.createElement('dd');
                              dd3.innerText = comment.ocrDate;
                              dl3.appendChild(dt3);
                              dl3.appendChild(dd3);

                              commentInfoDiv.appendChild(dl1);
                              commentInfoDiv.appendChild(dl2);
                              commentInfoDiv.appendChild(dl3);

                              const dottedDiv = document.createElement('div');
                              dottedDiv.classList.add('dotted');

                              const commentTextDiv = document.createElement('div');
                              commentTextDiv.classList.add('comment-text');
                              commentTextDiv.innerText = comment.ocrContent;
                      
                              const hiddenInput = document.createElement('input')
                              hiddenInput.type = 'hidden';
                              hiddenInput.name = 'ocrNo';
                              hiddenInput.value = comment.ocrNo;
                              hiddenInput.classList.add('ocrNo');
                              
                              
                              
                              const voidDiv = document.createElement('div');
                              if(comment.ocrId == '${loginUser.mbId}'){
                                 voidDiv.innerHTML = "<button type='button' class='replyUpdate'>수정</button><button type='button' class='replyDelete'>삭제</button>"
                              }
                              
                              commentTitleDiv.appendChild(commentInfoDiv);
                              commentTitleDiv.appendChild(dottedDiv);

                              commentDiv.appendChild(commentTitleDiv);
                              commentDiv.appendChild(commentTextDiv);
                              commentDiv.appendChild(voidDiv);
                              commentDiv.appendChild(hiddenInput);
                              
                              isTrueDiv.append(commentDiv);
                              
                          }
                           
                          $('#replyContent').val('');
                        },
                   
                   error: data => console.log(data)
                   
                })
             }
          });
          
          // 댓글입력 에이작스가 실행된 다음 순서가 이거
          
          $(document).on('click', '.replyUpdate', function () {
	          const voidDiv = $(this).closest('.comment');
	          const commentTextDiv = voidDiv.find('.comment-text');
	          const ocrNoInput = voidDiv.find('[name="ocrNo"]');
	
	          if (!$(this).hasClass('submit')) {
	              const newTextArea = $('<textarea class="newArea" rows="5" cols="120" style="resize: none;">').val(commentTextDiv.text());
	              commentTextDiv.empty().append(newTextArea);
	              $(this).text('제출').addClass('submit');
	          }
	      });
      
          $(document).on('click', '.replyUpdate.submit', function () {
               const $thisButton = $(this); // '제출' 버튼에 대한 참조를 저장
               const voidDiv = $thisButton.closest('.comment');
               const newTextArea = voidDiv.find('.newArea');
               const ocrNoInput = voidDiv.find('[name="ocrNo"]');

               if (newTextArea.val() !== '') {
                   $.ajax({
                       url: '${contextPath}/updateReply.hj',
                       data: { ocrContent: newTextArea.val(), ocrNo: ocrNoInput.val() },
                       success: function (data) {
                           voidDiv.find('.comment-text').text(data.ocrContent);
                           voidDiv.find('.comment-info dd:last').text(data.ocrDate);

                           $thisButton.removeClass('submit').text('수정'); // 여기에서 $thisButton 참조 사용
                       },
                       error: function (data) {
                           console.log(data);
                       }
                   });
               }
           });

          // 삭제 버튼 클릭 이벤트
          $(document).on('click', '.replyDelete', function () {
              const voidDiv = $(this).closest('.comment');
              const ocrNoInput = voidDiv.find('[name="ocrNo"]');
              const ocrOcbNo = $('input[name="ocbNo"]').val();

              const yes = window.confirm("정말 삭제하시겠습니까?");
              if (yes) {
                  $.ajax({
                      url: '${contextPath}/deleteReply.hj',
                      method: 'POST',
                      data: { ocrNo: ocrNoInput.val(), ocrOcbNo:${p.ocbNo} },
                      success: function (data) {
                    	  console.log(data);
                          const isTrueDiv = $('#isTrue');	// 제이쿼리로 생성 시 문법 달라짐
                          isTrueDiv.empty();

                          for (let i = 0; i < data.length; i++) {
                              const comment = data[i];
                              
                              const commentDiv = document.createElement('div');
                              commentDiv.classList.add('comment');
                              
                              const commentTitleDiv = document.createElement('div');
                              commentTitleDiv.classList.add('comment_title');
                              
                              const commentInfoDiv = document.createElement('div');
                              commentInfoDiv.classList.add('comment-info');
                              
                              const dl1 = document.createElement('dl');
                                const dt1 = document.createElement('dt');
                                dt1.innerText = '번호';
                                const dd1 = document.createElement('dd');
                                dd1.innerText = data.length - i;
                                dl1.appendChild(dt1);
                                dl1.appendChild(dd1);

                                const dl2 = document.createElement('dl');
                                const dt2 = document.createElement('dt');
                                dt2.innerText = '글쓴이';
                                const dd2 = document.createElement('dd');
                                dd2.innerText = comment.mbName;
                                dl2.appendChild(dt2);
                                dl2.appendChild(dd2);

                                const dl3 = document.createElement('dl');
                                const dt3 = document.createElement('dt');
                                dt3.innerText = '작성일';
                                const dd3 = document.createElement('dd');
                                dd3.innerText = comment.ocrDate;
                                dl3.appendChild(dt3);
                                dl3.appendChild(dd3);

                                commentInfoDiv.appendChild(dl1);
                                commentInfoDiv.appendChild(dl2);
                                commentInfoDiv.appendChild(dl3);

                                const dottedDiv = document.createElement('div');
                                dottedDiv.classList.add('dotted');

                                const commentTextDiv = document.createElement('div');
                                commentTextDiv.classList.add('comment-text');
                                commentTextDiv.innerText = comment.ocrContent;
                        
                                const voidDiv = document.createElement('div');
                                if(comment.ocrId == '${loginUser.mbId}'){
                                   voidDiv.innerHTML = "<button type='button' class='replyUpdate'>수정</button><button type='button' class='replyDelete'>삭제</button>"
                                }
                                
                                const hiddenInput = document.createElement('input')
                                hiddenInput.type = 'hidden';
                                hiddenInput.name = 'ocrNo';
                                hiddenInput.value = comment.ocrNo;
                                hiddenInput.classList.add('ocrNo');
                                
                                
                                commentTitleDiv.appendChild(commentInfoDiv);
                                commentTitleDiv.appendChild(dottedDiv);

                                commentDiv.appendChild(commentTitleDiv);
                                commentDiv.appendChild(commentTextDiv);
                                commentDiv.appendChild(voidDiv);
                                commentDiv.appendChild(hiddenInput);
                                
                                isTrueDiv.append(commentDiv);

                          }

                          // 댓글이 삭제되었을 때 화면 갱신
                          $('#replyContent').val('');
                      },
                      error: function (data) {
                          window.alert("댓글 삭제 중 오류가 발생했습니다.");
                      }
                  });
              }
          });
          
          
       });
    </script>

</body>
</html>