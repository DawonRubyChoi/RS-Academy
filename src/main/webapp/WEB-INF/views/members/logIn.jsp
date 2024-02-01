<%@ page language="java" contentType="text/html; charset=UTF-8 "
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="${pageContext.request.contextPath}/resources/css/logIn.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="../../views/common/top.jsp" />
		<form action="logIn.dw" method="post">
			<div class="container">
				<div class="login-wrap">
					<h2>LogIn</h2>
					<div class="login-info">
						<dl>
							<dt>ID</dt>
							<dd><input type="text" name="mbId"></dd>				
						</dl>
						<dl>
							<dt>PASSWORD</dt>
							<dd><input type="password" name="mbPwd"></dd>
						</dl>
						<div class="login-bt">
							<button type="submit" class="test">LOGIN</button>
						</div>
						
						<div class="login-other">
							<a href="${contextPath}/findIdView.dw">아이디 찾기</a>
							or
							<a href="${contextPath}/findPwdView.dw">비밀번호 찾기</a>
						</div>
						<div class="benefit-title">
							<h3>RS요리학원의 회원이 되어보세요!</h3>
						</div>
						<div class="benefit-cont">
							삶을 더 풍요롭게 만들 수 있도록<br>
							RS요리학원이 함께하겠습니다!<br>
							지금 바로 가족이 되어주세요!<br>				 
						</div>
						<a href="${contextPath}/enrollView.jy">
						<div class="sign-bt">SIGN UP</div>
						</a>
					</div>
				</div>
			</div>
		</form>
	</body>
	<jsp:include page="../../views/common/footer.jsp" />
</html>
