<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>1:1 상담 댓글 수정</title>
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
		<form action="${ contextPath }/counselingReplyEdit.dw" method="POST">
		<div class="board_view_wrap">
                <input type="hidden" value="${ cb.cbNo }" name="cbNo">
                <input type="hidden" value="${ cb.cbNo }" name="crCbNo">
				<input type="hidden" value="${ page }" name="page">
                    <!-- 화면 공통 : 회원글 정보 -->
                    <div class="board_view">
                        <div class="title">${ cb.cbTitle }</div>
                        <div class="info">
                            <dl>
                                <dt>번호</dt>
                                <dd>${ cb.cbNo }</dd>
                            </dl>
                            <dl>
                                <dt>글쓴이</dt>
                                <dd>${ cb.mbName }</dd>
                            </dl>
                            <dl>
                                <dt>작성일</dt>
                                <dd>${ cb.cbDate }</dd>
                            </dl>
                            <dl>
                                <dt>조회</dt>
                                <dd>${ cb.cbNum }</dd>
                            </dl>
                        </div>
                        <div class="text">${ cb.cbContent }</div>
                        
                         <div class="comment">
                                <h3>답변</h3>
                                <div class="comment_title">
                                    <div class="comment-info">
                                        <dl>
                                            <dt>번호</dt>
                                            <dd>${ cr.crNo }</dd>
                                        </dl>
                                        <dl>
                                            <dt>글쓴이</dt>
                                            <dd>${ cr.mbName }</dd>
                                        </dl>
                                        <dl>
                                            <dt>작성일</dt>
                                            <dd>${ cr.crDate }</dd>
                                        </dl>
                                    </div>
                                </div>
                                	<textarea class="comment-text" name="crContent">${ cr.crContent}</textarea>
                                </div>
						</div>
						<div class="bt_wrap">
							<input type="submit" class="on" value="EDIT">
							<input type="button" class="on_1" value="CANCLE">
						</div>
				</div>
		</form>
	</div>
</body>
    <jsp:include page="../../views/common/footer.jsp" />
</html>