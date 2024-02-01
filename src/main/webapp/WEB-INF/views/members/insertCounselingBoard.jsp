<%@ page language="java" contentType="text/html; charset=UTF-8 "
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>상담 내용 등록</title>
<link href="${pageContext.request.contextPath}/resources/css/css.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap"
	rel="stylesheet">
</head>
<jsp:include page="../../views/common/top.jsp" />
<body>
	<form action="insertCounselingBoard.dw" method="POST">
		<div class="container">
			<div class="board_wrap">
				<div class="board_title">
					<strong>1:1 상담</strong>
					<p>1:1 상담 페이지입니다. 문의 사항을 남겨주세요.</p>
				</div>
				<div class="board_write_wrap">
					<!-- 1.보드 리스트 2. 페이지영역 3. 버튼 영역 wrap으로 감쌈 -->
					<div class="board_write">
						<div class="title">
							<dl>
								<dt>제목</dt>
								<dd>
									<input type="text" placeholder="제목을 입력해주세요." name="cbTitle">
								</dd>
							</dl>
						</div>
						<div class="info">
							<dl>
								<dt>글쓴이</dt>
								<dd>${ loginUser.mbName }</dd>
							</dl>
						</div>
						<div class="cont">
							<textarea placeholder="내용을 입력해주세요." name="cbContent"></textarea>
						</div>
						<div class="bt_wrap">
							<button class="on">WRITE</button>
							<button class="on_1">CANCLE</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
<jsp:include page="../../views/common/footer.jsp" />
</html>