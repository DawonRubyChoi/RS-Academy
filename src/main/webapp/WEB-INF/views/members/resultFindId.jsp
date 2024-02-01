<%@ page language="java" contentType="text/html; charset=UTF-8 "
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
<link href="${pageContext.request.contextPath}/resources/css/find.css"
   rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
     <jsp:include page="../../views/common/top.jsp" />
     <div class="container">
	     <div class="result-wrap">
	     	<c:if test="${ result.mbName ne null }">
				<h2>아이디 조회 결과</h2>
				<p>${ result.mbName }님의 아이디는</p>
				<p style="font-weight: 600;">${ result.mbId }</p>
				<p>입니다.</p>
			</c:if>
			<c:if test="${ result.mbName eq null }">
				<h2>아이디 조회 결과</h2>
		    	<p>존재하는 아이디가 없습니다.</p>
			</c:if>
		</div>
	</div>
</body>
   <jsp:include page="../../views/common/footer.jsp" />
</html>