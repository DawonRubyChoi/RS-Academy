<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap" rel="stylesheet">
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

   <style>
      body {
         background-color: rgb(246, 244, 238);
      }
      
      .board_title { 
         margin-bottom: 30px;
         display: block;
         color: #655345;
         font-family: 'Noto Sans KR';
         font-size: 10px;
         margin-top: 100px;
      }
      
       .board_title strong {
          font-size: 3rem;
          font-family: 'Noto Sans KR';
          font-weight: bold;
          color: #655345;
       }
       
       .board_title p {
          margin-top: 5px;
          font-size: 1.4rem;
          dlsplay: block;
          margin-block-start: 1em;
          margin-block-end: 1em;
          margin-inline-start: 0px;
          margin-inline-end: 0px;
          color: #655345;
          font-family: 'Noto Sans KR';
       }
       
       .board_page {
          width: 1000px;
          margin: 100px auto;
          color: #655345;
          font-family: 'Noto Sans KR';
       }
       
       
        .board_wrap {
         border-top: 2px solid #655345;
         display: block;
         color: #655345;
         font-family: 'Noto Sans KR';
         font-size: 10px;
      
      }
      
      .board_write {
         padding: 15px;
         display: block;
         color: #655345;      
         font-family: 'Noto Sans KR';
         font-size: 10px;
      }
      
      .board_table {
         width: 98%;
         margin-bottom: 22px;
      }
      
      .port_title {
         text-align: center;
         border-bottom: 1px dashed #d3d3d3;
         height: 50px;
         font-size: 1.4rem;
      }
      
      .port_info{
         border-bottom: 1px solid #655345;
         height: 25px;
         text-align: none;
         height: 50px;
         line-height: 20px;
         font-size: 1.4rem;
      }
      
      .port_input {
         width: 98%;
         height: 80%;
         line-height: 80%;
         background-color: #f5f5f5;
      }
      
      .form-control {
         background-color: #f5f5f5;
         height: 500px;
         font-size: 1.4rem;
      }
      
      .file-control {
         margin-top: 10px;
      }
      
      .bt_wrap {
         text-align: center;
      }
      
      .buttons{
         display: inline-block; min-width: 80px; margin-left: 10px; padding : 10px; border : 1px #655345;
          border-radius: 2px; font-size:1.4rem; background : #655345; color : white; cursor: pointer;
      }
      .on_1{
         display: inline-block; min-width: 80px; margin-left: 10px; padding : 10px; border : 1px solid grey;
          border-radius: 2px; font-size:1.4rem; background : rgba(0, 0, 0, 0); color : grey; cursor: pointer;
      }
      
      #fileArea {
         margin-top: 15px;
         display: flex;
         justify-content: space-between;
         align-items: flex-start;
      }
      
      #fileArea > div {
         display: flex; 
         flex-direction: column;
         align-items: flex-start;
      }
      
      .preImage {
         width: 250px;
         height: 250px;
         display: block;
         margin-bottom: 10px;
      }
      
      .file-control {
         margin-top: 10px;
      }
      
      .label {
           margin-bottom: 5px;
           font-size: 1.2rem;
           color: #655345;
      }
      
   </style>

