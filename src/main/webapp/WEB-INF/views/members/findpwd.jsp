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
   <jsp:include page="../../views/common/top.jsp" />
 <form action="${ contextPath }/mailFindPwd.dw" method="post">
   <div class="container">
      <div class="find-wrap">
         <h2>FIND PASSWORD</h2>
         <div class="find-info">
            <dl>
               <dt>아이디</dt>
               <dd>
                  <input type="text" placeholder="ex) rsacademy" name="mbId">
               </dd>
            </dl>
            <dl>
               <dt>이메일</dt>
               <dd>
                   <input type="email" placeholder="ex) rsacademy@naver.com" name="mbEmail">
               </dd>
            </dl>
            <div class="code-bt">
               <input type="button" id="injeung" class="mail-check-input" value="인증번호 발송">
            </div>
            
            <dl>
               <dt>인증 코드 입력</dt>
               <dd>
                  <input type="text" class="code" name="userCode" id="userCode">
               </dd>
            </dl>
            
            <div class="check-bt">
           	   <input type="button" id="confirm_injeung" value="확인" class="confirm">
               <a href="javascript:history.back(+1)" class="cancel">뒤로가기</a>
            </div>
            <input type="hidden" id="hidden1" name="hd">
         </div>
      </div>
   </div>
</form>

<script>
	let check_injeung=false;
	
	function validateForm() {
		let check = false;
		let msg = "";
		
		if(!check_injeung) {
			alert("인증을 완료해주세요.");
			return check;
		}
		
		return check;
	}
	
	window.onload = () =>{
		
		
		 const checkPwd = document.getElementById('injeung');
		 const hidden1 = document.getElementById('hidden1');
		 const checkInjueng = document.getElementById('confirm_injeung');
		 let mbId = document.getElementsByName('mbId')[0].value;
    	 let mbEmail = document.getElementsByName('mbEmail')[0].value;
    	 let userCode = document.getElementById('userCode').value;
		 
		 console.log(hidden1);
         checkPwd.addEventListener("click", function () {
        	   var mbId = document.getElementsByName('mbId')[0].value;
			   var mbEmail = document.getElementsByName('mbEmail')[0].value;
		 	   $.ajax({
			      type: "post",
			      url: "${contextPath}/mailInjeung.dw",
			      data: { "mbId": mbId, "mbEmail": mbEmail },
			      success: function(response) {
			    	 hidden1.value = response;
			         alert("이메일이 발송되었습니다. 인증번호를 입력해주세요.");
			      },
			      error: function(error) {
			         alert("이메일 발송에 실패했습니다. 다시 시도해주세요.");
			      }
			   }); 
         });
         
         checkInjueng.addEventListener("click", function () {
        	 userCode = document.getElementById('userCode').value;
        	 mbId = document.getElementsByName('mbId')[0].value;
        	 mbEmail = document.getElementsByName('mbEmail')[0].value;
        	 $.ajax({
			      type: "post",
			      url: "${contextPath}/mailFindPwd.dw",
			      data: { "mbId": mbId, "mbEmail": mbEmail ,"userCode":userCode,"hidden1":hidden1.value},
			      dataType : "html",
			      success: function(data) {
			         alert(data);
			         console.log(data);
			      },
			      error: function(error) {
			      }
			      
			   }); 
         });
	}
</script>
</body>
   <jsp:include page="../../views/common/footer.jsp" />
</html>