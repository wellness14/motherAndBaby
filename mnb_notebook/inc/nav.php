<?php session_start(); ?>
<nav class="navbar navbar-inverse navbar-fixed-top" style="background-color:#00A9A6;">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar" style="background-color:#00A9A6; border-color:#00A9A6; padding-bottom:0px; float:left;">
				<span class="sr-only">Toggle navigation</span>
				<span style="float:left;"><img src="img/02_menu_02.png" /></span>
			</button>
			<button type="button" class="navbar-toggle collapsed" data-toggle="modal" data-target="#searchModal" style="background-color:#00A9A6; border-color:#00A9A6; padding-bottom:0px;"aria-expanded="false" aria-controls="searchModal">
				<span class="sr-only">Search navigation</span>
				<span><img src="img/02_menu_04.png" height="20" /></span>
			</button>
			<div style="text-align:center; line-height:51px;"><a href="campaign.php"><img src="img/02_menu_03.png" /></a></div>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				
				
				<?php 
				if($_SESSION['user_id'] == "admin@admin.com"){ ?>
				<li><a href="admin_list_campaign.php" style="color:#FFFFFF;">캠페인관리</a></li>
					<li><a href="admin_campaign.php" style="color:#FFFFFF;">캠페인등록</a></li>
					<li><a href="admin_member.php" style="color:#FFFFFF;">회원관리</a></li>
					<li><a href="admin_email_QnA.php" style="color:#FFFFFF;">이메일문의리스트</a></li>
					<li><a href="admin_delete_member.php" style="color:#FFFFFF;">탈퇴회원리스트</a></li>
					<li><a href="logout.php" style="color:#FFFFFF;">로그아웃</a></li>
				<? } else if ($_SESSION['user_id'] == null) { ?>
					<li><a href="campaign.php" style="color:#FFFFFF;">그린캔디 캠페인</a></li>
					<li><a href="#" style="color:#FFFFFF;" data-toggle="modal" data-target="#searchModal" aria-expanded="false" aria-controls="searchModal">캠페인찾기</a></li>
					<li><a href="join.php" style="color:#FFFFFF;">회원가입</a></li>
					<li><a href="login.php" style="color:#FFFFFF;">로그인</a></li>
				<? } else { ?>
					<li><a href="campaign.php" style="color:#FFFFFF;">그린캔디 캠페인</a></li>
					<li><a href="#" style="color:#FFFFFF;" data-toggle="modal" data-target="#searchModal" aria-expanded="false"		aria-controls="searchModal">캠페인찾기</a></li>
					<li><a href="mypage.php" style="color:#FFFFFF;">My Page</a></li>
					<li><a href="logout.php" style="color:#FFFFFF;">로그아웃</a></li>
				<? } ?>

			</ul>
		</div><!--/.nav-collapse -->
	</div>
</nav>