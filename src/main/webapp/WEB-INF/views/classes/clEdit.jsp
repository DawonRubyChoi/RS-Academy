<%@ page language="java" contentType="text/html; charset=UTF-8 "
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>강의 수정</title>
<title>Masonry example · Bootstrap v5.2</title>
<link href="${pageContext.request.contextPath}/resources/css/modal.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/clWrite.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap" rel="stylesheet"> 
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- 부트스트랩 -->

</head>
<body>
	<jsp:include page="../../views/common/top.jsp" />
	<div>
	<form action="${ contextPath }/updateClass.yh" id="classUpdateForm" enctype="multipart/form-data" method="POST" onsubmit="return checkFile()">
		<div class="container">	   
			<div class="board_wrap">
				<div class="board_title">
					<strong>강의 수정</strong>			
				</div>
				<div class="board_write_wrap">
					<div class="board_write">
						<div class="title">
							<input type="hidden" name="clNo" value="${c.clNo}">
							<input type="hidden" name="clImage" value="${c.clImage}">
							<dl>
								<dt>강의명</dt>
								<dd><input type="text" placeholder="강의명" name="clTitle" value="${ c.clTitle }" required="required"></dd>
							</dl>
							<br>
							<dl>
								<dt>강의 시작일</dt>
								<dd><input type="date" name="clStartdate" value="${ c.clStartdate }" required></dd>
							</dl>
							<br>
							<dl>
								<dt>강의 종료일</dt>
								<dd><input type="date" name="clEnddate" value="${ c.clEnddate }" required></dd>
							</dl>
							<br>
							<dl>
								<dt>레벨</dt>
								<dd>
									<select name="clLevel">
									
										<c:if test="${ c.clLevel == 'A' }">
											<option value="A" selected="selected"> A </option>
								        	<option value="B"> B </option>
								       		<option value="C"> C </option>	
										</c:if>
										<c:if test="${ c.clLevel == 'B' }">
											<option value="A"> A </option>
								        	<option value="B" selected="selected"> B </option>
								       		<option value="C"> C </option>	
										</c:if>
										<c:if test="${ c.clLevel == 'C' }">
											<option value="A"> A </option>
								        	<option value="B"> B </option>
								       		<option value="C" selected="selected"> C </option>	
										</c:if>
								        
								        				        
									</select>
								</dd>
							</dl>
							<br>
							<dl>
								<dt>수강료</dt>
								<dd><input type="number" name="clPrice" value="${ c.clPrice }" required></dd>
							</dl>
							<br>
							<dl>
								<dt>강의소개</dt>
								<dd><textarea name="clIntro"  required>${ c.clIntro } </textarea></dd>
							</dl>
							<br>
							<dl>
								<dt>카테고리</dt>
								<dd>
									<select name="clCategory">
										
										<c:if test="${ c.clCategory == '한식' }">
											<option value="한식" selected="selected"> 한 식 </option>
									        <option value="양식"> 양 식 </option>
									        <option value="일식"> 일 식 </option>
									        <option value="베이커리"> 베이커리</option>	
										</c:if>
										<c:if test="${ c.clCategory == '양식' }">
											<option value="한식"> 한 식 </option>
									        <option value="양식" selected="selected"> 양 식 </option>
									        <option value="일식"> 일 식 </option>
									        <option value="베이커리"> 베이커리</option>	
										</c:if>
										<c:if test="${ c.clCategory == '일식' }">
											<option value="한식"> 한 식 </option>
									        <option value="양식"> 양 식 </option>
									        <option value="일식" selected="selected"> 일 식 </option>
									        <option value="베이커리"> 베이커리</option>	
										</c:if>
										<c:if test="${ c.clCategory == '베이커리' }">
											<option value="한식"> 한 식 </option>
									        <option value="양식"> 양 식 </option>
									        <option value="일식"> 일 식 </option>
									        <option value="베이커리" selected="selected"> 베이커리</option>	
										</c:if>							        
								        				        
									</select>							
								</dd>
							</dl>
							<br>
							<dl>
								<dt>정원</dt>
								<dd><input type="number" name="clNum" value="${ c.clNum }" required></dd>
							</dl>
							<br>
							<dl>
								<dt>대표사진</dt>
								<dd>
									<div id="image" style="display: inline-block;" >
										<label for="oriPic">기존 사진 : </label>
										<a href="${contextPath}/resources/uploadClassPic/${c.clImage}">${c.clImage}</a>
                           				<div><img id="oriPic" style="width: 150px;" src="${contextPath}/resources/uploadClassPic/${c.clImage}"></div>
									</div>
									<div style="display: inline-block;" >
										<div style="display: none; " id="fileDiv">
											<label for="fileInpu">변경 사진 : </label>
											<input type="file" name="file" id="fileInput">
											<div><img style="width: 150px;" id="newPic"></div>
										</div>
									</div>
									<button class="im" type="button" id="updatePic" style="display: inline-block;">사진변경</button>
								</dd>
							</dl>
							<br>
							<dl>
								<dt>담당강사</dt>
								<dd>									
									<select name="clId">
										<c:forEach var="member" items="${ member }">
											<option value="${ member.mbId }"  <c:if test ="${member.mbId eq c.clId}">selected="selected"</c:if>> ${ member.mbName } </option>								     
								        </c:forEach>
								        
									</select>										
								</dd>
							</dl>
						</div>						
						<div class="bt_wrap">						
							<button class="bbb" type="submit" id="updateButton">수정</button>
							<button class="back" type="button" onclick="javascript:history.back();">취소</button>							
							
							<button class="on" id="modalOpen" type="button">삭제</button>		
						</div>
						
						<div id="modalContainer" class="hidden">
							<div id="modalContent" class="modalContentCss">
						    	<br>
						    	<h1>&emsp;&emsp;정말 삭제하시겠습니까?</h1>
						    	<br>	
						    	&emsp;&emsp;&emsp;&emsp;
							    <button id="delete" type="button" class="delete">삭제</button>
							    &emsp;&emsp;&emsp;&emsp;
							    <button id="modalClose" type="button" class="modalClose">닫기</button>	
							    						    
							</div>
						</div>	

					</div>
				</div>
			</div>
		</div>
	</form>
						
	



	</div>
	
	<script >
		function checkFile(){
			
			if(bCheckFile){
				return true;
			}else{
				alert("클래스 사진이 지정되지 않았습니다.");
				return false;
			}
			
		}
		
	
	
	</script>
	
	
	<script>		
		let updatePicClicked = false;
		let bCheckFile=false;
		window.onload = () => {
			const form = document.getElementById('classUpdateForm');
			const fileInput = document.getElementById('fileInput');
			
			
			const newPic = document.getElementById('newPic');
			const fileDiv = document.getElementById('fileDiv');
			
			document.getElementById('updatePic').addEventListener('click', function() {
				fileDiv.style.display = 'block';
				image.style.display = 'none';
				this.style.display = 'none';
				updatePicClicked = true;			
			});
			
			fileInput.addEventListener('change', function(){
				if(fileInput.files.length > 0){
					const selectedFile = fileInput.files[0];
					const objectURL = URL.createObjectURL(selectedFile);
					newPic.src = objectURL;
				} else{
					newPic.src = "${contextPath}/resources/upoloadClassPic/${c.clImage}";
				}				
			
			});
			
			
			
			
			
			document.getElementById('updateButton').addEventListener('click', () => {
				if (updatePicClicked){
					if(fileInput.files.length <= 0) {
						bCheckFile=false;
					} else {
						form.action = '${contextPath}/updateClass.yh';
						bCheckFile=true;
					}
				} else{
					form.action = '${contextPath}/updateClass.yh';
					bCheckFile=true;
				}
			});
			
			
			
			document.getElementById('delete').addEventListener('click', () =>{
				form.action = '${contextPath}/deleteClass.yh'
				form.submit();
			});		
			
			
			

			const modalOpenButton = document.getElementById('modalOpen');
			const modalCloseButton = document.getElementById('modalClose');
			const modal = document.getElementById('modalContainer');

			modalOpenButton.addEventListener('click', () => {
			  modal.classList.remove('hidden');
			});

			modalCloseButton.addEventListener('click', () => {
			  modal.classList.add('hidden');
			});
			
			
		}	

	</script>
<jsp:include page="../../views/common/footer.jsp" />
</body>
</html>