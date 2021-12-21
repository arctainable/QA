<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<html>
<head>
<meta charset="UTF-8">
<title>연습용_전문가상세</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/header&footer.css">
	<link rel="stylesheet" href="css/expert_list.css">
	<link rel="stylesheet" href="css/expert_detail.css">

</head>


<style>
 #container {
 	padding-top:150px;
 }
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

</style>

<%@ include file="header.jsp"%>

<div id="container">	
	<div id="join">
		<div id="join_top">
			<div id="expert_main_one">
				<div id="expert_main_left">
					<img src="images/전문가.png" alt="전문가1">
				</div>
				<div id="expert_main_middle">
					<div class="caption">
						<h3>example2</h3>
						
						<p>진로/취업<br></p>
					  </div>
					  <div class="captionmake">
					  대한민국을 변화시키고 고객을 변화시키는 명강사의 길! <br>명강사 최고위 과정에서 지혜와 정보 습득! <br>실력과 마케팅력을 습득하여 명강사로 가는 네비게이션! <br>도전! 희망을 드립니다. 
					  </div>
				</div>
				<div id="expert_main_right">
					<h4>상담문의</h4>
					<button type="button" onclick="location.href=''">1:1문의</button>
				</div>
			</div>
		</div>
		<div id="join_middle">
			<ul class="nav nav-tabs" role="tablist" id="myTab">
  <li role="presentation"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">소개</a></li>
  <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">경력</a></li>
  <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">업무의뢰</a></li>
  <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">리뷰</a></li>
</ul>

<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="home">
	<p>안녕하세요.</p><p>“누구보다 먼저”</p><p>정확한 취업전략을 설계하는 홍길동 컨설턴트 입니다.</p><p>학생의 강점을 녹인 맞춤 전략으로 진로에 대한 모든 고민을 함께 하겠습니다.</p>
  </div>
  <div role="tabpanel" class="tab-pane" id="profile">
	<p>진로,진학 컨설팅 대표.</p><p>경력</p><p>취업전문 컨설턴트</p><p>미래연구소 전문가과정 수료</p><p>U&H 예비컨설팅 전문가과정 수료</p>
  </div>
  <div role="tabpanel" class="tab-pane" id="messages">
	<div class="join_goods">
		<h5 class="p1">평점 0</h5>
		<h4>해외대학 취업 컨설턴트</h4>
		<p class="p2">지원자의 학업 능력을 포함한 다른 모든 조건은 충족하나 영어공인 점수가없을 시 미국대학교에서 영어집중 과정을 이수하는 조건으로 입학허가를 받을 수 있습니다. 이를'조건부 입학'이라 하며, 이수 후에는 정규 학부과정으로 학업 되기 때문에 일반적으로 진행하는 유학과 동일합니다. ​ 지원대학교에 따라서 영어집중 기간을 정식 학업기간으로 인정하여 학점을 부여는 물론 장학금까지 지급하는 대학들도 점차 늘고 있는 추세입니다. ​상담을 통해 가능여부를 확인해 보세요.</p>
		
		<p class="p1"><button type="button" onclick="location.href='expertchat.do'">구매하기</button></p>
		<p>30,000원</p>
	</div>
	<div class="join_goods">
		<h5 class="p1">평점 0</h5>
		<h4>해외대학 취업 컨설턴트</h4>
		<p class="p2">지원자의 학업 능력을 포함한 다른 모든 조건은 충족하나 영어공인 점수가없을 시 미국대학교에서 영어집중 과정을 이수하는 조건으로 입학허가를 받을 수 있습니다. 이를'조건부 입학'이라 하며, 이수 후에는 정규 학부과정으로 학업 되기 때문에 일반적으로 진행하는 유학과 동일합니다. ​ 지원대학교에 따라서 영어집중 기간을 정식 학업기간으로 인정하여 학점을 부여는 물론 장학금까지 지급하는 대학들도 점차 늘고 있는 추세입니다. ​상담을 통해 가능여부를 확인해 보세요.</p>
		
		<p class="p1"><button type="button" onclick="location.href='expertchat.do'">구매하기</button></p>
		<p>30,000원</p>
	</div>
  </div>
  <div role="tabpanel" class="tab-pane" id="settings">
	<div class="join_riview">
		<h5 class="p1">평점 0</h5>
		<h4>해외대학 취업 컨설턴트</h4>
		<p class="p2">늦은 시간에 상담되는 곳이 없어서 답답했는데 친절하게 설명도 해주시고 다양한 방법이 있어서 좋았어요!ㅠㅠ <br>덕분에 좋은 정보 잘 알고 갑니다! 유학준비할때 정말 유용하니 잘 모르시는 분들 추천해드려요!</p>
	</div>
	<div class="join_riview">
		<h5 class="p1">평점 0</h5>
		<h4>해외대학 취업 컨설턴트</h4>
		<p class="p2">늦은 시간에 상담되는 곳이 없어서 답답했는데 친절하게 설명도 해주시고 다양한 방법이 있어서 좋았어요!ㅠㅠ <br>덕분에 좋은 정보 잘 알고 갑니다! 유학준비할때 정말 유용하니 잘 모르시는 분들 추천해드려요!</p>
	</div>
  </div>
</div>

<script>
  $(function () {
    $('#myTab a:last').tab('show')
  })
</script>
		</div>
	</div>
</div>

<%@ include file="footer.jsp" %>
	
	<script>
		//$(document).ready(function() {
		$(function() {
			$(".gnb>.nav_1depth>li").hover(function() {
				$(".gnb>.nav_1depth>li").removeClass();
				$(this).addClass("active");

				//$(this).children(".nav_2depth").show();
				//}, function() {
				//  $(".gnb>.nav_1depth>li").removeClass();
				//  $(this).children(".nav_2depth").hide();
				//	});

				$(this).children(".nav_2depth").stop().slideDown("fast");
				}, function() {
				  $(".gnb>.nav_1depth>li").removeClass();
				  $(this).children(".nav_2depth").stop().slideUp("fast");
					});

				/* $(this).children(".nav_2depth").fadeIn();
				}, function() {
				  $(".gnb>.nav_1depth>li").removeClass();
				  $(this).children(".nav_2depth").fadeOut();
					}); */

			});
	</script>
	 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	 <script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>	
	<script src="../js/jquery-3.3.1.min.js"></script>
</body>
</html>