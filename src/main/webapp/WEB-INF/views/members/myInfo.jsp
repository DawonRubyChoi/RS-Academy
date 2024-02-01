<%@ page language="java" contentType="text/html; charset=UTF-8 "
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>마이페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/modal.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/enrol.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
	<jsp:include page="../../views/common/top.jsp" />

	<form action="updateMember.jy"  method="post" id="form_member">
		<div class="enrol">
		<div class="tabletitle">MY INFO</div>
			<br>
			<table class="table2">

				<tr>
					<td class="tableLable"><lable>아이디 </lable></td>
					<td><input type="text" class="tableInput" readonly name="mbId" value="${loginUser.mbId}"></td>
					<input type="hidden" name="mbIsAdmin" value="${loginUser.mbIsAdmin }">
				</tr>
				<tr>
					<td class="tableLable"><lable>비밀번호 </lable></td>
               		<td><input type="password" class="tableInput" id="current_pwd" name ="mbPwd" > <span id="current-pwd-warn"></span></td>
				</tr>
				
				<tr>
					<td class="tableLable"><lable>새 비밀번호 </lable></td>
               		<td><input type="password" class="tableInput" id="pwd" name ="changePwd"> <span id="pwd-warn"></span></td>
				</tr>
				<tr>
					<td class="tableLable"><lable>새 비밀번호 확인 </lable></td>
              		<td><input type="password" class="tableInput" id="check-pwd">
                    <span id="pwd-check-warn"></span></td>
				</tr>
				<tr>
					<td class="tableLable"><lable>이름 </lable></td>
					<td><input type="text" class="tableInput" value="${loginUser.mbName}" name="mbName"></td>
				</tr>
				<tr>
					<td class="tableLable"><lable>주소 </lable></td>
					<td>
						<c:set var="sample6_postcode" value="${ fn:split(loginUser.mbAddress,'@')[0] }"/>
					
					   <input class="tableInput" type="text" placeholder="우편번호" id="sample6_postcode" name="sample6_postcode" value="${sample6_postcode}">  
	                  <input type="button" id="sample6" onclick="sample6_execDaumPostcode()" class="tablebutton" value="검색"><br> 
        	          <input type="text" class="tableInput" placeholder="기본주소" id="sample6_address" name="sample6_address"  value="${ fn:split(loginUser.mbAddress,'@')[1] }" ><br> 
            	      <input type="text" class="tableInput" placeholder="나머지 주소(선택 입력 가능)" id="sample6_detailAddress" name="sample6_detailAddress" value="${ fn:split(loginUser.mbAddress,'@')[2] }"><br>
                	  <input type="text" class="tableInput" id="sample6_extraAddress" placeholder="참고사항" name="sample6_extraAddress" value="${ fn:split(loginUser.mbAddress,'@')[3] }">
                	</td>
				</tr>
				<tr>
					
					
					<td class="tableLable"><lable>휴대전화 </lable></td>
              		 <td>
		              	<select class="tableInput" name="tel1">
		                     <option value="010" selected>010</option>
		                     <option value = "011">011</option>
		                     <option value="016">016</option>
	               		</select>- 
	               		<input type="text" class="tableInput" name="tel2" value="${ fn:split(loginUser.mbTel,'-')[1] }"> - 
	               		<input type="text" class="tableInput" name = "tel3" value="${ fn:split(loginUser.mbTel,'-')[2] }">
               		</td>
					
					
				</tr>
				<tr>
					<td class="tableLable"><label>이메일</label></td>
              		<td><input class="tableInput" type="text" placeholder="example@gmail.com" id="userEmail1" name="mbEmail" value="${loginUser.mbEmail}" > 
              		<input type="button" class="tablebutton" value="코드받기" id="mail-Check-Btn"><br>
                  	<input class="tableInput mail-check-input" type="text" placeholder="인증코드 입력" id="mail-check-input"> 
                  	<span id="mail-check-warn"></span>
               </td>	

				</tr>
				<tr>
					<td class="tableLable"><label>생년월일</label></td>
					<td><input class="tableInput" type="date" name="mbBirth" value ="${loginUser.mbBirth}"></td>

				</tr>
				<tr>
					<td class="tableLable"><label>내강의</label></td>
					
					<td>
						<c:if test="${!empty classList}">
							<c:forEach items="${classList}" var="cl">
								<input class="tableInput" type="text" value="${cl.clTitle}" readonly="readonly">
								<input class="hidden1"  type="hidden" value="${cl.csCode }">
								<c:if test="${cl.csStatus == 'Y'}">
									<input type="button" class="tablebutton classCancleButton" value="신청취소" id="classCancle" name="classCancle">
									<span> 신청중</span><br>
								</c:if>
								<c:if test="${cl.csStatus == 'N'}">
									<span> 철회</span><br>
								</c:if>
								<c:if test="${cl.csStatus == 'G'}">
									<input type="button" class="tablebutton classDeleteButton" value="철회" id="classDelete">
									<span> 수강중</span><br>
								</c:if>
								<c:if test="${cl.csStatus == 'E'}">
									<span> 수강완료</span><br>
								</c:if>
								<c:if test="${cl.csStatus == 'C'}">
									<span> 신청취소</span><br>
								</c:if>
							</c:forEach>
						</c:if>
					</td>
				</tr>
				<tr>
					<td class="tableLable"><label>레벨테스트결과</label></td>
					<td><input class="tableInput" type="text" value="${loginUser.mbLevel}" readonly="readonly" name="mbLevel"></td>

				</tr>
				<tr style="border-bottom: 0px none rgba(0,0,0,0)">
					
					<td colspan="2" class="tdCenter"><br>
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
						<input type="button" class="tableEnrolbutton" id="updateMember" value="수 정"> 
						<input type="button"class="tableEnrolbutton" value="취 소" onclick="javascript:history.back();"> 
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
						<input type="button" class="tablebutton" id="deleteMember" value="회원탈퇴">
					</td>
				</tr>
			</table>
			<br>
		</div>
	</form>
	
	
	
	<div id="modalContainer" class="hidden">
			<div id="modalContent">
			<br>
				<h1>&emsp;&emsp;회원탈퇴 하시겠습니까?</h1>
				<br>	
				&emsp;&emsp;&emsp;&emsp;
				<button id="deletAgree" type="button" class="apply">확인</button>
				 &emsp;&emsp;&emsp;&emsp;
				<button id="modalClose" type="button" class="modalClose">취소</button>
			</div>
	</div>
	
	<div id="modalContainer_cancle" class="hidden">
			<div id="modalContent_cancle" class ="modalContentCss">
			<br>
				<h1>&emsp;&emsp;신청취소 하시겠습니까?</h1>
				<br>	
				&emsp;&emsp;&emsp;&emsp;
				<button id="classCancleAgree" type="button" class="apply">확인</button>
				 &emsp;&emsp;&emsp;&emsp;
				<button id="modalClose_cancle" type="button" class="modalClose">취소</button>
			</div>
	</div>
	
	<div id="modalContainer_delete" class="hidden">
			<div id="modalContent_delete" class ="modalContentCss"> 
			<br>
				<h1>&emsp;&emsp;철회 하시겠습니까?</h1>
				<br>	
				&emsp;&emsp;&emsp;&emsp;
				<button id="classDeleteAgree" type="button" class="apply">확인</button>
				 &emsp;&emsp;&emsp;&emsp;
				<button id="modalClose_delete" type="button" class="modalClose">취소</button>
			</div>
	</div>



	<div id="modalContainer_member" class="hidden">
			<div id="modalContent_deleteMember" class="modalContentCss">
			<br>
				<h1>&emsp;&emsp;회원수정 하시겠습니까?</h1>
				<br>	
				&emsp;&emsp;&emsp;&emsp;
				<button id="deletMemberAgree" type="button" class="apply">확인</button>
				 &emsp;&emsp;&emsp;&emsp;
				<button id="modalMemberClose" type="button" class="modalClose">취소</button>
			</div>
	</div>
	
	
	<script>
    let check_button=false;
    // 유효성 검사를 하나라도 통과 못할시 sub이 안되게 검사할 예정
    let current_pwd_check=false;
    let chage_pwd=false;
    
    let check_mail=false;
    let check_pwd=false;
    let check_pwdoption=false;
    let prev=0;
    
    //입력된 경우에만 확인해야함
    let change_pwd=false; 
    
    const form = document.getElementById('form_member');
    
    function validateForm(){
       let check=true;
       let msg = "";
       const modal_member = document.getElementById('modalContainer_member');
       //modal_member.classList.remove('hidden');
       
       if(!current_pwd_check){ // 현재비밀번호 입력하는 부분 뭐든지 현재 비밀번호가 먼저 인증이 되어야 한다.
    	   document.getElementById('current_pwd').focus();
    	   document.getElementById('current-pwd-warn').style.color="red";
           document.getElementById('current-pwd-warn').innerText="현재 비밀번호를 입력해주세요"; 
    	   check=false;
     
       }else{ // 현재 비밀번호를 입력했을 때만 이메일인증, 정규 표현식 검사를 진행한다.
			
    	   
    	   //  입력된게 있을때만 검사를 진행한다.
    	   
    	   if(chage_pwd){ // 변경 비밀번호를 입력한 경우
    		   
    		   if(!check_pwdoption){ // 정규 표현식을 만족 하는지 비교하는 부분
    	    	   document.getElementById('pwd').focus();
    	    	   check=false;
    	       }
    	       else if(!check_pwd){ // 바꿀 비밀번호 두개가 같은지 확인 하는 부분
    	          document.getElementById('check-pwd').focus();
    	          document.getElementById('pwd-check-warn').style.color="red";
    	          document.getElementById('pwd-check-warn').innerText="비밀번호 인증을 해주세요";
    	          check = false;
    	       }
    		   
    	   }else{ // 비밀번호를 입력 안한 경우
    			check = true;   
    	   }
       
    	   
    	   if(!check_mail && check_button){ // 버튼을 눌렀을때 비교하는 부분
	    	   document.getElementById('mail-check-input').focus();
	    	   document.getElementById('mail-check-warn').style.color="red";
	           document.getElementById('mail-check-warn').innerText="이메일 인증을 해주세요";
	          
	          check = false;
	       }
       }
       if(check){
    	  form.submit();//onsubmit 하기
       }else{
    	   modal_member.classList.add('hidden');
       }
       
    }
 
    
    
    window.onload = () =>{
    	
    	
    	//이메일 인풋
    	const emailInput = document.getElementById('userEmail1');
    	
    	emailInput.addEventListener('input', () => {
    	    check_button = true;
    	});
    	
    	//회원수정버튼아이디
    	const updateModalOpenButton = document.getElementById('updateMember');
    	
    	//회원탈퇴버튼아이디
    	const modalOpenButton = document.getElementById('deleteMember');
    	
    	//모달에 있는 취소 버튼 
		const modalCloseButton = document.getElementById('modalClose');
		const modalCloseButton_member = document.getElementById('modalMemberClose');
		const modalCloseButton_cancle = document.getElementById('modalClose_cancle');
		const modalCloseButton_delete = document.getElementById('modalClose_delete');
    	
    	//회원탈퇴 모달
		const modal = document.getElementById('modalContainer');
		const modal_member = document.getElementById('modalContainer_member');
    	const cancle_modal = document.getElementById('modalContainer_cancle');
    	const delete_modal = document.getElementById('modalContainer_delete');
    	

		modalOpenButton.addEventListener('click', () => {
		  modal.classList.remove('hidden');
		});
		
		updateModalOpenButton.addEventListener('click', () => {
			
			modal_member.classList.remove('hidden');
		});

		
		modalCloseButton_member.addEventListener('click', () => {
			modal_member.classList.add('hidden');
		});
		
		modalCloseButton.addEventListener('click', () => {
		  modal.classList.add('hidden');
		});
		modalCloseButton_cancle.addEventListener('click', () => {
			cancle_modal.classList.add('hidden');
		});
		modalCloseButton_delete.addEventListener('click', () => {
			delete_modal.classList.add('hidden');
		});
		
		
		
		//실제 정보를 보내는 곳
		document.getElementById('deletAgree').addEventListener('click', () =>{
			window.location.href = '${contextPath}/deleteMember.jy?Id='+'${loginUser.mbId}';
		});
		
		document.getElementById('classCancleAgree').addEventListener('click', () =>{
			window.location.href = '${contextPath}/deleteMember.jy?Id='+'${loginUser.mbId}';
			window.location.href = "classCancle.jy?CsStatus=C&Id=${loginUser.mbId}&CsCode=" + prev;
		});
		
		document.getElementById('classDeleteAgree').addEventListener('click', () =>{
			window.location.href = '${contextPath}/deleteMember.jy?Id='+'${loginUser.mbId}';
			window.location.href = "classCancle.jy?CsStatus=N&Id=${loginUser.mbId}&CsCode=" + prev;
		});
		
		document.getElementById('classDeleteAgree').addEventListener('click', () =>{
			window.location.href = '${contextPath}/deleteMember.jy?Id='+'${loginUser.mbId}';
			window.location.href = "classCancle.jy?CsStatus=N&Id=${loginUser.mbId}&CsCode=" + prev;
		});
		
		//회원수정 모달
		document.getElementById('deletMemberAgree').addEventListener('click',validateForm);
		
		
		
		 $(document).on('click', '.classCancleButton', function () {
			    cancle_modal.classList.remove('hidden');
		        prev = $(this).prevAll('.hidden1').val();
		    });

		    $(document).on('click', '.classDeleteButton', function () {
		    	delete_modal.classList.remove('hidden');
		        prev = $(this).prevAll('.hidden1').val();
		    });
       
       
       let code="";
       
       /*인증체크하는곳*/
      $('#mail-Check-Btn').click(function() {
         const checkInput = $('.mail-check-input'); // 인증번호 입력하는곳 
         check_button=true;
         console.log(document.getElementById('userEmail1').value);
         $.ajax({
            type : 'get',
            url : '${contextPath}/mailCheck.jy', // GET방식이라 Url 뒤에 email을 뭍힐수있다.
            data: {Email:document.getElementById('userEmail1').value},
            success : function (data) {
               console.log("data : " +  data);
               checkInput.attr('disabled',false);
               code =data;
               alert('인증번호가 전송되었습니다.')
            }         
         }); 
      }); 
      
      /* 받아온 랜덤 코드를 비교하는 부분 인증코드 input에서 포커스를 잃었을시 확인*/
      $('.mail-check-input').blur(function () {
         const inputCode = $(this).val();
         const $resultMsg = $('#mail-check-warn');
         console.log(code);
         if(check_button){
            if(inputCode == code){
               $resultMsg.html('인증번호가 일치합니다.');
               $resultMsg.css('color','green');
               $('#mail-Check-Btn').attr('disabled',true);
               $('#userEamil1').attr('readonly',true);
               $('#userEamil2').attr('readonly',true);
               $('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
                  $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
                   check_mail=true;
            }else{
               $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!');
               $resultMsg.css('color','red');
                check_mail=false;
            }
         }
      });
              
      
      
      
       
       
      //비밀번호 관련 변수들
      const checkPwd = document.getElementById('check-pwd');
      const pwd = document.getElementById('pwd');
      const pwdCheckWarn = document.getElementById('pwd-check-warn');
      const pwdWarn = document.getElementById('pwd-warn');
      const pwdvalcheck = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]|.*[0-9]).{8,24}$/;
      
      if(pwd.value.trim()!=""){
	      if(!pwdvalcheck.test(pwd.value)){
	   		pwdWarn.style.color="red";
	   		pwdWarn.innerText = "8~24자 영문대소문자, 숫자, 특수문자 혼합 사용";
	   		check_pwdoption=false;
	   	 }else{
	  		pwdWarn.style.color="green";
	 		pwdWarn.innerText = "사용 가능 비밀번호";
	 		check_pwdoption=true;
	 	 }
      }
      
      
      //현재 비밀번호 확인 하는 부분
      current_pwd.addEventListener("blur", function() {
    	  $.ajax({
              type : 'get',
              url : '${contextPath}/pwdCheck.jy', // GET방식이라 Url 뒤에 email을 뭍힐수있다.
              data: {pwd:document.getElementById('current_pwd').value},
              success : function (data) {
                 if(data=="yes"){
                	 current_pwd_check = true;
                 }else{
                	 current_pwd_check = false;
                 }
                	 
              }         
           }); 
      });
      
      
      
      //비밀번호 정규식 
      pwd.addEventListener("blur", function() {
     	 
     	 //비어있지 않는 경우만 비교
     	 if(pwd.value.trim() != ""){
     				chage_pwd =true;
	             	if(!pwdvalcheck.test(pwd.value)){
	             		pwdWarn.style.color="red";
	             		pwdWarn.innerText = "8~24자 영문대소문자, 숫자, 특수문자 혼합 사용";
	             		check_pwdoption=false;
	             	 }else{
	             		pwdWarn.style.color="green";
	             		pwdWarn.innerText = "사용 가능 비밀번호";
	             		check_pwdoption=true;
	             	 }
	             	
            }else{
            	pwdWarn.style.color="black";
         		pwdWarn.innerText = "";
         		chage_pwd =false;
            }
     	 
          
       });
       
       checkPwd.addEventListener("blur", function() {
          if(pwd.value.trim() != ""){/*비밀번호를 입력한 경우만 체크*/
                if(checkPwd.value == pwd.value){
                   pwdCheckWarn.style.color="green";
                   pwdCheckWarn.innerText = "비밀번호가 일치합니다."
                    check_pwd=true;
                }else{
                   pwdCheckWarn.style.color="red";
                   pwdCheckWarn.innerText = "비밀번호가 불일치합니다."
                    check_pwd=false;
                   
                }
          }
       });
       
       
       
       
       
    
       
       
       
    }
	</script>
	
	   <!--카카오 지도 api 관련-->
   <script
      src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>
       function sample6_execDaumPostcode() {
           new daum.Postcode({
               oncomplete: function(data) {
                   // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
   
                   // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                   // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                   var addr = ''; // 주소 변수
                   var extraAddr = ''; // 참고항목 변수
   
                   //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                   if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                       addr = data.roadAddress;
                   } else { // 사용자가 지번 주소를 선택했을 경우(J)
                       addr = data.jibunAddress;
                   }
   
                   // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                   if(data.userSelectedType === 'R'){
                       // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                       // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                       if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                           extraAddr += data.bname;
                       }
                       // 건물명이 있고, 공동주택일 경우 추가한다.
                       if(data.buildingName !== '' && data.apartment === 'Y'){
                           extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                       }
                       // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                       if(extraAddr !== ''){
                           extraAddr = ' (' + extraAddr + ')';
                       }
                       // 조합된 참고항목을 해당 필드에 넣는다.
                       document.getElementById("sample6_extraAddress").value = extraAddr;
                   
                   } else {
                       document.getElementById("sample6_extraAddress").value = '';
                   }
   
                   // 우편번호와 주소 정보를 해당 필드에 넣는다.
                   document.getElementById('sample6_postcode').value = data.zonecode;
                   document.getElementById("sample6_address").value = addr;
                   // 커서를 상세주소 필드로 이동한다.
                   document.getElementById("sample6_detailAddress").focus();
               }
           }).open();
       } 
   </script>




</body>


<jsp:include page="../../views/common/footer.jsp" />
</html>