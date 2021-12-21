<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>회원 가입</title>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/user.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" href="./css/회원 가입_files/style.min.css">
</head>
<body id="body-theme" class="theme-light">
<!-- 회원정보 입력/수정 시작 { -->

<div class="mb_fwrap">
	<div class="mb_wrap">
		<ul class="mb_mid steps">
			<li class="active">가입약관</li>
			<li class="active">가입정보</li>
			<li>완료</li>
		</ul>
		<div class="mb_sign mb_mid" style="padding:20px 30px 60px 30px;">
		<h1 class="mb_tit">가입정보</h1>
		<form name="my" method="post" action="memberinsertpro.do" id="member" method="post" class="gplc frm">
				<table class="table_write02" summary="회원가입을 위한 이름, 아이디, 비밀번호, 비밀번호확인, 소속, 유선전화번호, 휴대전화번호, 이메일, 주소, 본인확인질문, 본인확인답, 주활용사이트, 알림여부 정보 입력">
                <colgroup>
                    <col width="160px">
                    <col width="auto">
                </colgroup>
                <tbody id="joinDataBody">
                    <tr>
                        <th><label for="id">아이디</label></th>
                        <td>
                            <input type="text" name="id" id="id" class="w300" required><br>
                            <span id="msg" style="color:#f00"></span>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="name">닉네임</label></th>
                        <td>
                            <input type="text" name="name" id="name" class="w300" required>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="pw">비밀번호<!-- <span class="must"><b>필수입력</b></span> --></label></th>
                        <td>
                            <input type="password" name="pw" id="pw" class="w300" required>
                            <p class="guideTxt"><span class="tc_point"></p>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="pw2">비밀번호확인<!-- <span class="must"><b>필수입력</b></span> --></label></th>
                        <td>
                            <input type="password" name="pw2" id="pw2" class="w300" required>
                            <p class="guideTxt"><span class="tc_point"></span></p>
                        </td>
                    </tr>
                   
					<tr>
                        <th><label for="tel">전화번호</label></th>
                        <td>
                            <input type="text" name="tel" id="tel" class="w300" required>
                        </td>
                    </tr>
            </table>
            <div class="btnArea Acenter pt60 pb100" style="padding-top:20px;">
              <button type="submit" class="btn btn_blue btn_fx" id="btn_ok" style="float:left; width:40%; margin-left:45px; color:white;"> <a class="btn_round btn_large btn_pointColor w180" id="btn_ok"><b>확인</b></a></button>
      		  <button type="button" class="btn btn_blue btn_fx" style="float:left; width:40%;"><a href="login.do"><b>취소</b></a></button>
   			 </div>
			</form>
		</div>
	</div>
	

</div>

<script type="text/javascript" async="" src="./회원 가입_files/analytics.js.다운로드"></script><script type="text/javascript" async="" src="./회원 가입_files/recaptcha__ko.js.다운로드" crossorigin="anonymous" integrity="sha384-RZ56nBsl+UFLVl7q81LIT6XREPJTJXpbvwkyFAm3oAKAZnD6npn0hg3GwSA2cF8F"></script>
<script async="" src="./회원 가입_files/js"></script>
<script async="" src="./회원 가입_files/f.txt"></script>
<script type="text/javascript" src="./회원 가입_files/jquery.min.js.다운로드"></script>
<script type="text/javascript" src="./회원 가입_files/cu.js.다운로드"></script>
<script type="text/javascript" src="./회원 가입_files/place.js.다운로드"></script><script type="text/javascript" src="./회원 가입_files/register_check.js.다운로드"></script><script src="./회원 가입_files/api.js.다운로드"></script><script src="./회원 가입_files/recaptcha.js.다운로드"></script>


	<script type="text/javascript">
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
			
			$("#btn_ok").on("click", function() {
				if(!$("#id").val()) {
					alert("아이디 입력")
					$("#id").focus();
					return false;
				}
				if(!$("#name").val()) {
					alert("이름입력")
					$("#name").focus();
					return false;
				}
				if(!$("#pw").val()) {
					alert("패스워드입력")
					$("#pw").focus();
					return false;
				}
				if($("#pw").val()!=$("#pw2").val()) {
					alert("패스워드 불일치");
					$("#pw").focus();
					return false;
				}
				if(!$("#tel").val()) {
					alert("전화번호입력")
					$("#tel").focus();
					return false;
				}
					$("#member").submit();				
			});
			
			$("#id").blur(function() {
				
			 var idRegExp = /^[a-zA-z0-9]{5,15}$/;
				
				if(!idRegExp.test($("#id").val())) {	
					$("#msg").html("아이디가 영문 대소문자 5~15자 이내인지 확인해주세요");
					$("#id").val("");
					$("#id").focus();
					return false;
				}
				$.ajax({
					type:'post',
					url:'checkUserid.do',
					data:{id:$("#id").val()},
					success:function(data) {
						if(data != 1) {
							if($("#id").val()!="") {
								$("#msg").html("아주 좋은 아이디 입니다.");
							}
						} else {
							if($("#id").val() != "") {
								$("#msg").html("사용중인 아이디입니다.");
								$("#id").val("");
								$("#id").focus();
							}
						}
					},
					error:function() {
						alert("프로그램 오류");
					}
				})
			})	
		});
	</script>


<div><div class="grecaptcha-badge" data-style="bottomright" style="width: 256px; height: 60px; display: block; transition: right 0.3s ease 0s; position: fixed; bottom: 14px; right: -186px; box-shadow: gray 0px 0px 5px; border-radius: 2px; overflow: hidden;"><div class="grecaptcha-logo"><iframe src="./회원 가입_files/anchor.html" width="256" height="60" role="presentation" name="a-7vk1zkxy91gp" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox"></iframe></div><div class="grecaptcha-error"></div><textarea id="g-recaptcha-response-100000" name="g-recaptcha-response" class="g-recaptcha-response" style="width: 250px; height: 40px; border: 1px solid rgb(193, 193, 193); margin: 10px 25px; padding: 0px; resize: none; display: none;"></textarea></div><iframe style="display: none;" src="./회원 가입_files/saved_resource.html"></iframe></div></body></html>