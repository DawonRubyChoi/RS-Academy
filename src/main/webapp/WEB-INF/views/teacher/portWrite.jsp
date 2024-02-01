<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      
   </style>

</head>
<body>
   <jsp:include page="../common/top.jsp"/>
   
   <div class="board_page">
      <div class="board_title">
         <strong>포트폴리오</strong>
         <p>포트폴리오 작성 페이지입니다.</p>
      </div>
      <div class="board_wrap">
         <form action="${ contextPath }/insertPort.hj" method="POST" enctype="multipart/form-data" id="portForm">
            <div class="board_write">
               <table class="board_table">
                  <tr class="port_title">
                     <td>제목</td>
                     <td><input type="text" name="ocbTitle" placeholder="제목을 입력해주세요." class="port_input"></td>
                     <td>
                        <select name="ocbCategory">
                           <option value="한식">한식</option>
                           <option value="일식">일식</option>
                           <option value="양식">양식</option>
                           <option value="베이커리">베이커리</option>
                        </select>
                     </td>
                  </tr>
                  <tr class="port_info">
                     <td>글쓴이</td>
                     <td>${ loginUser.mbName }</td>      <!-- ${ loginUser.mbName } -->
                  </tr>
               </table>
               <div class="port_content">
                  <textarea class="form-control" rows="10" name="ocbContent" style="resize: none;" placeholder="내용을 입력해주세요."></textarea>
               </div>
               <div id="fileArea">
                  <div>
                     <input type="file" class="file-control" name="file" id="fileInput">
                  </div>
               </div>
               
               <br><br><br>
               
               <div class="bt_wrap">
                  <button class="buttons" id="submitPort" type="button">SUBMIT</button>
                  <button class="on_1" type="button" onclick="javascript:history.back();">CANCLE</button>
               </div>
            </div>
         </form>
      </div>
   </div>
   
   <!-- 모달 -->
   <div class="modal fade" tabindex="-1" role="dialog" id="modalChoice">
      <div class="modal-dialog" role="document">
          <div class="modal-content rounded-3 shadow">
               <div class="modal-body p-4 text-center">
                 <h3 class="mb-0">첨부파일이 삽입되지 않았습니다.</h3>
                 <p class="mb-0">첨부파일을 반드시 삽입해주세요.</p>
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
      // 우리는 기본적으로 한 게시글에 하나의 사진이지만 나중에라도 여러장 넣을 수 있게 로직은 짜놓음
      // 대신 여러장이면 하나의 게시글에 여러장의 사진이 가능함으로 사진도 리스트로 관리해야함(DB추가)
      window.onload = () => {
         
         const form = document.getElementById('portForm');
         document.getElementById('submitPort').addEventListener('click', () => {
            const files = document.getElementsByName('file');
            console.log(files);
            // 파일 반드시 추가하도록 설계
            let isEmpty = true;
            for(const f of files) {
               if(f.value != '') {
                  isEmpty = false;
               }
            }
            
            if(isEmpty) {
               $('#modalChoice').modal('show');
            } else {
               form.submit(); // 파일 존재
            }
         });
         
         document.getElementById('checkFile').addEventListener('click', () =>{
            document.getElementById('fileInput').click();
            $('#modalChoice').modal('hide');
         });
      }
      
      

   </script>



































</body>
</html>