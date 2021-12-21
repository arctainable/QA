<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<title>연습용_전문가채팅</title>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/header&footer.css">
<link rel="stylesheet" href="css/expert_list.css">
<link rel="stylesheet" href="css/expert_detail.css">
<link rel="stylesheet" href="css/expert_chat.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
<script src="../js/jquery-3.3.1.min.js"></script>

</head>

<%@ include file="header.jsp"%>


<style>
#container {
	padding-top: 150px;
}

#container_top2 {
	float: left;
	width: 200px;
	height: 0px;
	padding-top: 150px;
	padding-left: 30px;
	position: fixed;
}

.gnb_group ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 150px; //
	background-color: #f1f1f1;
	border: 1px solid #ffA2AD;
}

.gnb_group li a {
	display: block;
	color: #000;
	padding: 8px 16px;
	text-decoration: none;
}

.gnb_group li {
	text-align: center; //
	border-bottom: 1px solid #ffA2AD;
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
	background: gray;
	color: white;
	font: bold;
}

.nav_1depth li { //
	font: bold;
}

#messagebox {
	margin-left: 262px;
	border: 1px solid black;
	width: 500px;
	height: 550px;
	padding: 10px;
}

#messageWindow {
	width: 478px;
	height: 480px;
	border: 1px solid black;
	overflow-y: auto;
	padding: 10px;
	margin-bottom: 10px;
}

#join_middle {
	padding-top: 15px;
}

#join_top_1 {
	float: left;
	width: 45%;
	height:80%;
	background:white;
	margin:10px;
//	border:1px solid green;
	border-radius:30px;
	text-align:center;
	padding-top:30px;
	font-size:20px;
	box-shadow: -5px 5px 5px -5px green;
}

#join_top_2 {
	float: right;
	width: 48%;
	height:80%;
	background:white;
	margin:10px;
//	border:1px solid green;
	border-radius:30px;
	text-align:center;
	padding-top:30px;
	font-size:17px;
	box-shadow: -5px 5px 5px -5px green;
}

#messagebox #chatinput {
	float: left;
	width: 50%;
}

#messagebox #fileinput {
	float: left;
	width: 50%;
}

#messagebox #fileinput #image {
	float: left;
	margin-right: 10px;
}

#messagebox #fileinput #file {
	float: left;
	width: 50%;
}
#messagebox {
	background:#9bbbd4;
	border-radius:7px;
	border:0px;
}
fieldset {
	height:700px;
}

</style>


<div id="container">
	<div id="join">
		<div id="join_top">
			<div id="join_top_1">해외대학 취업 컨설턴트</div>
			<div id="join_top_2">
				<%

Date now = new Date();

SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");

String today = sf.format(now);

sf = new SimpleDateFormat("yyyy년MM월dd일 E요일 a hh:mm:ss");

today = sf.format(now);

%>

<%=today %>
			</div>
		</div>
		<div id="join_middle">
			<c:choose>
				<c:when test="${empty userid}">

				</c:when>
				<c:when test="${not empty userid}">
					<input value='${userid}' id="chat_id" />
				</c:when>
			</c:choose>
			<!--     채팅창 -->
			<div>
				<fieldset>
					<c:choose>
						<c:when test="${empty userid}">
							<div id="messagebox">
								<div id="messagewindow">로그인하지 않은 계정으로는 채팅에 접근할 수 없습니다.</div>
							</div>
						</c:when>
						<c:when test="${not empty userid}">
							<div id="messagebox">
								<div id="messageWindow"></div>
								<div id="chatinput">
									<input id="inputMessage" type="text" value="" onkeyup="enter()" />
									<!-- input을 누르면 enter()라는 함수를 실행함 -->
									<input type="submit" value="send" onclick="send()" />
								</div>
								<div id="fileinput">
									<img id="image" src="http://dy.gnch.or.kr/img/no-image.jpg"
										style="width: 25px; height: 25px;"> <input id=file
										type=file>
								</div>
							</div>

						</c:when>
					</c:choose>
				</fieldset>
			</div>
		</div>
	</div>
</div>

