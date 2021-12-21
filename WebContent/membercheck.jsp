<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">	
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/header&footer.css">
	<link rel="stylesheet" href="css/expert_list.css">
	<link rel="stylesheet" href="css/expert_detail.css">
	
<style>

.tab-content div {
	padding:20px;
}
#joinDataBody tr{
	margin-bott:20px;
}

</style>
	
<head>
<meta charset="UTF-8">
<title>연습용_게시판폼</title>

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
.memberlists div {
	border:1px solid black;
	padding:0px;
	padding:5px;
	text-align:center;
}
tbody tr td {
	border-top:0px;
}

.topRight .first a {
	color:white;
}
</style>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>	
<script src="js/jquery-3.3.1.min.js"></script>

<%@ include file="header.jsp"%>

<div id="container">	
	<div id="join">
		<div id="join_top">
		</div>
		<div id="join_middle">
			<ul class="nav nav-tabs" role="tablist" id="myTab">
  <li role="presentation"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">프로필</a></li>
  <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">본인인증</a></li>
   <c:choose>
	 	<c:when test="${mvo.grade==2}">
		  	<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">상품설정</a></li>
		 	<li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">리뷰관리</a></li>
	 	</c:when>
		<c:when test="${mvo.grade==3}">
			<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">상품설정</a></li>
		 	<li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">회원관리</a></li>
	   </c:when>
   </c:choose>  
</ul>

<div class="tab-content">

<!-- 프로필 -->  
  <div role="tabpanel" class="tab-pane active" id="home">
	<form name="my" method="post" id="member" method="post" class="gplc frm">
				<table class="table_write02" summary="회원가입을 위한 이름, 아이디, 비밀번호, 비밀번호확인, 소속, 유선전화번호, 휴대전화번호, 이메일, 주소, 본인확인질문, 본인확인답, 주활용사이트, 알림여부 정보 입력">
	                <colgroup>
	                    <col width="160px">
	                    <col width="auto">
	                </colgroup>
	                <tbody id="joinDataBody">
	                    <tr>
	                        <th><label for="id">아이디</label></th>
	                        <td>
	                            <input type="text" name="id" id="id" class="w300" readonly value="${mvo.id}"><br>
	                            <span id="msg" style="color:#f00"></span>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th><label for="name">닉네임</label></th>
	                        <c:choose>
		                        <c:when test="${mvo.grade==0}">
		                       		<td>
			                        	<input type="text" name="name" id="name" class="w300" value="${mvo.name}" readonly>
			                        </td>
								</c:when>
								 <c:when test="${mvo.grade!=0}">
			                        <form name="my" method="post" action="memberupdate.do" id="member" method="post" class="gplc frm">
				                        <td>
				                            <input type="text" name="name" id="name" class="w300" value="${mvo.name}">&nbsp;&nbsp;&nbsp;
				                            <button id="btn_submit2" onclick="location.href='membercheck.do'">변경</button>
				                        </td>
									</form>
								</c:when>
							</c:choose>
	                    </tr>
	                    <tr>
	                        <th><label for="pw">이메일<!-- <span class="must"><b>필수입력</b></span> --></label></th>
	                         <c:choose>
								<c:when test="${empty mvo.email}">
	                        <td>
	                            <input type="text" name="email" id="mail" class="w300" readonly value="이메일 인증이 필요합니다">
	                        </td>
	                        	</c:when>
	                        	<c:when test="${not empty mvo.email}">
	                        <td>
	                            <input type="text" name="email" id="mail" class="w300" readonly value=${mvo.email}>
	                        </td>	
	                        	</c:when>
	                        </c:choose>
	                    </tr>
						<tr>
	                        <th><label for="tel">전화번호</label></th>
	                        <td>
	                            <input type="text" name="tel" id="tel" class="w300" required value="${mvo.tel}">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th><label for="tel">회원등급</label></th>
	                        <td>
	                        <c:choose>
	                         	<c:when test="${mvo.grade==0}">
		                            <input type="text" name="tel" id="tel" class="w300" required value="신규 이용자">
	                            </c:when>
		                        <c:when test="${mvo.grade==1}">
		                            <input type="text" name="tel" id="tel" class="w300" required value="일반 이용자">
	                            </c:when>
	                            <c:when test="${mvo.grade==2}">
		                            <input type="text" name="tel" id="tel" class="w300" required value="전문가">
	                            </c:when>
	                            <c:when test="${mvo.grade==3}">
		                            <input type="text" name="tel" id="tel" class="w300" required value="관리자">
	                            </c:when>
	                        </c:choose>
	                        </td>
	                    </tr>
	               	</tbody>
            </table>
			</form>
  </div>
  
