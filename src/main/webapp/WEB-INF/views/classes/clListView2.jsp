<%@ page language="java" contentType="text/html; charset=UTF-8 "
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>강의리스트</title>
<link href="${pageContext.request.contextPath}/resources/css/clListView2.css" rel="stylesheet" type="text/css">
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
		<form action="${contextPath}/searchClass.yh" id="portForm" >				
			<div class="board_title" onclick="location.href='${contextPath}/clListView.yh';" style="cursor: pointer;">
				<strong>강의 선택</strong>
			</div>			
			
			<span class="slideshow-container">				
			<div class="display display-test2 area1">
			<br><br><br>						
				<div class="select"> 
					<b>맞춤 강의 선택</b> 
				</div>
				<br><br>
				<div class="radioclass_1">
					<label>클래스</label><br>
					<input type="checkbox" id="ko" name="Category" value="한식" class="Category" onclick='check1(this)'/>
					<label for="ko">한식</label>				
					<input type="checkbox" id="we" name="Category" value="양식" class="Category" onclick='check1(this)'/>
					<label for="we">양식</label>
					<input type="checkbox" id="jp" name="Category" value="일식" class="Category" onclick='check1(this)'/>
					<label for="jp">일식</label>
					<input type="checkbox" id="ba" name="Category" value="베이커리" class="Category" onclick='check1(this)'/>
					<label for="ba">베이커리</label>
				</div>
				<br>
				<div class="radioclass_2" style="display: inline-block;">
					<label>레벨</label><br>
					<input type='checkbox' id="A" name='Level' value='A' class="Level" onclick='check2(this)'/> 
					<label for="A">입문</label>				
					<input type='checkbox' id="B" name='Level'  value='B' class="Level" onclick='check2(this)'/>
					<label for="B">중급</label>
					<input type='checkbox' id="C" name='Level'  value='C' class="Level" onclick='check2(this)'/>
					<label for="C">고급</label>						
				</div>						
				
				
				&emsp;&emsp;&emsp;
				<div class="bt_wrap" style="display: inline-block;">	
					<button class="on" id="submitPort" style="display: inline-block;">검 색</button>	
				</div>	
					
				<input type="text" id="result1" class = "clNo" name="clCategory"/>
				<input type="text" id="result2" class = "clNo" name="clLevel"/>					
						
			</div>   			

				<div class="Slidesbackground">
					<div class="mySlides fade">
						<img src="${pageContext.request.contextPath}/resources/pic/cookslide.jpg" class="slideshow-image">
					</div>
					<div class="mySlides fade">
						<img src="${pageContext.request.contextPath}/resources/pic/breadslide.jpg" class="slideshow-image">
					</div>
					<div class="mySlides fade">
						<img src="${pageContext.request.contextPath}/resources/pic/jpslide.jpg" class="slideshow-image">
					</div>					
					<div class="mySlides fade">
						<img src="${pageContext.request.contextPath}/resources/pic/enslide.jpg" class="slideshow-image">
					</div>
					<div class="mySlides fade">
						<img src="${pageContext.request.contextPath}/resources/pic/fireslide.jpg" class="slideshow-image">
					</div>					
				</div>						
			</span>
		</form>	
		<br>
		<form>
			<div id=list_head>
				<table  border="1px" id="sub_list">
					<tr class="tr" >
						<th class="clNo"></th>
						<th class="list1">대표 사진</th>
						<th class="list2">클래스</th>
						<th class="list3">레벨</th>
						<th class="list4">강의명</th>
						<th class="list5">수강기간</th>
						<th class="list6">강사</th>
						<th class="list7">정원</th>
						<th class="list8">수강료</th>					
						<th class="list9">신청</th>						
					</tr>
					
					
					<c:forEach var="list" items="${ list }">
						<tr class="clList" style="cursor: pointer;">
							<td class = "clNo">  ${ list.clNo } </td>
							<td>
								<img src="${contextPath}/resources/uploadClassPic/${list.clImage}" id="oriPic" alt="한식"  class="classimg">								
							</td>
							<td>${ list.clCategory }</td>
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
							
								<td><input type ="button" value="신 청" class="list_btn_1" /></td>	
							
									
						</tr>	
					</c:forEach>						
								
				</table>							
			</div>
		</form>
	</div>		
		
	<jsp:include page="../../views/common/footer.jsp" />	

	<script>    
	    window.onload = () => {
	        const lists = document.querySelectorAll('.clList');
	
	        for (const list of lists) {
	            list.addEventListener('click', function () {
	                const clNoElement = list.querySelector('.clNo');
	
	                const clNo = clNoElement.textContent;
	
	                location.href = "${contextPath}/selectClass.yh?clNo=" + clNo ;
	            });
	        }
	    }
	    
	    
	    var slideIndex = 0;
	    showSlides();
	
	    function showSlides() {
	        var i;
	        var slides = document.getElementsByClassName("mySlides");
	       
	        for (i = 0; i < slides.length; i++) {
	            slides[i].style.display = "none";
	        }
	        slideIndex++;
	        if (slideIndex > slides.length) {
	            slideIndex = 1
	        }
	        slides[slideIndex - 1].style.display = "block";
	    
	        setTimeout(showSlides, 2000); // 2초마다 이미지가 체인지됩니다
	    }
	  
	    function check1(chk){
		  	var obj = document.getElementsByName("Category");
		  	for(var i=0; i<obj.length; i++){
			    if(obj[i] != chk){
			    obj[i].checked = false;
		   		}
	  		}
		  	
		  	const query1 = 'input[name="Category"]:checked';
		  	const selectedEls1 = document.querySelectorAll(query1);
		  	
		  	let result1 = '';
	    		selectedEls1.forEach((el1) => {
	    			result1 += el1.value + ' ';
	    		});
    	  	document.getElementById('result1').value = result1 ;	    
	    	
	    }    
	    
	    function check2(chk){
		  	var obj = document.getElementsByName("Level");
		  	for(var i=0; i<obj.length; i++){
			    if(obj[i] != chk){
			    obj[i].checked = false;
		   		}
	  		}
		  	
		  	const query2 = 'input[name="Level"]:checked';
		  	const selectedEls2 = document.querySelectorAll(query2);
		  	let result2 = '';
	    		selectedEls2.forEach((el2) => {
	    			result2 += el2.value + ' ';
	    		});	    		
	    	document.getElementById('result2').value = result2 ;		    		
	    } 


	    
	</script>



</body>
</html>
