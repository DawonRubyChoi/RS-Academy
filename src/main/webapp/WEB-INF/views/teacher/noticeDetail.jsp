<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<!DOCTYPE html>	
<html>
<head>
    <meta charset="UTF-8">
    <title>상세</title>
    <link href="${pageContext.request.contextPath }/resources/css/noticeList.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap" rel="stylesheet">
	<style>
		.buttons{
			display: inline-block; min-width: 80px; margin-left: 10px; padding : 10px; border : 1px #655345;
		    border-radius: 2px; font-size:1.4rem; background : #655345; color : white; cursor: pointer;
		}
		.on_1{
			display: inline-block; min-width: 80px; margin-left: 10px; padding : 10px; border : 1px solid grey;
		    border-radius: 2px; font-size:1.4rem; background : rgba(0, 0, 0, 0); color : grey; cursor: pointer;
		}
	</style>

</head>
<body>
	<jsp:include page="../common/top.jsp"/>
    <div class="container">
        <div class="board_wrap">
            <div class="board_title">
                <strong>공지사항</strong>
                <p>공지사항 페이지입니다.</p>
            </div>
            <form class="formClass" method="POST" id="detailNotice">
            	<input type="hidden" value="${ page }" name="page">
            	<input type="hidden" value="${ n.noticeNo }" name="noticeNo">
	            <div class="board_view_wrap"> <!-- 1.보드 리스트 2. 페이지영역 3. 버튼 영역 wrap으로 감쌈 -->
	                <div class="board_view">
	                    <div class="title"> <!--글 제목-->
	                        ${ n.noticeTitle }
	                    </div>
	                    <div class="info"> <!--글 정보-->
	                        <dl>
	                            <dt>번호</dt>
	                            <dd>${ n.noticeNo }</dd>
	                        </dl>
	                        <dl>
	                            <dt>글쓴이</dt>
	                            <dd>${ n.mbName }</dd>
	                        </dl>
	                        <dl>
	                            <dt>작성일</dt>
	                            <dd>${ n.noticeDate }</dd>
	                        </dl>
	                        <dl>
	                            <dt>조회</dt>
	                            <dd>${ n.noticeNum }</dd>
	                        </dl>
	                    </div>
	                    <div class="text"> <!--글 내용-->
		                    <pre>${ n.noticeContent }</pre>
	                    </div>
	                </div>
	                <div class="bt_wrap">
	                    <c:if test="${ loginUser.mbId eq n.noticeAdminNo }">
	                    	<button class="buttons" type="button" id="updateForm">수정</button>
	                    	<button class="buttons" type="button" id="deleteConfirm">삭제</button>
	                    </c:if>
	                    <button class="on_1" type="button" onclick="location.href='${contextPath}/noticeList.hj?page=${ page }'">목록으로</button>
	                </div>
	            </div>
            </form>
        </div>
        
       
    </div>
    
    <script>
    	window.onload = () =>{
    		const update = document.getElementById('updateForm');
    		const form = document.getElementById('detailNotice');
    		
    		if(update != null) {
    			update.addEventListener('click', () => {
    				form.action="${contextPath}/updateForm.hj";
    				form.submit();
    			});
    		}
    		
    		const del = document.getElementById('deleteConfirm');
    		del.addEventListener('click', () => {
    			const yes = window.confirm("정말 삭제하시겠습니까?");
    			if(yes) {
    				window.alert("정상적으로 공지사항이 삭제되었습니다.");
    				form.action = '${contextPath}/deleteNotice.hj';
    				form.submit();
    			}
    		});
    		
    	}
    </script>
    <jsp:include page="../../views/common/footer.jsp" />
</body>
</html>