<!-- 본인인증 -->    
  <div role="tabpanel" class="tab-pane" id="profile">
  
	  <c:choose>
		<c:when test="${empty mvo.email}">
			<form name="my" method="post" action="memberupdate.do" id="member" method="post" class="gplc frm">
				<div class="container">
					<div>
						<input type="text" id="email" name="email" placeholder="이메일 입력">
						<input type="button" value="이메일인증" id="btn_email">
					</div>
					<div>
						<input type="text" id="certinumber" placeholder="인증번호 입력">
						<input type="button" id="btn_ok" value="인증확인">
						<input type="button" id="btn_submit" value="이메일 등록" style="display:none"​ onclick="location.href='membercheck.do'">						
					</div>	
				</div>
			</form>
		</c:when>
		<c:when test="${not empty mvo.email}">
			<div>
			인증이 완료되었습니다.
			</div>
		</c:when>
		</c:choose>

  </div>
  
<!-- 상품설정 -->  
  <div role="tabpanel" class="tab-pane" id="messages">
	<div class="join_goods">
		<h5 class="p1">평점 0</h5>
		<h4>해외대학 취업 컨설턴트</h4>
		<p class="p2">지원자의 학업 능력을 포함한 다른 모든 조건은 충족하나 영어공인 점수가없을 시 미국대학교에서 영어집중 과정을 이수하는 조건으로 입학허가를 받을 수 있습니다. 이를'조건부 입학'이라 하며, 이수 후에는 정규 학부과정으로 학업 되기 때문에 일반적으로 진행하는 유학과 동일합니다. ​ 지원대학교에 따라서 영어집중 기간을 정식 학업기간으로 인정하여 학점을 부여는 물론 장학금까지 지급하는 대학들도 점차 늘고 있는 추세입니다. ​상담을 통해 가능여부를 확인해 보세요.</p>
		
		<p class="p1"><button type="button" onclick="location.href='expertchat.jsp'">구매하기</button></p>
		<p>30,000원</p>
	</div>
	<div class="join_goods">
		<h5 class="p1">평점 0</h5>
		<h4>해외대학 취업 컨설턴트</h4>
		<p class="p2">지원자의 학업 능력을 포함한 다른 모든 조건은 충족하나 영어공인 점수가없을 시 미국대학교에서 영어집중 과정을 이수하는 조건으로 입학허가를 받을 수 있습니다. 이를'조건부 입학'이라 하며, 이수 후에는 정규 학부과정으로 학업 되기 때문에 일반적으로 진행하는 유학과 동일합니다. ​ 지원대학교에 따라서 영어집중 기간을 정식 학업기간으로 인정하여 학점을 부여는 물론 장학금까지 지급하는 대학들도 점차 늘고 있는 추세입니다. ​상담을 통해 가능여부를 확인해 보세요.</p>
		
		<p class="p1"><button type="button" onclick="location.href='expertchat.jsp'">구매하기</button></p>
		<p>30,000원</p>
	</div>
  </div>
 
 <style>
 .memberids {
 	width:15%;
 	height:40px;
 	float:left;
 }
 .membernames {
 	width:15%;
 	height:40px;
 	float:left;
 }
 .membertels {
 	width:25%;
 	height:40px;
 	float:left;
 }
 .memberemails {
 	width:25%;
 	height:40px;
 	float:left;
 }
 .membergrades {
 	width:10%;
 	height:40px;
 	float:left;
 }
 </style>
  
