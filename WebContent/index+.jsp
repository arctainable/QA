<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습용_인덱스+</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/header&footer.css">	
	<link rel="stylesheet" href="css/index_normal.css">
</head>
<body style="background:#F2F2F2;">

<div id="container_top">
	<div id="top_menu">
		<div class="top_menu_top">
			<ul class="topRight">
				<li><a href="index+.jsp"><i class="fas fa-home"></i></a></li>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="약관복.html">회원가입</a></li>
				<li><a href="">마이페이지</a></li>
				<li><a href="notice.jsp">공지사항</a></li>
			</ul>
			<ul class="topLeft">
				<li><a href="" class="snsBasic"><i class="fab fa-instagram"></i></a></li>
				<li><a href="" class="snsBasic"><i class="fab fa-facebook"></i></a></li>
				<li><a href="" class="snsBasic"><i class="fab fa-twitter"></i></a></li>
				<li><a href="" class="snsBasic"><i class="fab fa-youtube"></i></a></li>
				<li><a href="" class="snsBasic"><i class="fas fa-comment-dots"></i></a></li>
			</ul>			
		</div>

		<div class="top_menu_main">	 <!-- 제목 넣는 칸 -->
			<div class="top_menu_main_left">
				<a href="index+.jsp"><img src="images/제목 없음-3.png"></a>
			</div>
			<div class="top_menu_main_right">
				<ul class="search_box">
				  <li class="container-4">
					<input type="search" id="search" placeholder="Search..." />
					<button class="icon"><a href=""><i class="fa fa-search"></i></a></button>
				  </li>
				</ul>
			</div>
			<div class="top_menu_main_right_2">
				<ul><button onclick="location.href='index.jsp'">전문가</button></ul>
			</div>
		</div>
	</div>
</div>
<div id="container">		
	
	<div class="box">
		<div class="interest">
			<ul>
				<li><a href=""> <i class="fas fa-laptop"></i> 코딩</a></li>
			</ul>
			<ul>
				<li><a href=""> <i class="fas fa-utensils"></i> 음식</a></li>
			</ul>
			<ul>
				<li><a href=""><i class="fas fa-funnel-dollar"></i> 주식</a></li>
			</ul>
			<ul>
				<li><a href=""> <i class="fas fa-handshake"></i> 사회</a></li>
			</ul>
			<ul>
				<li><a href=""> <i class="fas fa-atom"></i> 화학</a></li>
			</ul>
			<ul><a href="">관심분야 추가하기 <i class="far fa-plus-square"></i> </a></ul>
		</div>
		<div class="content_list">
			<div class="content_write">
				<a href="" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" style="border:0; outline:0; background:none;">
					<ul>
						<img src="images/gyull.jpg"/>&nbsp;&nbsp;사용자
					</ul>
					<ul>
					무엇이 궁금하신가요?
					</ul>
				</a>
			</div>
			<div class="content_post">
				
				<div class="content_post_image">
					<img src="images/카톡.jpg" alt="..." class="img-rounded">
				</div>
				<div class="content_post_word">
				<div class="content_post_word_text">
					카카오톡의 qr 체크인 기능을 아시나요?
					 <input class="theb" value="..더보기" onclick="if(this.parentNode.getElementsByTagName('div')[0].style.display != ''){this.parentNode.getElementsByTagName('div')[0].style.display = '';this.value = '..숨기기';}else{this.parentNode.getElementsByTagName('div')[0].style.display = 'none'; this.value = '..더보기';}" type="button" style="border:0px; color:black; background:white; font-size:13px;"/>
					<div class="theb2" style="display: none;"><br>실험실 옵션에서 qr 체크 기능이 추가되었습니다..실험실 옵션에서 qr 체크 기능이 추가되었습니다..실험실 옵션에서 qr 체크 기능이 추가되었습니다..실험실 옵션에서 qr 체크 기능이 추가되었습니다..실험실 옵션에서 qr 체크 기능이 추가되었습니다..실험실 옵션에서 qr 체크 기능이 추가되었습니다..실험실 옵션에서 qr 체크 기능이 추가되었습니다..실험실 옵션에서 qr 체크 기능이 추가되었습니다..실험실 옵션에서 qr 체크 기능이 추가되었습니다..실험실 옵션에서 qr 체크 기능이 추가되었습니다..실험실 옵션에서 qr 체크 기능이 추가되었습니다..실험실 옵션에서 qr 체크 기능이 추가되었습니다.. </div>
				</div>
				</div>
				<div class="content_post_comment">
					<div class="content_post_comment1">
						<button><i class="far fa-arrow-alt-circle-up"></i>좋아요</button>
					</div>
					<div class="content_post_comment2">
						<button type="button" class="navyBtn" onClick="location.href='연습용_글.html'"><i class="far fa-comment-dots"></i>답글 달기</button>
					</div>
					<div class="content_post_comment3">
						<button><i class="fas fa-thumbs-up"></i>공유하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div id="footer">
		<div id="footer_left">
			<img src="images/제목 없음-3-1.png">
		</div>
		<div id="footer_center">
			<p>개인정보처리방침  | 개인정보보호정책 | 이용약관 | 협회소개</p>
			우편번호 (26349) 강원 원주시 호저면 우무개로 365 2층, 2호 | 사업자번호 : 209-82-64664<br>
			TEL: 033-747-4012 | FAX: 033-747-4014 | E-mail: korbamtb@daum.net<br>
			COPYRIGHT 2012 KOREA OFF ROAD BIKE ASSOCIATION. ALL RIGHT RESERVED		
		</div>
		<div id="footer_right">
			서울사무소: (02) 4545- 8545<br>
			대전사무소: (042) 5417- 8842<br>
			광주사무소: (052) 4545- 2214<br>
			부산사무소: (048) 4545- 7546
		</div>	
	</div>


	<!-- 모달 창 -->

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">새로운 질문</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label">제목</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">내용</label>
            <textarea class="" id=""></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
		<input type="file" />
		<button type="button" class="btn btn-primary">글쓰기</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		
      </div>
    </div>
  </div>
</div>
<!-- 모달 창 끝 -->

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>