<div id="footer">
	<div id="footer_left">
		<img src="images/제목 없음-3-1.png">
	</div>
	<div id="footer_center">
		<p>개인정보처리방침 | 개인정보보호정책 | 이용약관 | 협회소개</p>
		우편번호 (26349) 강원 원주시 호저면 우무개로 365 2층, 2호 | 사업자번호 : 209-82-64664<br>
		TEL: 033-747-4012 | FAX: 033-747-4014 | E-mail: korbamtb@daum.net<br>
		COPYRIGHT 2012 KOREA OFF ROAD BIKE ASSOCIATION. ALL RIGHT RESERVED
	</div>
	<div id="footer_right">
		서울사무소: (02) 4545- 8545<br> 대전사무소: (042) 5417- 8842<br>
		광주사무소: (052) 4545- 2214<br> 부산사무소: (048) 4545- 7546
	</div>
</div>

<script type="text/javascript">
    var textarea = document.getElementById("messageWindow");
    var webSocket = new WebSocket('ws://192.168.0.88:1234/expert/chatsoket');
    var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
        onError(event)
    };
    webSocket.onopen = function(event) {
        onOpen(event)
    };
    webSocket.onmessage = function(event) {
        onMessage(event)
    };
    function onMessage(event) {
        var message = event.data.split("|");
        var sender = message[0];
        var content = message[1];
        if (content == "") {
        } else {
            $("#messageWindow").html($("#messageWindow").html()
                + "<p class='chat_content'>" + sender + " : " + content + "</p>");
            
        }
       
    }
    function onOpen(event) {
        $("#messageWindow").html("<p class='chat_content'>채팅에 참여하였습니다.</p>");
    }
    function onError(event) {
        alert(event.data);
    }
    function send(message) {
        if (message == "") {
 //       	break;
        } else {
            $("#messageWindow").html($("#messageWindow").html()
                + "<p class='chat_content'>나 : " + message + "</p>");
            console.log(message);
        }
        
        $.ajax({
        	url:"chatsubmit.do",
        	type:"post",
        	data:{
        		id:$("#chat_id").val(),
        		content:message
        	},
        	success:function(){
        		 $("#inputMessage").val()
        	},
        	error:function(xhr,status,error){
        		alert(error);
        	}
        })
        webSocket.send($("#chat_id").val() + "|" + message);
        inputMessage.value = "";
    }
    //     채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
//    window.setInterval(function() 
//    		{
//        var elem = document.getElementById('messageWindow');
//        elem.scrollTop = elem.scrollHeight;
//    }, 0);
    
    function enter(){
    	if(window.event.keyCode == 13){
    		send(inputMessage.value);
    	}
    }

  var file = document.getElementById('file');
  var image = document.getElementById('image');
  var image1 = document.getElementById('image').getAttribute('src');
  file.onchange = function (event) {
    var target = event.currentTarget;
    var xmlHttpRequest = new XMLHttpRequest();
    xmlHttpRequest.open('POST', 'https://api.imgur.com/3/image/', true);
    xmlHttpRequest.setRequestHeader("Authorization", "Client-ID de2189c7430f93e");
    xmlHttpRequest.onreadystatechange = function () {
      if (xmlHttpRequest.readyState == 4) {
        if (xmlHttpRequest.status == 200) {
          var result = JSON.parse(xmlHttpRequest.responseText);
          image.src = result.data.link;
          console.log(result);
          console.log(file);
          console.log(image);          
          var image1 = document.getElementById('image').getAttribute('src');
          console.log(image1);
          
          message = "<a class=\"chatimage\" onclick=\"window.open('"+image1+"', '_blank', 'width=800, height=600'); return false;\" href=\"" + image1 + "\">" + image1 + "</a>";
		  send(message);
        }
        else {
        	alert("업로드 실패");
          image.src = "http://dy.gnch.or.kr/img/no-image.jpg";
        }
      }
    };
    xmlHttpRequest.send(target.files[0]);
    image.src = "https://nrm.dfg.ca.gov/images/image-loader.gif";

    window.setInterval(function() {
        var elem = document.getElementById('messageWindow');
        elem.scrollTop = elem.scrollHeight;
    }, 0);
    
  };
  
</script>

</body>
</html>