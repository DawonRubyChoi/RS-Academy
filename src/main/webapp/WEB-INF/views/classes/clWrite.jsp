<%@ page language="java" contentType="text/html; charset=UTF-8 "
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>강의 추가</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap" rel="stylesheet">
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/clWrite.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../../views/common/top.jsp" />
	<form action="${ contextPath }/insertClass.yh" enctype="multipart/form-data" id="classInsertForm" method="POST" onsubmit="return checkFile()">
		   <div class="container">
			<div class="board_wrap">
				<div class="board_title">
					<strong>강의 추가</strong>			
				</div>
				<div class="board_write_wrap">
					<div class="board_write">
						<div class="title">
							<dl>
								<dt>강의명</dt>
								<dd><input type="text" placeholder="강의명" name="clTitle" required></dd>
							</dl>
							<br>
							<dl>
								<dt>강의 시작일</dt>
								<dd><input type="date" name="clStartdate" required></dd>
							</dl>
							<br>
							<dl>
								<dt>강의 종료일</dt>
								<dd><input type="date" name="clEnddate" required></dd>
							</dl>
							<br>
							<dl>
								<dt>레벨</dt>
								<dd>
									<select name="clLevel">
										<option value="A"> A </option>
								        <option value="B"> B </option>
								        <option value="C"> C </option>						        
									</select>
								</dd>
							</dl>
							<br>
							<dl>
								<dt>수강료</dt>
								<dd><input type="number" name="clPrice" placeholder="수강료" required></dd>
							</dl>
							<br>
							<dl>
								<dt>강의소개</dt>
								<dd><textarea name="clIntro" required></textarea></dd>
							</dl>
							<br>
							<dl>
								<dt>카테고리</dt>
								<dd>
									<select name="clCategory">
										<option value="한식"> 한 식 </option>
								        <option value="양식"> 양 식 </option>
								        <option value="일식"> 일 식 </option>
								        <option value="베이커리"> 베이커리</option>						        
									</select>							
								</dd>
							</dl>
							<br>
							<dl>
								<dt>정원</dt>
								<dd><input type="number" name="clNum" value="20" required></dd>
							</dl>
							<br>
							<dl>
								<dt>대표사진</dt>
								<dd><input type="file" name="file"></dd>
							</dl>
							<br>
							<dl>
								<dt>담당강사</dt>
								<dd>
									<select name="clId">
										<c:forEach var="member" items="${ member }">
											<option value="${ member.mbId }"> ${ member.mbName } </option>								     
								        </c:forEach>													        
									</select>	
								</dd>
							</dl>
						</div>						
						<div class="bt_wrap">						
							<button class="aaa" id="submitClass" type="submit">등록</button>
							<button class="back" type="button" onclick="javascript:history.back();">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<jsp:include page="../../views/common/footer.jsp" />
	
	
	

	<script>		
	
		
		
			
			
			
			function checkFile(){
					const files = document.getElementsByName('file');
					let isEmpty = true;
					
					for(const f of files) {
						
						if(f.value != ''){
							isEmpty = false;
						}
					}
				
				if(isEmpty) {
					alert("클래스 사진이 지정되지 않았습니다.");
					return false;
				} else {
					return true;
				}
			}

		
		

	</script>

</body>
</html>