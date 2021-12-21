<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<img id=image src="http://dy.gnch.or.kr/img/no-image.jpg">
<br>
<input id=file type=file>

<script>
  var file = document.getElementById('file');
  var image = document.getElementById('image');
  file.onchange = function(event) {
    var target = event.currentTarget;
    var xmlHttpRequest = new XMLHttpRequest();
    xmlHttpRequest.open('POST', 'https://api.imgur.com/3/image/', true);
    xmlHttpRequest.setRequestHeader("Authorization", "Client-ID 988686d5f016ee9");
    xmlHttpRequest.onreadystatechange = function() {
      if (xmlHttpRequest.readyState == 4) {
        if (xmlHttpRequest.status == 200) {
          var result = JSON.parse(xmlHttpRequest.responseText);
          image.src = result.data.link;
          console.log(result);
        } else {
          alert("업로드 실패");
          image.src = "http://dy.gnch.or.kr/img/no-image.jpg";
        }
      }
    };
    xmlHttpRequest.send(target.files[0]);
    image.src = "https://nrm.dfg.ca.gov/images/image-loader.gif";
  };

</script>


</script>