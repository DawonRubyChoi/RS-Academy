<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>1:1 상담 수정</title>
    <link href="${pageContext.request.contextPath}/resources/css/css.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap" rel="stylesheet">
</head>
<body>
    <jsp:include page="../../views/common/top.jsp" />
    <div class="board_wrap">
		<div class="board_title">
			<strong>1:1 상담</strong>
			<p>1:1 상담 페이지입니다. 문의 사항을 남겨주세요.</p>
		</div>
		<form action="${ contextPath }/editCounselingBoard.dw" method="POST">
			<div class="board_write_wrap">
				<div class="board_write">
					<div class="title">
						<dl>
							<dt>제목</dt>
							<dd>
								<input type="text" value="${ cb.cbTitle }" name="cbTitle">
								<input type="hidden" value="${cb.cbNo}" name="cbNo">
								<input type="hidden" value="${page}" name="page">
							</dd>
							
						</dl>
					</div>
						<div class="info">
							<dl>
								<dt>글쓴이</dt>
								<dd>${ cb.mbName }</dd>
							</dl>
						</div>
						<div class="cont">
							<textarea name="cbContent">${ cb.cbContent }</textarea>
					</div>
					<div class="bt_wrap">
						<input type="submit" class="on" value="EDIT">
						<input type="button" class="on_1" value="CANCLE">
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
    <jsp:include page="../../views/common/footer.jsp" />
</html>