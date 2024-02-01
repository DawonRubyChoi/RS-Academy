<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레벨 테스트</title>
<link href="${contextPath}/resources/css/css.css" rel="stylesheet">
<link href="${contextPath}/resources/css/levelTest.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="../../common/top.jsp" />
	<div class="container">
		<div class="levelTest">
			<h2>RS LEVEL TEST</h2>
			<form action="${ contextPath }/levelTestResult.rs" method="post" id="test">
				<c:forEach items="${ list }" var="l" varStatus="status">
					<input type="hidden" value="${ l.ltAnswer }" name="ltAnswer">
					<table>
						<tr>
							<th colspan="2">${ status.count }. ${ l.ltTitle }</th>
						</tr>
						<tr>
							<td><input type="radio" name="userAnswer${ status.count }" value="1" id="answer${ status.count }_1" required="required"></td>
							<td><label for="answer${ status.count }_1">${ l.ltNo1 }</label></td>
						</tr>
						<tr>
							<td><input type="radio" name="userAnswer${ status.count }" value="2" id="answer${ status.count }_2"></td>
							<td><label for="answer${ status.count }_2">${ l.ltNo2 }</label></td>
						</tr>
						<tr>
							<td><input type="radio" name="userAnswer${ status.count }" value="3" id="answer${ status.count }_3"></td>
							<td><label for="answer${ status.count }_3">${ l.ltNo3 }</label></td>
						</tr>
						<tr>
							<td><input type="radio" name="userAnswer${ status.count }" value="4" id="answer${ status.count }_4"></td>
							<td><label for="answer${ status.count }_4">${ l.ltNo4 }</label></td>
						</tr>
					</table>
				</c:forEach>
				
				<div class="bt_wrap">
					<input type="submit" value="제출" id="submit">
					<a href='' class="on_1" id="goMain">메인</a>
				</div>
			</form>
		</div>
		<jsp:include page="../../common/footer.jsp" />
	</div>
	
</body>
</html>