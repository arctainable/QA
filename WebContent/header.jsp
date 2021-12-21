<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<div id="container_top">
	<div id="top_menu">
		<div class="top_menu_top" class="new_font">
			<ul class="topRight">
				
					<c:choose>
						<c:when test="${empty userid}">
							<li><a href="index.do"><i class="fas fa-home"></i></a></li>
							<li><a href="login.do">로그인</a></li>
							<li><a href="member.do">회원가입</a></li>
							<li><a href="notice.do">공지사항</a></li>
						</c:when>
						<c:when test="${not empty userid}">
							<li class="first" style="font-size:14px; color:white;"><a>${userid} 님 반갑습니다!</a></li>
							<li><a href="index.do"><i class="fas fa-home"></i></a></li>
							<li><a href="logout.do">로그아웃</a></li>
							<li><a href="membercheck.do">마이페이지</a></li>
							<li><a href="notice.do">공지사항</a></li>

						</c:when>
					</c:choose>	
			</ul>
			
			<ul class="topLeft">
				<li><a href="" class="snsBasic"><i class="fab fa-instagram"></i></a></li>
				<li><a href="" class="snsBasic"><i class="fab fa-facebook"></i></a></li>
				<li><a href="" class="snsBasic"><i class="fab fa-twitter"></i></a></li>
				<li><a href="" class="snsBasic"><i class="fab fa-youtube"></i></a></li>
				<li><a href="" class="snsBasic"><i class="fas fa-comment-dots"></i></a></li>
			</ul>			
		</div>
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">New message</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label">Recipient:</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
    </div>
  </div>
</div>
		<div class="top_menu_main">	 <!-- 제목 넣는 칸 -->
			<div class="top_menu_main_left">
				<a href="index.do"><img src="images/제목 없음-3-0.png"></a>
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
				<ul><button onclick="location.href='expertlist.do'">업무의뢰</button></ul>
				<ul><button onclick="location.href='index.do'">섭외요청</button></ul>
				<ul><button onclick="location.href='index+.jsp'">일반문의</button></ul>
			</div>
		</div>
	</div>
</div>

<div id="container_top2" class="new_font">
	<div class="gnb_group">
		<nav class="gnb">
			<ul class="nav_1depth">
				<li>Quick Menu</li>
				<li><a href="expertlist.do">진로/취업</a>
			<!--	<ul class="nav_2depth">
					<li><a href="gratings.html">인사말</a></li>
					<li><a href="history.html">연혁 및 </a></li>
					<li><a href="gratings.html">교직원소개</a></li>
					<li><a href="../gallery/photo.html">대우갤러리</a></li>
					<li><a href="map.html">찾아오시는길</a></li> -->
				</li>
				<li><a href="expertlist.do">창업/비즈니스</a>
				</li>
				<li><a href="expertlist.do">심리/가정</a>
				</li>
				<li><a href="expertlist.do">미래설계</a>
				</li>
				<li><a href="expertlist.do">자산관리</a>
				</li>
				<li><a href="expertlist.do">법률</a>
				</li>
				<li><a href="expertlist.do">헬스/뷰티</a>
				</li>
				<li><a href="expertlist.do">취미/여가생활</a>
				</li>
				<li><a href="expertlist.do">운세</a>
				</li>
				<li><a href="expertlist.do">웨딩/이벤트</a>
				</li>
				<li><a href="expertlist.do">업무의뢰</a>
				</li>
				<li><a href="expertlist.do">IT/코딩</a>
				</li>
			</ul>
		</nav>
	</div>
</div>