<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top</title>
<link href="${contextPath}/resources/css/top.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap" rel="stylesheet">
</head>
<body>
   <div class="header">
      <h1><a href="index.jsp">RS ACADEMY</a></h1>
         <div class="nav">
            <ul>
              	<c:if test="${ loginUser.mbIsAdmin == 3}">
	            	<li class="dropdown">
	                    <div class="big-menu">관리자</div>
	                    <div class="small-menu">
	                     <a href="${contextPath}/adminMember.jy">회원 관리</a>
	                     <a href="${contextPath}/levelTestManagement.rs">레벨테스트 관리</a>
	                     <a href="${contextPath}/clListAdmin.yh">강의 관리</a>
	                    </div>
	                 </li>
                 </c:if>
            
                 <li class="dropdown">
                    <div class="big-menu">회원</div>
                    <div class="small-menu">
                    <a href="${ contextPath }/myInfo.jy">마이페이지</a>
                     <a href="${ contextPath }/counseling.dw">1:1 상담게시판</a>
                    </div>
                 </li>
                    <li class="dropdown">
                    <div class="big-menu">강사</div>
                    <div class="small-menu">
                     <a href="${contextPath}/portList.hj">포트폴리오</a>
                     <a href="${contextPath}/noticeList.hj">공지사항</a>
                    </div>
                 </li>
                 <li class="dropdown">
                 <div class="big-menu">강의</div>
                    <div class="small-menu">
                     <a href="${contextPath}/clListView.yh">수강신청</a>
                     <a href="${contextPath}/levelTestExplanation.rs">레벨테스트</a>
                    </div>
                 </li>
                  <c:if test  = "${ !empty loginUser }" >
					<li>
						<div class="big-menu">
							<a href="${contextPath}/logOut.dw" class="bt-menu">로그아웃</a>
						</div>
					</li>
					</c:if>
					<c:if test = "${ empty loginUser }" >
					<li>
						<div class="big-menu">
							<a href="${contextPath}/logInView.dw" class="bt-menu">로그인</a>
						</div>
					</li>
					<li>
						<div class="big-menu">
							<a href="enrollView.jy" class="bt-menu">회원가입</a>
						</div>
					</li>
					</c:if>
            </ul>
      </div>
         
   </div>      
</body>
</html>