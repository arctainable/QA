<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 아이디 비밀번호 찾기 </title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link rel="stylesheet" href="css/header&footer.css">
<style type="text/css">
*{padding:0; margin:0;}
body{
	background : url("images/제목 없음.png");
	background-size:cover;
	background-repeat:no-repeat;
	position:relative;
}
#box {
//	margin:0 auto;
	width: 500px;
	height: 602px;
//	background-color: white;
	border:0px;
	padding:0px;
}
#big {
	width: 400px;
	height: 200px;
	padding: 50% 0px 0px 33%;
//	background:black;
	
}
#left {
	float:left;
	width: 97px;
	height:167px;
	background-color: white;
	border-top:3px solid gray;
	border-left:3px solid gray;
	border-radius:10px 0 0 0;
}
#middle {
	float:left;
	width: 200px;
	height:167px;
	background-color: white;
	border-top:3px solid gray;
}
#right {
	float:left;
	width: 97px;
	height:167px;
	background-color: white;
	border-top:3px solid gray;
	border-right:3px solid gray;
	border-radius:0 10px 0 0;
}
#bottom {
	clear:both;	
	width: 394px;
	height:27px;
	background-color: white;
	border-left:3px solid gray;
	border-bottom:3px solid gray;
	border-right:3px solid gray;
	border-radius:0 0 10px 10px;
}
#center-left { 
	margin: 75px 0;
}
#center-middle { 
	margin: 60px 0;
}
#center-right { 
	margin: 60px 0;
}
#center-bottom { 
	margin: 10px 0;
}
a{
	text-decoration:none;
}
#home {
	position:relative;
	width:75vw;
	height:10px;
	margin 0 auto;
	color:black;
//	background:black;
	margin-left:230px;
	margin-top:8px;
	margin-right:230px;
}
.topRight li a {
	color:black;
}	
.top_menu_top {
	position:absolute;
	width:100%;
}
.topRight {
	float:right;
}
.topLeft {
	flaot:left;
}
</style>
<body>
<div id="box">
<div id="home">
			<div class="top_menu_top">
				<ul class="topRight">
					<li><a href="index.do" style="padding-top:0px;"><i class="fas fa-home"></i></a></li>
					<li><a href="login.do">로그인</a></li>
					<li><a href="member.do">회원가입</a></li>
					<li><a href="notice.do">공지사항</a></li>
				</ul>
				<ul class="topLeft">
					<li><a class="snsBasic"><i class="fab fa-instagram"></i></a></li>
					<li><a class="snsBasic"><i class="fab fa-facebook"></i></a></li>
					<li><a class="snsBasic"><i class="fab fa-twitter"></i></a></li>
					<li><a class="snsBasic"><i class="fab fa-youtube"></i></a></li>
					<li><a class="snsBasic"><i class="fas fa-comment-dots"></i></a></li>
				</ul>			
			</div>
		</div>
	<div id="big">
			<form id="frmLogin" method="post" name="frmLogin" action="loginpro.do">
		<div id="left">
			<h3 id="center-left" style="text-align: center;">	
				LOGIN
			</h3>
		</div>
		<div id="middle">
			<table>
				<div id="center-middle" style="text-align: center;"></div>
					<tr>
						<td style="text-align:center">
							<label for="id">ID</label>
						</td>
						<td>
							<input type="text" size="12" maxlength="8" name="id" id="id" />
						</td>
					</tr>
					<tr>
						<td style="text-align:center">
							<label for="pw">비밀번호</label>
						</td>
						<td>
							<input type="password" size="15" maxlength="8" name="pw" id="pw" />
						</td>
					</tr>
				
			</table>
		</div>
		<div id="right">
			<div id="center-right" style="text-align: center;">
				<input type="submit" name="login"  style="width:60px; height:60px;" value="로그인" />
			</div>
		</div>
		<div id="bottom">
			<div id="center-bottom" style="text-align: center;">
				<ul>
					<a href="member.do" target="_blank" style="color: black">
						[회원가입]
					</a>
					&nbsp;
					<a href="membercheck.do" target="_blank" style="color: black">
						[ID/비밀번호찾기]
					</a>
				</ul>
			</div>
		</div>
		</form>
	</div>
</div>

</body>
</head>
</html>