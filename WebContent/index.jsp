<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습용_인덱스</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link href="css/font-awesome.min.css" rel="stylesheet">	
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/user.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">    
	<link rel="stylesheet" href="css/base.css">
	<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/header&footer.css">
	<link rel="stylesheet" href="css/index_expert.css">
</head>
<body>

<style>
 #container_top2 {
	float:left;
	width:200px;
	height:0px;
	padding-top:150px;
	padding-left:30px;
	position:fixed;
 }
 
.gnb_group ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 150px;
//  background-color: #f1f1f1;
  border: 1px solid #ffA2AD;
}

.gnb_group li a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
}

.gnb_group li {
  text-align: center;
//  border-bottom: 1px solid #ffA2AD;
}

.gnb_group li:last-child {
  border-bottom: none;
}

.gnb_group li a.active {
  background-color: #4CAF50;
  color: white;
}

.gnb_group li a:hover:not(.active) {
  background-color: #555;
  color: white;
}
.nav_1depth li:first-child {
	background:gray;
	color:white;
	font:bold;
}
.nav_1depth li {
//	font:bold;
}
.topRight .first a {
	color:white;
}
</style>

<%@ include file="header.jsp"%>

<div id="container">			
	<div class="box">
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		  </ol>

		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" role="listbox">
			<div class="item active">
			
			  <img src="images/34.jpg" alt="3" style="width: 100%; height:500px;"> 
			  <div class="carousel-caption">
				<h2>긴급하게 도움이 필요한가요?</h2>
				<h5>절실히 도움이 필요할 때 도와드립니다!</h5>
				<h5>각 분야의 전문가와 직접 연결되는 인공지능 기반 매칭 시스템!</h5>
			  </div>

			</div>
			<div class="item">
			  <img src="images/23.jpg" alt="2" style="width: 100%; height:500px;">
			 <div class="carousel-caption">
				<h2>어떤 이슈가 있나요?</h2>
				<h5>분야별 최고의 전문가들이 이슈를 해결해드립니다!</h5>
				<h5>언제 어디서든 어떤 방법이든 전문가가 도움을 드립니다.</h5>
			  </div>
			</div>
			<div class="item">
			  <img src="images/12.png" alt="1" style="width:100%; height:500px;">
			  <div class="carousel-caption">
				<h2>인공지능 기반 지식공유 플랫폼</h2>
				<h5>다양한 전문가를 나만을 위한 삶의 비서로 활용하세요!</h5>
				<h5>언제 어디서든 내가 필요할 때 도움을 받을 수 있는 편리한 서비스</h5>

			  </div>
			</div>
		  </div>

		  <!-- Controls -->
		  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		  </a>
		</div>
	</div>
		
	<div id="menu_list">
		<div class="menu_list_box1">
			<div>
				<a href="expertlist.do"><img src="images/취업.png"/><br>
				진로/취업</a>
			</div>
			<div>
				<a href="expertlist.do"><img src="images/헬스.png"/><br>
				헬스/뷰티</a>
			</div>
		</div>
		<div class="menu_list_box1">
			<div>
				<a href="expertlist.do"><img src="images/창업.png"/><br>
				창업/비즈니스</a>
			</div>
			<div>
				<a href="expertlist.do"><img src="images/취미.jpg"/><br>
				취미/여가생활</a>
			</div>
		</div>
		<div class="menu_list_box1">
			<div>
				<a href="expertlist.do"><img src="images/심리.jpg"/><br>
				심리/가정</a>
			</div>
			<div>
				<a href="expertlist.do"><img src="images/운세.jpg"/><br>
				운세</a>
			</div>
		</div>
		<div class="menu_list_box1">
			<div>
				<a href="expertlist.do"><img src="images/설계.png"/><br>
				미래설계</a>
			</div>
			<div>
				<a href="expertlist.do"><img src="images/웨딩.jpg"/><br>
				웨딩/이벤트</a>
			</div>
		</div>
		<div class="menu_list_box1">
			<div>
				<a href="expertlist.do"><img src="images/자산.png"/><br>
				자산관리</a>
			</div>
			<div>
				<a href="expertlist.do"><img src="images/업무.png"/><br>
				업무의뢰</a>
			</div>
		</div>
		<div class="menu_list_box1">
			<div>
				<a href="expertlist.do"><img src="images/법률.jpg"/><br>
				법률</a>
			</div>
			<div>
				<a href="expertlist.do"><img src="images/it.png"/><br>
				IT/코딩</a>
			</div>
		</div>
	</div>	
	
	<div id="main_event">
		<div class="main_event_1">
			<a href=""><img src="images/언택트1.png"/><br>
		</div>
		<div class="main_event_1">
			<a href=""><img src="images/언택트2.png"/><br>
		</div>
		<div class="main_event_1">
			<a href=""><img src="images/언택트3.png"/><br>
		</div>
	</div>
	
	<div id="recommend_list">
		<div>
		<legend>전문가 추천 <i class="far fa-check-square"></i></legend>
		</div>
		<a href="">
		<div class="row">
		  <div class="col-sm-6 col-md-4 thumb">
			<div class="thumbnail">
			<a href="expertdetail.do">
			  <img src="images/전문가.png" alt="전문가1">
			  <div class="caption">
				<h3>expert2</h3>
				<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
				<p>진로/취업<br></p>
			  </div>
			  <div class="captionmake">
			  대한민국을 변화시키고 고객을 변화시키는 명강사의 길! ...
			  </div>
			</a>	
			</div>
		  </div>
		</div>
		</a>
		<a href="">
			<div class="row">
		  <div class="col-sm-6 col-md-4 thumb">	
			<div class="thumbnail">
			<a href="expertdetail.do">
			  <img src="images/전문가.png" alt="전문가2">
			  <div class="caption">
				<h3>박길동</h3>
				<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
				<p>법률 자문<br></p>
			  </div>
			  <div class="captionmake">
			  실무를 바탕으로 성실한 상담을 약속드립니다.
			  </div>
			</a>
			</div>
		  </div>
		</div>
		</a>
		<a href="">
		<div class="row">
		  <div class="col-sm-6 col-md-4 thumb">
			<div class="thumbnail">
			<a href="expertdetail.do">
			  <img src="images/전문가.png" alt="전문가3">
			  <div class="caption">
				<h3>김길동</h3>
				<p><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
				<p>백엔드 코딩<br></p>
			  </div>
			  <div class="captionmake">
			  C언어, C#(Windows Forms 앱), 컴퓨터기초 과목 등
			  </div>
			</a>
		  </div>
		</div>
		</div>
		</a>
		<a href="">
		<div class="row">
		  <div class="col-sm-6 col-md-4 thumb">
			<div class="thumbnail">
			<a href="expertdetail.do">
			  <img src="images/전문가.png" alt="전문가1">
			  <div class="caption">
				<h3>홍길동</h3>
				<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
				<p>헬스 코칭<br></p>
			  </div>
			  <div class="captionmake">
			  상담자님의 상태에 맞는 맞춤 트레이닝 상담을 해드립니다.
			  </div>
			</a>
			</div>
		  </div>
		</div>
		</a>
		<a href="">
		<div class="row">
		  <div class="col-sm-6 col-md-4 thumb">
			<div class="thumbnail">
			<a href="expertdetail.do">
			  <img src="images/전문가.png" alt="전문가1">
			  <div class="captionall">
			  <div class="caption">
				<h3>홍길동</h3>
				<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
				<p>오늘의 운세&사주<br></p>
			  </div>
			  <div class="captionmake">
			  사주&타로 명리로 건강/풍수/택일 전문 상담합니다.
			  </div>
			  </div>
			</a>
			</div>
		  </div>
		</div>
		</a>
		<a href="">
		<div class="row">
		  <div class="col-sm-6 col-md-4 thumb">
			<div class="thumbnail">
			<a href="expertdetail.do">
			  <img src="images/전문가.png" alt="전문가1">
			  <div class="caption">
				<h3>홍길동</h3>
				<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
				<p>웨딩 플래너<br></p>
			  </div>
			  <div class="captionmake">
				웨딩플래너 10년 경력을 가지고 있습니다.
			  </div>
			</a>
			</div>
		  </div>
		</div>
		</a>
	<div id="notice_list">
		<div class="recommend_list_faq">
			<div>
			<a href="notice.do"><legend>공지사항<i class="far fa-check-square"></i></legend></a>
			<ul>
				<c:forEach var="list" items="${list}">			
					<li>${list.title}</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
</div>
</div>



    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
</body>
<%@ include file="footer.jsp" %>
</html>