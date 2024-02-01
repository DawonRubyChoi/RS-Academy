<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레벨 테스트 안내</title>
<link href="${contextPath}/resources/css/levelTest.css" rel="stylesheet">
<link href="${contextPath}/resources/css/css.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="../../common/top.jsp" />
	<div class="container">
		<div class="levelTestExplanation">

			<div id="title">레벨 테스트 안내</div>

			<p>
				본 페이지는 RS 요리학원에서 제공하는 레벨 테스트 공간입니다.<br>
				이 테스트는 총 20문제로 구성되어 있으며, <br>
				요리 지식에 관한 다양한 문제들을 다룹니다.<br><br>
				테스트를 진행한 후 결과에 따라 맞춤형 강의를 추천해 드립니다.<br>

				아래의 버튼을 클릭하시면 테스트가 시작됩니다.<br><br>
				로그인 상태가 아닐 시 테스트를 진행할 수 없으므로<br>
				비회원은 로그인 페이지로 이동됩니다.
			</p>

			<div class="bt_wrap">
				<c:if test="${ !empty loginUser }">
					<a href='${ contextPath }/levelTest.rs' class="on">시작</a>
				</c:if>
				<c:if test="${ empty loginUser }">
					<a href='${ contextPath }/logInView.dw' class="on">시작</a>
				</c:if>
				<a href='index.jsp' class="on_1">이전</a>
			</div>
		</div>
		<jsp:include page="../../common/footer.jsp" />
	</div>
	
</body>
</html>