<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 상담</title>
<link href="${pageContext.request.contextPath }/resources/css/noticeList.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif+KR&family=Rubik&display=swap" rel="stylesheet">
   <style>
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
   <div class="container">
      <div class="board_wrap">
         <div class="board_title">
            <strong>공지사항</strong>
            <p>공지사항을 작성해주세요.</p>
         </div>      <!-- 로그인유저(관리자 이름) -->
         <div class="board_write_wrap"> <!-- 1.보드 리스트 2. 페이지영역 3. 버튼 영역 wrap으로 감쌈 -->
            <form action="${ contextPath }/insertNotice.hj" method="POST">
               <div class="board_write">
                  <div class="title">
                     <dl>
                        <dt>제목</dt>
                        <dd><input type="text" name="noticeTitle" placeholder="제목을 입력해주세요."></dd>
                     </dl>
                  </div>
                  <div class="info">
                     <dl>
                        <dt>글쓴이</dt>
                        <dd>${ loginUser.mbName }</dd>
                     </dl>
                  </div>
                  <div class="cont">
                     <textarea name="noticeContent" placeholder="내용을 입력해주세요."></textarea>
                  </div>
                  <div class="bt_wrap">
                     <button type="submit" class="buttons">WRITE</button>
                     <button type="button" onclick="javascript:history.back()" class="on_1">CANCLE</button>
                  </div>               <!-- 뒤로가기로 만듦-->
               </div>
            </form>
         </div>
      </div>
   </div>
</body>
</html>