</head>
<body>
   <jsp:include page="../common/top.jsp"/>
   
   <div class="board_page">
      <div class="board_title">
         <strong>포트폴리오</strong>
         <p>포트폴리오 수정 페이지입니다.</p>
      </div>
      <div class="board_wrap">
         <form action="${ contextPath }/updatePort.hj" method="POST" enctype="multipart/form-data" id="portForm">
            <input type="hidden" name="ocbImage" value="${ p.ocbImage }">
            <input type="hidden" name="ocbNo" value="${ p.ocbNo }">
            <input type="hidden" name="page" value="${ page }">
            <div class="board_write">
               <table class="board_table">
                  <tr class="port_title">
                     <td>제목</td>
                     <td><input type="text" name="ocbTitle" placeholder="제목을 입력해주세요." class="port_input" value="${ p.ocbTitle }"></td>
                     <td>
                        <select name="ocbCategory">
                           <option value="한식" ${ p.ocbCategory == '한식' ? 'selected' : '' }>한식</option>
                           <option value="일식" ${ p.ocbCategory == '일식' ? 'selected' : '' }>일식</option>
                           <option value="양식" ${ p.ocbCategory == '양식' ? 'selected' : '' }>양식</option>
                           <option value="베이커리" ${ p.ocbCategory == '베이커리' ? 'selected' : '' }>베이커리</option>
                        </select>
                     </td>
                  </tr>
                  <tr class="port_info">
                     <td>글쓴이</td>
                     <td>${ loginUser.mbName }</td>      <!-- ${ loginUser.mbName } -->
                  </tr>
               </table>
               <div class="port_content">
                  <textarea class="form-control" rows="10" name="ocbContent" style="resize: none;" placeholder="내용을 입력해주세요.">${ p.ocbContent }</textarea>
               </div>
               
               <!-- 파일 첨부 관련 div -->
               <div id="fileArea">
                  <div style="flex: 1; margin-right: 20px;">   
                     <label for="preImage">기존 파일 이미지 : </label>   <!-- 기존 포트폴리오가 가지고 있던 이미지 파일 가져오기 / 원본 이미지의 미리보기 제공 -->
                     <img id="preImage" class="preImage" src="${ contextPath }/resources/uploadPort/${ p.ocbImage }" alt="미리 보기">
                  </div>
                  <div style="flex: 1;">      
                     <label for="newPreImage">바꿀 파일 이미지 : </label>   <!-- 강사가 바꾸고 싶은 이미지가 있으면(첨부 시) 해당 이미지로 미리보기 변환 / 없으면 원본 이미지를 제공 -->
                     <img id="newPreImage" class="preImage"  alt="미리 보기">
                     <input type="file" class="file-control" name="file" id="fileInput">
                  </div>
               </div>
               
               <br><br><br>
               
               <div class="bt_wrap">         <!-- 버튼 / CANCLE 버튼은 뒤로가기 구현 -->
                  <button class="buttons" id="submitPort" type="button">SUBMIT</button>
                  <button class="on_1" type="button" onclick="javascript:history.back();">CANCLE</button>
               </div>
            </div>
         </form>
      </div>
   </div>
   
   <!-- 모달 / 만약 새로운 이미지 추가 시 원본 이미지는 삭제됨을 알림  -->
   <div class="modal fade" tabindex="-1" role="dialog" id="modalChoice">
      <div class="modal-dialog" role="document">
          <div class="modal-content rounded-3 shadow">
               <div class="modal-body p-4 text-center">
                 <h3 class="mb-0">이미지 추가 시 기존 이미지는 삭제됩니다.</h3>
                 <p class="mb-0">계속 진행하시겠습니까?</p>
               </div>
               <div class="modal-footer flex-nowrap p-0">
                 <button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" id="checkFile">
                    <strong>네</strong>
                 </button>
                 <button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
               </div>
          </div>
        </div>
   </div>
   
   <script>
      window.onload = () => {
          const fileInput = document.getElementById('fileInput');
          const preImage = document.getElementById('newPreImage');
          const form = document.getElementById('portForm');
      
          // 사용자가 파일을 선택하면, 선택된 파일의 목록이 FileList 객체 형태로 files 속성에 저장됨.
          if (fileInput.files.length > 0) {
             // files.legnth > 0 일 때 첨부된 파일은 files의 0번째 인덱스에 담겨있음.
              const selectedFile = fileInput.files[0];

              //window.URL객체의 메소드 createObjectURL 사용해서 임시 URL 생성
              const objectURL = URL.createObjectURL(selectedFile);
              // preImage의 경로를 생성된 임시 URL로 변경하면 파일의 이미지가 화면에 보여짐.
              preImage.src = objectURL;
             
          } else {
              preImage.src = "${contextPath}/resources/uploadPort/${p.ocbImage}";
          }
   
          // 위와 같으나 fileInput이 change 될 때 마다 이벤트 발생
          fileInput.addEventListener('change', function () {
              if (fileInput.files.length > 0) {
                  const selectedFile = fileInput.files[0];
                  const objectURL = URL.createObjectURL(selectedFile);
                  preImage.src = objectURL;
              } else {
                  preImage.src = "${contextPath}/resources/uploadPort/${p.ocbImage}";
              }
          });
         
          // 제출 버튼 클릭 시 파일 첨부 버튼을 검사해서 첨부할 파일이 있다면 기존 이미지는 삭제된다고 안내문구를 띄어줌.
         // 제출 시 기존 이미지 파일의 네임(주소)도 hidden으로 같이 보내야함.
          document.getElementById('submitPort').addEventListener('click', () => {
              const isNewImage = fileInput.files.length > 0;
   
              if (isNewImage) {
                  $('#modalChoice').modal('show');
              } else {
                  form.submit();
              }
          });
   
          document.getElementById('checkFile').addEventListener('click', () => {
              $('#modalChoice').modal('hide');
              form.submit();
          });
      }
   </script>



































</body>
</html>