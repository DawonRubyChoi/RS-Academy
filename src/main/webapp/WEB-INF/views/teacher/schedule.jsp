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
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #content-container {
            display: flex;
            width: 100%;
            max-width: 1200px; /* 내용 최대 폭 지정 (예: 1200px) */
            margin-top: 20px; /* 탑과의 간격 지정 */
        }
        
         #calendar-container {
            flex: 1;
            margin-right: 20px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }
        
        .prev-month, .next-month {
        	color: #999;
        	background-color: #f9f9f9;
        }
        
        #list-container {
            flex: 1;
            padding: 20px; /* 내용과 화면 경계 간 여백 추가 */
            border: 1px solid #dddddd;
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	<div id="content-container">
		<div id="calendar-container">
		    <h2 id="calendar-title"></h2>
		    <table id="calendar-table"></table>
		</div>
		<div id="list-container">
		    <!-- 여기에 리스트 내용 추가 -->
		    <h2>리스트</h2>
		    <ul>
		        <li>리스트 항목 1</li>
		        <li>리스트 항목 2</li>
		        <!-- 추가적인 리스트 항목들 -->
		    </ul>
		</div>
	</div>
	<script>
		$(document).ready(function () {
		    // 현재 날짜 정보 가져오기
		    var currentDate = new Date();
		    var currentYear = currentDate.getFullYear();
		    var currentMonth = currentDate.getMonth() + 1;
		
		    // 페이지 로드 시 달력 초기화
		    initializeCalendar(currentYear, currentMonth);
		
		    // 달력 초기화 함수
		    function initializeCalendar(year, month) {
		        // 달력 테이블과 제목 엘리먼트 가져오기
		        var calendarTable = document.getElementById("calendar-table");
		        var calendarTitle = document.getElementById("calendar-title");
		
		        // 제목 설정
		        calendarTitle.innerHTML = year + "년 " + month + "월";
		
		        // 이전 달과 다음 달의 날짜 계산
		        var prevMonth = month - 1 === 0 ? 12 : month - 1;
		        var prevYear = month - 1 === 0 ? year - 1 : year;
		        var nextMonth = month + 1 === 13 ? 1 : month + 1;
		        var nextYear = month + 1 === 13 ? year + 1 : year;
		
		        // 달력 테이블 내용 초기화
		        calendarTable.innerHTML = "<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>";
		
		        // 첫 번째 날의 요일을 가져오기 (0: 일요일, 1: 월요일, ..., 6: 토요일)
		        var firstDay = new Date(year, month - 1, 1).getDay();
		
		        // 이전 달의 마지막 날짜 가져오기
		        var lastDayOfPrevMonth = new Date(prevYear, prevMonth, 0).getDate();
		
		        // 이전 달의 마지막 주의 시작 요일 계산
		        var startDayOfPrevMonth = lastDayOfPrevMonth - firstDay + 1;
		
		        // 달력에 표시할 날짜 추가
		        var dayCounter = 0;
		        var row = document.createElement("tr");
		
		        // 이전 달의 마지막 주 추가
		        for (var i = 0; i < firstDay; i++) {
		            var cell = document.createElement("td");
		            cell.textContent = startDayOfPrevMonth + i;
		            cell.classList.add("prev-month");
		            row.appendChild(cell);
		            dayCounter++;
		        }
		
		        // 현재 달의 날짜 추가
		        for (var day = 1; day <= new Date(year, month, 0).getDate(); day++) {
		            var cell = document.createElement("td");
		            cell.textContent = day;
		            row.appendChild(cell);
		            dayCounter++;
		
		            // 토요일까지 채우면 다음 줄로 넘어감
		            if (dayCounter % 7 === 0) {
		                calendarTable.appendChild(row);
		                row = document.createElement("tr");
		            }
		        }
		
		        // 다음 달의 시작 주 추가
		        for (var i = 1; dayCounter % 7 !== 0; i++) {
		            var cell = document.createElement("td");
		            cell.textContent = i;
		            cell.classList.add("next-month");
		            row.appendChild(cell);
		            dayCounter++;
		        }
		
		        // 달력에 마지막 주 추가
		        calendarTable.appendChild(row);
		    }
		});
	</script>
</body>
</html>