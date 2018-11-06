<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/etc/store_member/css/style_hong.css">
    <title>마더앤베이비모바일</title>




</head>



<body>
<div id="header">
	<div id="navi_tit_name"><span  class="position_navi">회원관리 > 업체회원 > 휴면 </span>
	</div>
		
	<hr class="tab_line">
	
	<div class="tit_name"> <SPAN>조리원 ASP </span></div>




 <div id="tab">
  <div class="menu">
		<span class="list">업체리스트</span>
  </div>
  <div class="menu"">
		<span class="list">신규등록</span>
  </div>
	
	
</div>


<div id="line_bar">
	<img src="/etc/store_member/img/line_b.png" style="" />
</div>

	
<div id="search">
	
	
		 <ul class="search_01">
			<li class="store_name">
				업체명
				<input type="text" size="20" value="업체명">
			</li>
			<li class="open_day">
				입점일<input type="radio" value="open" name="open_d">취소일<input type="radio" value="cencel" name="cencel_d">
				<input type="text" size="10" value="달력"> ~ <input type="text" size="10" value="달력">
			</li>
		</ul>
		<br/>
		<ul class="search_02">
			<li class="level">
				등급
				<select name="level" class="textarea" style="height:20px;" valid="E|A=등급을 선택해주세요.">
					<option value="">1</option>
				</select>
			</li>
			<li class="number">
				실수
				<select name="level" class="textarea" style="height:20px;" valid="E|A=호수를 선택해주세요.">
					<option value="">1</option>
				</select>
			</li>
			<li class="appraisal">
				고객평가
				<select name="level" class="textarea" style="height:20px;" valid="E|A=평가 해주세요.">
					<option value="">1</option>
				</select>
			</li>
		</ul> 
		
		<div class="search_bt">검색</div>


</div>

</div>




<div id= "store_member">






<table width="770"  align="center" border="1" cellspacing="2" cellpadding="1"id="content">

	<tr>
		<th class="content_tit">최초입점일</th>
		<th class="content_tit">업체명</th>
		<th class="content_tit">위치</th>
		<th class="content_tit">실수</th>
		<th class="content_tit">담당자</th>
		<th class="content_tit">등급</th>
		<th class="content_tit">입점사ID</th>
		<th class="content_tit">관리</th>
	</tr>

	<tr>
		<td class="content">YYYY.MM.DD</td>
		<td class="content">헤리티지</td>
		<td class="content">서울</td>
		<td class="content">30</td>
		<td class="content">홍길동</td>
		<td class="content">1급</td>
		<td class="content">heritage</td>
		<td class="content">관리</td>
	</tr>


</table>

			<div class="page_num">
				<ul><li><a href="#"><img src="/etc/image/page_left.png" style="width:8px;"/></a>
					<li> <a href="#">1</a> </li>
					<li> <a href="#">2</a> </li>
					<li> <a href="#">3</a> </li>
					<li> <a href="#">4</a> </li>
					<li> <a href="#">5</a> </li>
					<li> <a href="#">6</a> </li>
					<li> <a href="#">7</a> </li>
					<li> <a href="#">8</a> </li>
					<li> <a href="#">9</a> </li>
					<li><a href="#"><img src="/etc/image/page_right.png"style="width:8px;"/></a>
				</ul>
			</div>


</div>





</body>

</html>
