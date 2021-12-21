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
		<div id="join_right"  class="new_font">
			<form name="member">
				<fieldset>
					<legend> 공지사항 <i class="far fa-check-square"></i>
											</legend>
					<table>
						<colgroup>
							<col width="220" />
							<col height="380" />
						</colgroup>
						<tbody>
						<div class="record_group">
							<p>&nbsp;&nbsp;&nbsp;총<span> ${count}</span>건</p>
						</div>
							<div id="notice_main">	
								<div id="notice_main_middle" class="new_font">
									<div id="notice_main_middle_1">
										<div id="notice_main_middle_1_1">
										번호
										</div>
										<div id="notice_main_middle_1_2">
										제목
										</div>
										<div id="notice_main_middle_1_1">
										첨부파일
										</div>
										<div id="notice_main_middle_1_3">
										작성일
										</div>
										<div id="notice_main_middle_1_4">
										작성자
										</div>
										<div id="notice_main_middle_1_1">
										조회수
										</div>
									</div>
									<div id="notice_main_middle_2">
										<c:set var="num" value="${count-((pagemaker.cri.pageNum-1)*10)}"/>
										<c:forEach var="list" items="${list}">
											<div id="notice_main_middle_all">
												<div id="notice_main_middle_2_1">${num}</div>
												<div id="notice_main_middle_2_2" class="title"><a href="noticeview.do?bno=${list.bno}&pageNum=${pagemaker.cri.pageNum}&amount=${pagemaker.cri.amount}&sel=${pagemaker.cri.type}&word=${pagemaker.cri.keyword}">${list.title}</a></div>
												<div id="notice_main_middle_2_3">
													<c:if test="${null ne list.imgurl}">
														<i class="fas fa-file"></i>
													</c:if>
												</div>
												<div id="notice_main_middle_2_4">${list.regdate.substring(0,10)}</div>
												<div id="notice_main_middle_2_3">${list.writer}</div>
												<div id="notice_main_middle_2_5">${list.viewcount}</div>
											</div>
										<c:set var="num" value="${num-1}" />	
										</c:forEach>
									</div>
								</div>
								<div>
								</div>
								<div id="notice_main_bottom">							
									<div id="notice_main_bottom_3">
										 <div class="search_wrap">
											<form name="myform" id="notice_main_bottom_3" method="get" action="notice.do">
												<select name="sel" class="select">
													<option value="title">제목</option>
													<option value="content">내용</option>
												</select>
												<div id="searchtext">
												<input type="text" name="word" class="search_word" value="<%=request.getParameter("word") %>" >
												</div>
												<div>
												<button class="btn_search" type="submit"><i class="fa fa-search">search</i></button>
												</div>
											</form>
									  </div> <!-- search end -->
									</div>
									<div id="notice_main_bottom_1">
										<div>
											<div class="paging">
												<c:if test="${pagemaker.prev}">
													<a href="${pagemaker.startPage-1}"><i class="fa  fa-angle-double-left"></i></a>
												</c:if>
												<c:forEach var="num" begin="${pagemaker.startPage}" end="${pagemaker.endPage}">
													<c:choose>
														<c:when test="${null ne pagemaker.cri.keyword}">
															<a href="notice.do?pageNum=${num}&amount=10&sel=${pagemaker.cri.type}&word=${pagemaker.cri.keyword}" class="${pagemaker.cri.pageNum==num ? 'active':''}">${num}</a>
														</c:when>
														<c:otherwise>
															<a href="notice.do?pageNum=${num}&amount=10" class="${pagemaker.cri.pageNum==num ? 'active':''}">${num}</a>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:if test="${pagemaker.next}">
													<a href="${pagemaker.endPage+1}"><i class="fa  fa-angle-double-right"></i></a>
												</c:if>	
											</div>
										</div>
									</div>
									<div id="notice_main_bottom_2">
									<c:choose>
									<c:when test="${userid eq 'master'}">
										<button><a href="noticewrite.do">글쓰기</a></button>
									</c:when>
									<c:otherwise>
									</c:otherwise>
									</c:choose>
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
	<form id="actionForm" action="notice.do" method="get">
		<input type="hidden" name="pageNum" value="${pagemaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pagemaker.cri.amount}">
 		<input type="hidden" name="sel" value="${pagemaker.cri.type}">
		<input type="hidden" name="word" value="${pagemaker.cri.keyword}">
	</form>
	<script>
		$(function() {
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