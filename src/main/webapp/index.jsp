<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>RS 요리학원</title>
<c:set value="${ pageContext.servletContext.contextPath }"
	var="contextPath" scope="application" />
<link rel="stylesheet" href="${contextPath}/resources/css/mainStyle.css">
<link href="${contextPath}/resources/css/mainStyleTop.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>
				<a href="index.jsp">RS ACADEMY</a>
			</h1>
			<div class="nav">
				<ul>
					<c:if test="${ loginUser.mbIsAdmin == 3}">
		            	<li class="dropdown">
		                    <div class="big-menu">관리자</div>
		                    <div class="small-menu">
		                     <a href="adminMember.jy">회원 관리</a>
		                     <a href="${contextPath}/levelTestManagement.rs">레벨테스트 관리</a>
		                     <a href="${contextPath}/clListAdmin.yh">강의 관리</a>
		                    </div>
		                 </li>
                   </c:if>
					<li class="dropdown">
						<div class="big-menu">회원</div>
						<div class="small-menu">
							<a href="${ contextPath }/myInfo.jy">마이페이지</a> <a href="${ contextPath }/counseling.dw">1:1 상담게시판</a>
						</div>
					</li>
					<li class="dropdown">
						<div class="big-menu">강사</div>
						<div class="small-menu">
							<a href="${contextPath}/portList.hj">포트폴리오</a> <a href="${contextPath}/noticeList.hj">공지사항</a>
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



		<div class="center">
			<h2>Cooking Class</h2>
			<p>RS Academy will be enrich and improve all of our lives</p>
			<a href="${contextPath}/clListView.yh">
 			 <button>WATCH MORE</button>
			</a>
		</div>
	</div>


	<div class="container2">
		<div id="main">
			<hr class="hr-1">

			<h2>POPULAR CLASS</h2>
			<h4>RS요리학원의 대표 클래스를 소개합니다.</h4>
			<div id="popularClassPic">
				<div class="card card-2">
					<img src="${contextPath}/resources/pic/ko (13).PNG" />
					<div class="popularClassDiv">한식A</div>
				</div>
				<div class="card card-2">
					<img src="${contextPath}/resources/pic/je (3).jpg" />
					<div class="popularClassDiv">일식B</div>
				</div>
				<div class="card card-2">
					<img src="${contextPath}/resources/pic/we (1).jpg" />
					<div class="popularClassDiv">양식C</div>
				</div>
			</div>



			<hr class="hr-1">

			<div class="review">
				<h2>STUDENT REVIEWS</h2>
				<h4>수강생들이 전하는 생생한 교육후기 입니다.</h4>
				<blockquote>
					<div class="blockquote-background">
						<b>한식 C반 최재영 학생</b>
						<p>
							안녕하세요, "RS요리학원" 최다원 선생님 수업을 수강한 수강생입니다. 저는 요.알.못입니다. 요리학원을 알아보다가<br>
							요즘 가장 핫한 RS요리학원에 등록하게 되었습니다. 수업을 들어보니 선생님께서 열정적으로 가르쳐주셔서 <br>
							재밌게 요리를 배울 수 있었습니다. 저는 정말 초보였는데, 선생님께서 항상 잘했다며 칭찬해주셔서 자신감을 얻었습니다.
						</p>
					</div>
				</blockquote>
				<br> <br> <br>
				<blockquote>
					<div class="blockquote-background">
						<b>양식 C반 임화진 학생</b>
						<p>
							정말 흥미롭고 보람찬 수업이었어요. 원래 양식반을 들었는데 이번에 새로 일식반에 등록할 계획입니다.<br>
							수강료가 아깝지 않은 알찬 수업이었습니다. 최루비 선생님 짱짱!
						</p>
					</div>
				</blockquote>
				<br> <br> <br>
				<blockquote>
					<div class="blockquote-background">
						<b>일식 C반 변윤호 학생</b>
						<p>
							모든 재료를 직접 손질하고 요리할 수 있었고 세심하고 꼼꼼하게 잘 알려주셔서 많은 도움이 됐어요!<br>
							최근에 자격증 취득에 성공했습니다. 최치즈 선생님 덕분입니다. 감사합니다. 선생님의 팬이 됐습니다.
						</p>
					</div>
				</blockquote>
			</div>

			<hr class="hr-1">

			<h2>FACILITIES</h2>
			<h4>우리에게 영감을 주는 특별한 공간을 소개합니다.</h4>
			<div id="classpic">
				<div class="facility">
					<img src="${contextPath}/resources/pic/class1.PNG" />
				</div>
				<div class="facility">
					<img src="${contextPath}/resources/pic/class2.PNG" />
				</div>
				<div class="facility">
					<img src="${contextPath}/resources/pic/class3.PNG" />
				</div>
			</div>

			<hr class="hr-1">

			<div id="foodPic">
				<h2>PORTFOLIO</h2>
				<h4>RS요리학원의 생생한 현장 이야기를 보여 드립니다.</h4>
				<table>
					<tr>
						<td>
							<div class="gmd gmd-4">
								<img src="${contextPath}/resources/pic/cook10.png" />
							</div>
						</td>
						<td>
							<div class="gmd gmd-4">
								<img src="${contextPath}/resources/pic/cook14.png" />
							</div>
						</td>
						<td>
							<div class="gmd gmd-4">
								<img src="${contextPath}/resources/pic/cook6.png" />
							</div>
						</td>
						<td>
							<div class="gmd gmd-4">
								<img src="${contextPath}/resources/pic/cook11.png" />
							</div>
						</td>
						<td>
							<div class="gmd gmd-4">
								<img src="${contextPath}/resources/pic/cook16.png" />
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="gmd gmd-4">
								<img src="${contextPath}/resources/pic/cook7.png" />
							</div>
						</td>
						<td>
							<div class="gmd gmd-4">
								<img src="${contextPath}/resources/pic/cook13.png" />
							</div>
						</td>
						<td>
							<div class="gmd gmd-4">
								<img src="${contextPath}/resources/pic/cook9.png" />
							</div>
						</td>
						<td>
							<div class="gmd gmd-4">
								<img src="${contextPath}/resources/pic/cook15.png" />
							</div>
						</td>
						<td>
							<div class="gmd gmd-4">
								<img src="${contextPath}/resources/pic/cook8.png" />
							</div>
						</td>
					</tr>
				</table>
			</div>

			<hr class="hr-1">

			<div id="partnership">
				<h2>PARTNERSHIP</h2>
				<img src="${contextPath}/resources/pic/partnership.png" />
			</div>

		</div>
	</div>

	<jsp:include page="WEB-INF/views/common/footer.jsp" />
</body>
</html>