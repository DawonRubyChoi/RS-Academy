<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${contextPath}/resources/css/css.css" rel="stylesheet">
<link href="${contextPath}/resources/css/levelTest.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="../../common/top.jsp" />
	<div class="updateLevelTest">
		<form action="${ contextPath }/updateLevelTest.rs" method="POST">
			<input type="hidden" value="${ l.ltNo }" name="ltNo">
			<table>
				<tr>
					<th>질문</th>
					<th id="correctAnswer">정답
						<select name="ltAnswer">
							<option value="1" ${ l.ltAnswer == 1 ? 'selected' : '' }>1</option>
							<option value="2" ${ l.ltAnswer == 2 ? 'selected' : '' }>2</option>
							<option value="3" ${ l.ltAnswer == 3 ? 'selected' : '' }>3</option>
							<option value="4" ${ l.ltAnswer == 4 ? 'selected' : '' }>4</option>
						</select>
					</th>
				</tr>
				<tr>
					<td colspan="2" id="td2">
						<textarea name="ltTitle" rows="8" cols="70" style="resize: none;" required>${ l.ltTitle }</textarea>
					</td>
				</tr>
				<tr>
					<td id="td3">1번 : </td>
					<td>
						<input type="text" name="ltNo1" value="${ l.ltNo1 }" required>
					</td>
				</tr>
				<tr>
					<td>2번 : </td>
					<td>
						<input type="text" name="ltNo2" value="${ l.ltNo2 }" required>
					</td>
				</tr>
				<tr>
					<td>3번 : </td>
					<td>
						<input type="text" name="ltNo3" value="${ l.ltNo3 }" required>
					</td>
				</tr>
				<tr>
					<td>4번 : </td>
					<td>
						<input type="text" name="ltNo4" value="${ l.ltNo4 }" required>
					</td>
				</tr>
			</table>
			<div class="bt_wrap">
				<input type="submit" value="완료" id="submit">
				<a href='javascript:history.back();' class="on_1">이전</a>
			</div>
		</form>
	</div>
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>