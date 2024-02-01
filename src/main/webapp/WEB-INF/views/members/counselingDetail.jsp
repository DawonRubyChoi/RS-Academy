<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>1:1 상담 상세페이지</title>
    <link href="${pageContext.request.contextPath}/resources/css/css.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap" rel="stylesheet">
</head>
<body>
    <jsp:include page="../../views/common/top.jsp" />
    <form action="counselingDetail.dw" method="post" id="detailForm">
        <div class="container">
            <div class="board_wrap">
                <div class="board_title">
                    <strong>1:1 상담</strong>
                    <p>1:1 상담 페이지입니다. 문의 사항을 남겨주세요.</p>
                </div>
                <div class="board_view_wrap">
                <input type="hidden" value="${ cb.cbNo }" name="cbNo">
                <input type="hidden" value="${ cb.cbNo }" name="crCbNo">
				<input type="hidden" value="${ page }" name="page">
                    <!-- 화면 공통 : 회원글 정보 -->
                    <div class="board_view">
                        <div class="title">${ cb.cbTitle }</div>
                        <div class="info">
                            <dl>
                                <dt>번호</dt>
                                <dd>${ cb.cbNo }</dd>
                            </dl>
                            <dl>
                                <dt>글쓴이</dt>
                                <dd>${ cb.mbName }</dd>
                            </dl>
                            <dl>
                                <dt>작성일</dt>
                                <dd>${ cb.cbDate }</dd>
                            </dl>
                            <dl>
                                <dt>조회</dt>
                                <dd>${ cb.cbNum }</dd>
                            </dl>
                        </div>
                        <div class="text">${ cb.cbContent }</div>
                        
                            <div class="bt_wrap">
		                        <c:if test="${ loginUser.mbId eq cb.cbId }">
		                              <button type="button" id="edit" class="on_1">EDIT</button>
		                               <button type="button" id="delete1" class="on">DELETE</button>
		                        </c:if>
                            </div>
                        <!--  답변 시작  -->
                         <c:if test="${ cr.crContent == null }">
                            <c:if test="${ loginUser.mbIsAdmin == 3}">
                                <div class="comment">
                                    <h3>답변</h3>
                                    <textarea rows="12" cols="133" placeholder="내용을 입력해주세요." id="replyContent" name="crContent"></textarea>
                                </div>
                                <div class="bt_wrap">
                                    <button type="button" class="on" id="replyBt">REPLY</button>
                                </div>
                            </c:if>
                        </c:if>
                        <c:if test="${ cr.crContent != null }">
                            <div class="comment">
                                <h3>답변</h3>
                                <div class="comment_title">
                                    <div class="comment-info">
                                        <dl>
                                            <dt>번호</dt>
                                            <dd>${ cr.crNo }</dd>
                                        </dl>
                                        <dl>
                                            <dt>글쓴이</dt>
                                            <dd>${ cr.mbName }</dd>
                                        </dl>
                                        <dl>
                                            <dt>작성일</dt>
                                            <dd>${ cr.crDate }</dd>
                                        </dl>
                                    </div>
                                </div>
                                	<div class="comment-text" style="white-space:pre;">${ cr.crContent}</div>
                                </div>
                                </c:if>
                                <c:if test="${ cr.crContent != null }">
	                             	<c:if test="${ loginUser.mbIsAdmin == 3}">
	                                    <div class="bt_wrap">
	                                        <button type="button" class="on_1" id="replyEdit">EDIT</button>
	                                        <button type="button" class="on" id="replyDelete">DELETE</button>
	                                    </div>
	                                </c:if>
                                </c:if>
                            </div>
                    </div>
                </div>
            </div>
    </form>
    <jsp:include page="../../views/common/footer.jsp" />
    <script>
        window.onload = () => {
        	
        		const form = document.getElementById('detailForm');
                const edit = document.getElementById('edit');
                const delete1 = document.getElementById('delete1');
                const replyBt = document.getElementById('replyBt');
                const replyEdit = document.getElementById('replyEdit');
                const replyDelete = document.getElementById('replyDelete');
                
                if(edit != null) { 
                	edit.addEventListener('click', ()=>{
	                	form.action = '${contextPath}/updateCounselingBoard.dw';
	                	form.submit();
               	 	});
                }
                
                if(delete1 != null) {
                	delete1.addEventListener('click', () => {
                		
                		const yes = window.confirm("정말 삭제 하시겠습니까?");
                		
                        if(yes) {
                           window.alert("삭제 되었습니다.");
                           form.action = '${contextPath}/deleteCounselingBoard.dw';
       					   form.submit();
                        }
    				});
                }
                
                if(replyBt != null) {
                	replyBt.addEventListener('click', () => {
                		form.action = '${contextPath}/replyCounselingBoard.dw';
                		form.submit();
                	});
                }
                
                if(replyEdit != null) {
                	replyEdit.addEventListener('click', () => {
                		form.action = '${contextPath}/replyEdit.dw';
                		form.submit();
                	});
                }
                
                if(replyDelete != null) {
                	
                	replyDelete.addEventListener('click', () => {
                		
						const yes = window.confirm("정말 삭제 하시겠습니까?");
                		
                        if(yes) {
                           window.alert("삭제 되었습니다.");
	                		form.action = '${contextPath}/replyDelete.dw';
	                		form.submit();
                	}
                });
                
            }
        }
        	
    </script>
</body>
</html>