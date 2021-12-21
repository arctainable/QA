<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습용_전문가목록</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/header&footer.css">
	<link rel="stylesheet" href="css/expert_list.css">


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
.topRight .first a {
	color:white;
}
</style>

<%@ include file="header.jsp"%>


<div id="container">	
	<div id="join">
		<div id="join_right">
			<form name="member">
				<fieldset>
					<legend> 진로/취업 <i class="far fa-check-square"></i></legend>
					<table>
						<tbody>
							<div id="expert_main">
								<div id="expert_main_one">
									<div id="expert_main_left">
										<img src="images/전문가.png" alt="전문가1">
									</div>
									<div id="expert_main_middle">
										<div class="caption">
											<h3>expert2</h3>
											
											<p>진로/취업<br></p>
										  </div>
										  <div class="captionmake">
										  대한민국을 변화시키고 고객을 변화시키는 명강사의 길! <br>명강사 최고위 과정에서 지혜와 정보 습득! <br>실력과 마케팅력을 습득하여 명강사로 가는 네비게이션! <br>도전! 희망을 드립니다. 
										  </div>
									</div>
									<div id="expert_main_right">
										<h1>0</h1>
										<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
										<button type="button" onclick="location.href='expertdetail.do' ">상세보기</button>
									</div>
								</div>
								<div id="expert_main_one">
									<div id="expert_main_left">
										<img src="images/전문가.png" alt="전문가1">
									</div>
									<div id="expert_main_middle">
										<div class="caption">
											<h3>홍길동</h3>
											
											<p>진로/취업<br></p>
										  </div>
										  <div class="captionmake">
										  대한민국을 변화시키고 고객을 변화시키는 명강사의 길! <br>명강사 최고위 과정에서 지혜와 정보 습득! <br>실력과 마케팅력을 습득하여 명강사로 가는 네비게이션! <br>도전! 희망을 드립니다. 
										  </div>
									</div>
									<div id="expert_main_right">
										<h1>0</h1>
										<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
										<button type="button" onclick="location.href='expertdetail.do' ">상세보기</button>
									</div>
								</div>
								<div id="expert_main_one">
									<div id="expert_main_left">
										<img src="images/전문가.png" alt="전문가1">
									</div>
									<div id="expert_main_middle">
										<div class="caption">
											<h3>홍길동</h3>
											
											<p>진로/취업<br></p>
										  </div>
										  <div class="captionmake">
										  대한민국을 변화시키고 고객을 변화시키는 명강사의 길! <br>명강사 최고위 과정에서 지혜와 정보 습득! <br>실력과 마케팅력을 습득하여 명강사로 가는 네비게이션! <br>도전! 희망을 드립니다. 
										  </div>
									</div>
									<div id="expert_main_right">
										<h1>0</h1>
										<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
										<button type="button" onclick="location.href='expertdetail.do' ">상세보기</button>
									</div>
								</div>
								<div id="expert_main_one">
									<div id="expert_main_left">
										<img src="images/전문가.png" alt="전문가1">
									</div>
									<div id="expert_main_middle">
										<div class="caption">
											<h3>홍길동</h3>
											
											<p>진로/취업<br></p>
										  </div>
										  <div class="captionmake">
										  대한민국을 변화시키고 고객을 변화시키는 명강사의 길! <br>명강사 최고위 과정에서 지혜와 정보 습득! <br>실력과 마케팅력을 습득하여 명강사로 가는 네비게이션! <br>도전! 희망을 드립니다. 
										  </div>
									</div>
									<div id="expert_main_right">
										<h1>0</h1>
										<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
										<button type="button" onclick="location.href='expertdetail.do' ">상세보기</button>
									</div>
								</div>
								<div id="notice_main_bottom">							
									<div id="notice_main_bottom_3">
										<div id="searchtext">
											<input type="text" placeholder="이름 검색"/>
										</div>
										<div>
											<button><a href=""><i class="fas fa-search"></i>검색</a>
										</div>	
									</div>
									<div id="notice_main_bottom_1">
										<div>
											<div>
											<a href="">‹‹</a>
											</div>
											<div>
											<a href="">‹</a>
											</div>
											<div>
											<a href="">1</a>
											</div>
											<div>
											<a href="">2</a>
											</div>
											<div>
											<a href="">3</a>
											</div>
											<div>
											<a href="">4</a>
											</div>
											<div>
											<a href="">5</a>
											</div>
											<div>
											<a href="">›</a>
											</div>
											<div>
											<a href="">››</a>
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</tbody>
					</table>
				</fieldset>
			</form>
		</div>
	</div>
</div>

<%@ include file="footer.jsp"%>
	
	<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>	
	<script src="js/jquery-3.3.1.min.js"></script>
</body>
</html>