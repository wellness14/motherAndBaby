<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi"/>
<title>마더앤베이비 산후도우미 서비스 소개</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<style>
	
</style>
<script src="js/jquery-1.11.3.min.js"></script>
<script>
	window.onload = function() {
        // post our message to the parent
        window.parent.postMessage(
            // get height of the content
            document.body.scrollHeight
            // set target domain
            ,"*"
        )
    };

	$(document).ready(function(){

	});
</script>

</head>
<body>
<div class="contentWrap">
	<img src="img/serviceIntro.png" alt="마더앤베이비 산후도우미 소개이미지">
	<img src="img/serviceIntroduce.png" alt="마더앤베이비 산후도우미 소개이미지">
</div>
</body>
</html>