<!-- 리뷰관리, 회원관리 -->
  <div role="tabpanel" class="tab-pane" id="settings">
   <c:choose>
	 	<c:when test="${mvo.grade==2}">
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
	 	</c:when>
		<c:when test="${mvo.grade==3}">
			<div class="memberlists" style="width:90%; height:600px; border:1px solid red; margin:0px auto;">
				<div class="memberids" style="width:15%; float:left;">
				아이디
				</div>
				<div class="membernames" style="width:15%;">
				닉네임
				</div>
				<div class="membertels" style="width:25%;">
				전화번호
				</div>
				<div class="memberemails" style="width:25%;">
				이메일
				</div>
				<div class="membergrades" style="width:10%;">
				등급
				</div>
				<div class="membergrades">
				수정
				</div>
				<c:forEach var="list" items="${list}">			
					<div class="memberids" style="width:15%;">
						${list.id}
					</div>
					<div class="membernames" style="width:15%;">
						${list.name}
					</div>
					<div class="membertels" style="width:25%;">
						${list.tel}
					</div>
					<div class="memberemails" style="width:25%;">
						${list.email}
					</div>
					<form name="myform" method="get" action="memberupdate.do">
					<div class="membergrades" style="width:10%; float:left;">
						${list.grade}
						<select class="select" style="float:left;">
							<option value="3">3</option>
							<option value="2">2</option>
							<option value="1">1</option>
						</select>
						<input type="hidden" value="" name="grade" id="grade">
					</div>
					<div class="membergrades">
					<button id="btn_submit3">변경</button>
					<c:choose>
						<c:when test="${list.grade==3}">

						</c:when>
						<c:otherwise>
						<button>탈퇴</button>
						</c:otherwise>
					</c:choose>
					</div>
					</form>
				</c:forEach>
			</div>
	   </c:when>
   </c:choose>  

  </div>
  
</div>

	<script>
		 $("#btn_email").on("click", function() {
			 var email = $("#email").val();
			
			 if(email == "") {
				 alert("이메일 주소 입력");
				 $("#email").focus();
			 }else{
				 $.ajax({
					type:"post",
				 	dataType:"json",
				 	async:false,
				 	data:{"email":$("#email").val()},
				 	url:"emailsend.do",
				 	success:function(data) {
				 		alert(data.msg);
				 	}, error:function() {
				 		alert("해당 이메일로 회원가입된 정보가 없습니다.");
				 	}
				 })
			 } 
		 })
		 
		 $("#btn_ok").on("click", function() {
//			 e.preventDefault();	// 이렇게 하면 href 다음에 임시로 아무 링크를 걸어놔도 클릭했을때 페이지가 움직이지 않는다.
			 var certinumber = $("#certinumber").val();
			
			 if(certinumber == "") {
				 alert("인증번호 입력");
				 $("#certinumber").focus();
			 }else{
				 $.ajax({
					type:"post",
				 	dataType:"json",
				 	async:false,
				 	data:{"certinumber":$("#certinumber").val()
				 	},
				 	url:"certicampare.do",
				 	success:function(data) {
				 		alert(data.msg);
				 		if(data.check == "ok") {
				 			 $("#btn_submit").css("display","");
				 		} else {
				 			location.href="membercheck.do";
				 		}
				 	}, error:function() {
				 		alert("인증번호가 다릅니다.");
				 	}
				 })
			 } 
		 })
		 
		 $("#btn_submit").on("click", function() {
			 var email = $("#email").val();
			 
			 $.ajax({
				type:"post",
				dataType:"json",
				async:false,
				data:{"email":$("#email").val()},
				url:"memberupdate.do",

			 })
		 })
		 
		  $("#btn_submit2").on("click", function() {
			 var name = $("#name").val();
			 
			 $.ajax({
				type:"post",
				dataType:"json",
				async:false,
				data:{"name":$("#name").val()},
				url:"memberupdate.do",
			 })
		 })
		 
		  $("#btn_submit3").on("click", function() {
			  $("#grade").val() = $(".select option").val();
			  var grade = $("#grade").val();
			 $.ajax({
				type:"post",
				dataType:"json",
				async:false,
				data:{"grade":$(".select option").val()},
				url:"memberupdate.do",
			 })
		 })
		 
	</script>

		</div>
	</div>
	</div>
	


<%@ include file="footer.jsp" %>


</body>
</html>