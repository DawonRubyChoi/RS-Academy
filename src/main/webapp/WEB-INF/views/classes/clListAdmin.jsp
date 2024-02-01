<%@ page language="java" contentType="text/html; charset=UTF-8 "
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>강의관리</title>
<link href="${pageContext.request.contextPath}/resources/css/clListAdmin.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="../../views/common/top.jsp" />
	
	<div class="board_wrap">
		<div class="board_title">
			<strong>강의 조회 및 수정</strong>			
		</div>
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top"> 
					<div class = "clNo">번호</div>
					<div class = "clTitle">강의명</div>
					<div class = "clId">담당강사</div>
					<div class = "clCategory">카테고리</div>
					<div class = "clLevel">레벨</div>	
					<div class = "cl">정원</div>					
				</div>
				<c:forEach var="list" items="${ list }">
					<div style="cursor: pointer;" class="clList" >
						<div class = "clNo">${ list.clNo }</div>
						<div class = "clTitle">${ list.clTitle }</div>
						<div class = "clId">${ list.clId }</div>
						<div class = "clCategory">${ list.clCategory }</div>
						<div class = "clLevel">${ list.clLevel }</div>	
						<div class = "cl">${ list.clNum }</div>					
					</div>
				</c:forEach>		
			</div>		
			<div class="bt_wrap">
				<a href="${contextPath}/writeClass.yh" class="on">강의 추가</a>				
			</div>
		</div>
	</div>
	
	 <script>
         window.onload = () => {
             const lists = document.querySelectorAll('.clList');

             for (const list of lists) {
                 list.addEventListener('click', function () {
                     const clNoElement = list.querySelector('.clNo');

                     const clNo = clNoElement.textContent;

                     location.href = "${contextPath}/updateForm.yh?clNo=" + clNo ;
                 });
             }
             
             
             
             
             
         }
         
     </script>	
	

</body>
<jsp:include page="../../views/common/footer.jsp" />
</html>
