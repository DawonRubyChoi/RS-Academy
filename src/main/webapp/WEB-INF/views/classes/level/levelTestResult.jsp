<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레벨 테스트 결과</title>
<link href="${contextPath}/resources/css/css.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/levelTest.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap" rel="stylesheet">
<style type="text/css">
	.levelTestResult img{ width: 150px; height: 110px; }
</style>
</head>
<body>
	<jsp:include page="../../common/top.jsp" />
	<div class="container">
		<div class="levelTestResult">
			<div id="title">레벨 테스트 결과</div>
			<div id="result">${resultNum}점</div>
			

			<table>
				<tr>
					<td colspan="4" id="td1">${loginUser.mbName}님께 추천 드리는 클래스<td>
				</tr>
				<tr>
					<td colspan="4" id="td2">사진 클릭시 해당 클래스의 상세 페이지로 이동합니다.</td>
				</tr>				
				<tr>
					<td class="td3" style="border-right: solid 1px #655345;">
						<a href="${contextPath}/selectClass.yh?clNo=${koClass.clNo}">
							<img src="${contextPath}/resources/uploadClassPic/${koClass.clImage}">
						</a>
					</td>
					<td class="td3" style="border-right: solid 1px #655345;">
						<a href="${contextPath}/selectClass.yh?clNo=${jeClass.clNo}">
							<img src="${contextPath}/resources/uploadClassPic/${jeClass.clImage}">
						</a>
					</td>
					<td class="td3" style="border-right: solid 1px #655345;">
						<a href="${contextPath}/selectClass.yh?clNo=${weClass.clNo}">
							<img src="${contextPath}/resources/uploadClassPic/${weClass.clImage}">
						</a>
					</td>
					<td class="td3">
						<a href="${contextPath}/selectClass.yh?clNo=${baClass.clNo}">
							<img src="${contextPath}/resources/uploadClassPic/${baClass.clImage}">
						</a>
					</td>				
					</tr>
				<tr>
					<td>${ koClass.clTitle }</td>
					<td>${ jeClass.clTitle }</td>					
					<td>${ weClass.clTitle }</td>
					<td>${ baClass.clTitle }</td>
				</tr>
			</table>
			<br>
			<div class="bt_wrap">
				<a href='index.jsp' class="on">이전</a>
			</div>
		</div>
	</div>
	<jsp:include page="../../common/footer.jsp" />
	
	
</body>
</html>