<%@ page language="java" contentType="text/html; charset=UTF-8 "
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<link href="${contextPath}/resources/css/adminMember.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap"
   rel="stylesheet">

</head>
<body>

   <jsp:include page="../../views/common/top.jsp" />

   <div class="enrol">
      <form id="form" method="post">
         <table class="table2">
            <div class="tabletitle">ADMIN MENU(회원) </div>
            <input type="button" class="tableEnrolbutton" value="수 정" id="updateMember">
            <br><br>
            <tr>
               <th>선택</th>
               <th>아이디</th>
               <th>이름</th>
               <th>이메일</th>
               <th>탈퇴여부</th>
               <th>학생(1)/강사(2)/관리자(3)</th>
               <th>강의명</th>
               <th>강의상태</th>
            </tr>
	        <c:forEach items="${list}" var="li">
		        <tr>
		            <td><input type="checkbox" name ="checkMember"></td>
		            <td><input type="text" value="${li.mbId}" readonly class="tableInput" name="mbId"></td>
		            <td><input type="text" value="${li.mbName}" class="tableInput" name="mbName"></td>
		            <td><input type="text" value="${li.mbEmail}" class="tableInput" name="mbEmail"></td>
		            <td><input type="text" value="${li.mbStatus}" class="tableInput" name="mbStatus"></td>
		            <td><input type="text" value="${li.mbIsAdmin}" class="tableInput" name="mbIsAdmin"></td>
		            
		            <!-- 반복문 돌기  첫번째 찾기-->
		            <c:set var="isChecked" value="false" />
		           <c:forEach items="${classList}" var="cl" varStatus="loop1" begin="0" end="${fn:length(classList) - 1}">
		                <c:if test="${!isChecked && li.mbId == cl.csId}">
		                    <td>
		                    	<c:set var="isChecked" value="true" />
		                    	<c:set var="isCheckedID" value="${cl.csNo}" />
		                    	<input type="checkbox" name ="checkClassList">
		                    	<label>강의명: </label><input type="text" value="${cl.clTitle}" class="tableInput" name="clTitle">
		                    </td>
		                    <td><label>강의상태:</label><input type="text" value="${cl.csStatus}" class="tableInput" name="csStatus">
		                    <input type="hidden" value="${cl.csNo}" name="csNo"></td>
		                </c:if>
		            </c:forEach> 
		        </tr>
	        
	       <c:forEach items="${classList}" var="cl" begin="0" end="${fn:length(classList) - 1}">
	       		<c:if test="${isCheckedID != cl.csNo }">
		            <c:if test="${li.mbId == cl.csId && isChecked}">
		                <tr>
		                    <td></td>
		                    <td></td>
		                    <td></td>
		                    <td></td>
		                    <td></td>
		                    <td></td>
		                    <td>
		                    	<input type="checkbox" name ="checkClassList">
		                    	<label>강의명: </label><input type="text" value="${cl.clTitle}" class="tableInput" readonly="readonly"  name="clTitle">
		                    </td>
		                    <td><label>강의상태:</label><input type="text" value="${cl.csStatus}" class="tableInput" name="csStatus">
		                    	<input type="hidden" value="${cl.csNo}" name="csNo">
		                    </td>
		                </tr>
		            </c:if>
	            </c:if>
	        </c:forEach> 
	    </c:forEach>
	    

         </table>
      </form>
   </div>

<script >
	window.onload = () =>{
		const form = $('#form');
		document.getElementById('updateMember').addEventListener('click',() => {
			const selectedMember = $('input:checkbox[name="checkMember"]:checked');
			const selectedClass = $('input:checkbox[name="checkClassList"]:checked');

			
			selectedClass.each(function() {
			    const checkbox1 = $(this);
			    const tdElement = checkbox1.closest('td');
			    const clTitle = tdElement.find('input[name="clTitle"]').val();
			    const csStatus = tdElement.next('td').find('input[name="csStatus"]').val();
			    const csNo = tdElement.next('td').find('input[name="csNo"]').val();
			    
			    checkbox1.val(clTitle + "#" + csStatus + "#" + csNo);
			    
			});
			
			
			 for (const checkbox of selectedMember) {
		            const inputs = $(checkbox).closest('td').nextAll().find('input.tableInput');
		            
		            const mbId = inputs.filter('[name="mbId"]').val();
		            const mbName = inputs.filter('[name="mbName"]').val();
		            const mbEmail = inputs.filter('[name="mbEmail"]').val();
		            const mbStatus = inputs.filter('[name="mbStatus"]').val();
		            const mbIsAdmin = inputs.filter('[name="mbIsAdmin"]').val();
		            
		            checkbox.value=mbId+ "#" +mbName+ "#" +mbEmail+ "#" +mbStatus+ "#" +mbIsAdmin;
		            
		        }
			
			if(selectedMember.length >= 1 || selectedClass.length >=1){
        		form.attr('action', '${contextPath}/updateMemberList.jy');
        		//value 값들 쌓기 필요한 요소 id,name,email,status
                form.submit();
        	} else{
        		alert("수정할 요소를 선택하세요.");
        	}
			
		});
	}
</script>

</body>
</html>