<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/font-awesome.min.css">	
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/header&footer.css">
	<link rel="stylesheet" href="css/notice.css">
	
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

.topRight .first a {
	color:white;
}
</style>

<%@ include file="header.jsp"%>

<div id="container">	
	<div id="join">
		<div id="join_right">
			<div id="join_right">
			<form name="member" enctype="multipart/form-data">
				<fieldset>
					<legend>NOTICE <i class="far fa-check-square"></i></legend>
					<table>
						<colgroup>
							<col width="220" />
							<col height="380" />
						</colgroup>
						<tbody>
							<div id="noticewrite_main" >
								<div id="noticewrite_main_top">
									<div id="noticewrite_main_top_1">
									<i class="fas fa-star-of-life font1"></i><strong>Title</strong>
									</div>
									<div id="noticewrite_main_top_2_see">
									<input type="text" name="title" readonly value="${nvo.title}"></div>
								</div>
								<div id="noticewrite_main_middle">
									<div id="noticewrite_main_middle_1">
										<div id="noticewrite_main_middle_1_1">
											<i class="fas fa-star-of-life font1"></i> <strong>Content</strong>
										</div>
										<div id="noticewrite_main_middle_1_2_see">
											<textarea readonly>${nvo.content}</textarea>
										</div>
									</div>
									<div id="noticewrite_main_middle_2">
										<div id="noticewrite_main_middle_2_1">
											<i class="fas fa-star-of-life font1"></i> <strong>Attach</strong>
										</div>
										<div id="noticewrite_main_middle_2_2">
											<div>
												<c:if test="${null ne nvo.imgurl}">
												${nvo.imgurl}&nbsp;<button><a href="noticeupload/${nvo.imgurl}" download>다운로드</a></button>
												</c:if>
											</div>
										</div>
									</div>
									<div id="noticewrite_main_middle_2">
										<div id="noticewrite_main_middle_2_1">
											&nbsp <strong>Writer</strong>
										</div>
										<div id="noticewrite_main_middle_2_2">${nvo.writer}</div>
										<div id="noticewrite_main_middle_2_3">
											<strong>Reg Date</strong>
										</div>
										<div id="noticewrite_main_middle_2_4">
											${nvo.regdate.substring(0,10)}
										</div>
									</div>
								</div>
								<div id="noticewrite_main_bottom_see">
										
										<c:choose>
											<c:when test="${mvo.grade == 3}">
											<button><a href="notice.do">LIST</a></button>
											<button><a href="noticeupdate.do?bno=${nvo.bno}">수정</a></button>
											<button><a href="noticedelete.do?bno=${nvo.bno}">삭제</a></button>
											</c:when>
											<c:otherwise>
											<button style="margin-left:120px;"><a href="notice.do">목록</a></button>
											</c:otherwise>
										</c:choose>
										
									</div>
								</div>
							
						</tbody>
					</table>
				</fieldset>
			</form>
			</div>
		</div>
	</div>
	</div>


<form id="actionForm" action="notice.do" method="get">
		<input type="hidden" name="pageNum" value="${pagemaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pagemaker.cri.amount}">
 		<input type="hidden" name="sel" value="${pagemaker.cri.type}">
		<input type="hidden" name="word" value="${pagemaker.cri.keyword}">

	</form>
	<script>
		$(function() {
			$(".location  .dropdown > a").on("click",function(e) {
				e.preventDefault();
				if($(this).next().is(":visible")) {
					$(".location  .dropdown > a").next().hide();
				} else {
					$(".location  .dropdown > a").next().hide();
					$(this).next().show();
				}
			});
			
			var actionForm = $("#actionForm");
			$(".paging > a").on("click", function(e) { // > 자손선택(중간에 div나 p가 섞이지 않은 paging 밑에 a태그만 있는 것을 찾아 적용시키는 방법)
				e.preventDefault();	
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
		});
	</script>

<%@ include file="footer.jsp" %>

<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>	
</body>
</html>