<%@ page language="java" contentType="text/html; charset=UTF-8 "
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>강의리스트</title>
<link href="${pageContext.request.contextPath}/resources/css/clListDetail.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/modal.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

	<style>
		.clNo { display: none; }		
	</style>
</head>
<body>
	
	<jsp:include page="../../views/common/top.jsp" />

	<div class="board_wrap">
		
					
		<div class="board_title">
			<strong>수강 신청</strong>
		</div>				
		<br><br><br><br>		
		<form>
			<div id=list_head>
				<table  border="1" id="sub_list">
					<tr class="tr" >
						<th class="clNo" ></th>
						<th class="list2" height="40px">클래스</th>
						<th class="list3">레벨</th>
						<th class="list4">강의명</th>
						<th class="list5">수강기간</th>
						<th class="list6">강사</th>
						<th class="list7">정원</th>
						<th class="list8">수강료</th>					
						<th class="list9">신청</th>						
					</tr>							
					
					<c:forEach var="list" items="${ list }">
						<tr class="clList" >
							<td class = "clNo">  ${ list.clNo } </td>
							
							<td height="60px">${ list.clCategory }</td>						
							
							<c:if test="${ list.clLevel.equals('A') }">
								<td>입문</td>
							</c:if>
							<c:if test="${ list.clLevel.equals('B') }">
								<td>중급</td>
							</c:if>
							<c:if test="${ list.clLevel.equals('C') }">
								<td>고급</td>
							</c:if>							
							
							<td>${ list.clTitle } </td>
							<td>${ list.clStartdate } ~ ${ list.clEnddate }</td>
							
							<td>${ list.clId }</td>							
							
							<td>${ list.clNum }</td>
							<td>${ list.clPrice }&#8361;</td>
							
							<c:if test="${ loginUser.mbIsAdmin.equals('3') }">
								<td rowspan="2" style="border-bottom: none"><input type ="button" value="수 정" class="list_btn_1" id="edit"/></td>	
							</c:if>
							
							<c:if test="${ loginUser.mbIsAdmin.equals('2') }">
								<td rowspan="2" style="border-bottom: none"><input type ="button" value="신 청" class="list_btn_1" disabled/></td>	
							</c:if>
							
							<c:if test="${ loginUser.mbIsAdmin.equals('1') }">								
								<c:set var="check" value="true"/>			
								<c:forEach var="classList" items="${ classList }">		
									<c:if test="${ (classList.csId eq loginUser.mbId) && (classList.csCode eq clNo) }">														
										<td rowspan="2" style="border-bottom: none">
											<input type ="button" value="신청중" class="list_btn_1" id="Application" disabled style="background-color: #655345"/> 
										</td>										
										<c:set var="check" value="false"/>
									</c:if>
								</c:forEach>								
								<c:if test="${check == true}">
									<td rowspan="2" style="border-bottom: none">
										<input type ="button" value="신 청" class="list_btn_1" id="user"/> 
									</td>
								</c:if>																	
							</c:if>													
							<c:if test="${ loginUser.mbIsAdmin == null }">
								<td rowspan="2" style="border-bottom: none"><input type ="button" value="신 청" class="list_btn_1" id="nouser"/></td>	
							</c:if>											
						</tr>	
						<tr style="border-bottom: none;">
							<td >강의소개</td>
							<td colspan="7"  height="100px" >${ list.clIntro } </td>	
							<td ></td>					
						</tr>												
					</c:forEach>					
				</table>	
				
				<c:forEach var="list" items="${ list }">
					<c:if test="${ list.clCategory.equals('한식') }">
						<div id = "introimage">
							<img src="${pageContext.request.contextPath}/resources/pic/kintro.jpg" class="intro" style="width: 84%; height: auto;">
						</div>	
					</c:if>
					<c:if test="${ list.clCategory.equals('양식') }">
						<div id = "introimage">
							<img src="${pageContext.request.contextPath}/resources/pic/wintro.jpg" class="intro" style="width: 84%; height: auto;">
						</div>	
					</c:if>
					<c:if test="${ list.clCategory.equals('일식') }">
						<div id = "introimage">
							<img src="${pageContext.request.contextPath}/resources/pic/jintro.jpg" class="intro" style="width: 84%; height: auto;">
						</div>	
					</c:if>
					<c:if test="${ list.clCategory.equals('베이커리') }">
						<div id = "introimage">
							<img src="${pageContext.request.contextPath}/resources/pic/bintro.jpg" class="intro" style="width: 84%; height: auto;">
						</div>	
					</c:if>	
				</c:forEach>
			</div>
			
			<div class="bt_wrap">						
				<button class="back" type="button" onclick="javascript:history.back();">강의목록</button>										
			</div>
			
		</form>		
		
	</div>	
	
	
	<c:if test="${ loginUser.mbIsAdmin.equals('1') }">
		<div id="modalContainer" class="hidden">
			<div id="modalContent">
			<br>
				<h1>&emsp;&emsp;수강신청하시겠습니까?</h1>
				<br>	
				&emsp;&emsp;&emsp;&emsp;
				<button id="apply" type="button" class="apply">확인</button>
				 &emsp;&emsp;&emsp;&emsp;
				<button id="modalClose" type="button" class="modalClose">취소</button>
			</div>
		</div>
	</c:if>
	
	<c:if test="${ loginUser.mbIsAdmin == null }">
		<div id="modalContainer" class="hidden">
			<div id="modalContent">
			<br>
				<h1>&emsp;&emsp;로그인하시겠습니까?</h1>
				<br>	
				&emsp;&emsp;&emsp;&emsp;
				<button id="apply" type="button" class="apply">로그인</button>
				 &emsp;&emsp;&emsp;&emsp;
				<button id="modalClose" type="button" class="modalClose">취소</button>
			</div>
		</div>
	</c:if>
	
	<jsp:include page="../../views/common/footer.jsp" />

	<script>    
	    window.onload = () => {	    	
	    	const lists = document.querySelectorAll('.clList');
	    	const edit = document.getElementById('edit');
	    	const user = document.getElementById('user');
	    	const nouser = document.getElementById('nouser');
	    	
	    	const modalCloseButton = document.getElementById('modalClose');
	    	const modal = document.getElementById('modalContainer');	  
	    	
	    	
	    	if(edit != null) {
	    		for (const list of lists) {
					document.getElementById('edit').addEventListener('click', () =>{
						
					const clNoElement = list.querySelector('.clNo');
		    				
					const clNo = clNoElement.textContent;
					
					location.href = "${contextPath}/classApply.yh?clNo=" + clNo ;
					});
	    		}
			}	    	
	    	
	    	
			if(user != null){
				
		    	for (const list of lists) {
		            list.addEventListener('click', function () {	            	
		            	modal.classList.remove('hidden');
		            });
		        }	        
			
				modalCloseButton.addEventListener('click', () => {
					modal.classList.add('hidden');
				});			
			
		        for (const list of lists) {
					document.getElementById('apply').addEventListener('click', () =>{
						
					const clNoElement = list.querySelector('.clNo');
		    				
					const clNo = clNoElement.textContent;
	
					location.href = "${contextPath}/classApply.yh?clNo=" + clNo ;
					});
				}
			}
			
			
			if(nouser != null){
		    	for (const list of lists) {
		            list.addEventListener('click', function () {	            	
		            	modal.classList.remove('hidden');
		            });
		        }
		    	
		    	modalCloseButton.addEventListener('click', () => {
					modal.classList.add('hidden');
				});
			
		        for (const list of lists) {
					document.getElementById('apply').addEventListener('click', () =>{
						
					const clNoElement = list.querySelector('.clNo');
		    				
					const clNo = clNoElement.textContent;
	
					location.href = "${contextPath}/classApply.yh?clNo=" + clNo ;
					});
				}
			}
			
			
		}	    
	    
	</script>

</body>
</html>
