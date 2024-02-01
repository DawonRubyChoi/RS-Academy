<%@ page language="java" contentType="text/html; charset=UTF-8 "
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="${pageContext.request.contextPath}/resources/css/find.css"
   rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
   <form action="findId.dw" method="post">
      <jsp:include page="../../views/common/top.jsp" />
      <div class="container">
         <div class="find-wrap">
         <h2>FIND ID</h2>
            <div class="find-info">
               <dl>
                  <dt>이름</dt>
                  <dd><input type="text" placeholder="ex) 홍길동" name="mbName" required></dd>            
               </dl>
               <dl>
                  <dt>이메일</dt>
                  <dd class="email-section">
                          <input type="email" placeholder="ex) rsacademy@naver.com" class="find-email" name="mbEmail" required>
                      </dd>
               </dl>
               <div class="check-bt">
                  <button onclick="${contextPath}/findId.dw" class="confirm">확인</button>
                  <a href="javascript:history.back(+1)" class="cancel">뒤로가기</a>
               </div>
            </div>
         </div>
      </div>
   </form>
</body>
   <jsp:include page="../../views/common/footer.jsp" />
</html>