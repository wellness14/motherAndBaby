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
	<div id="navi_tit_name"><span  class="position_navi">회원관리 > 업체회원> 업체 리스트 </span>
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


</div>



<div id= "store_member">






<table width="770"  align="center" border="1" cellspacing="2" cellpadding="1"id="member_content_02">
	<tr>
		<td class="tit" colspan="4">
			기본정보
		</td>
	</tr>


	

	<tr>
		<th class="content_tit">구분</th>
			<td class="content"> 마더앤베이비 지점</td>
		<th class="content_tit">입점사명</th>
			<td class="content"> 헤리티지</td>
	</tr>

	<tr>
		<th class="content_tit">입점사 id</th>
			<td class="content"> Heritage</td>
		<th class="content_tit">등급</th>
			<td class="content"> <select name="level" class="textarea" style="height:20px;" valid="E|A=호수를 선택해주세요.">
					<option value="">1등급</option></td>
	</tr>


	<tr>
		<th class="content_tit">비밀번호 변경</th>
			<td colspan="1" class="content" style="border-right:1px solid #ffffff;"> 
				<input type="text" size="20" value="비밀번호 변경"><br><input type="text" size="20" value="비밀번호 확인" style="margin-top:8px;"></td> 
			<td colspan="3" class="content" style="font-size:11px; text-align:left;"> <span> * 10-20자, 영문 대소문자 또는 숫자, 특수문자 중 2가지 이상 조합<br> * 사용 가능 특수문자 : ! # $ % & ( ) * + - / : < = > ? @ [ ＼ ] ^ _ { | } ~</span>
				<input type="submit" value="정보보호 법률">
			</td>
		
	</tr>

	<tr>
		<th class="content_tit">홈페이지 주소</th>
			<td colspan="2" class="content" style="border-right:1px solid #ffffff;"> 
				<input type="text" size="50" value="PC홈페이지">
			</td> 
			<td colspan="2" class="content">
				<input type="text" size="50" value="모바일홈페이지">
			</td>
		
	</tr>


</table>







<table width="770"  align="center" border="1" cellspacing="2" cellpadding="1"id="member_content_02">
	<tr>
		<td class="tit" colspan="4" class="content">
			테마
		</td>
	</tr>


	<tr>
		<th class="content_tit">위치</th>
			<td class="content"> 서울시 강남구 삼성로 635</td>
		<th class="content_tit">케어 (총5개 에서 분배)</th>
			<td class="content"> 신생아케어★★★★☆<br>산모케어★☆☆☆☆</td>
	</tr>

	<tr>
		<th class="content_tit">시설</th>
			<td class="content"> <select name="level" class="textarea" style="height:20px;" valid="E|A=등급을 선택해주세요.">
					<option value="">1등급</option></td>
		<th class="content_tit">고객평점순위</th>
			<td class="content"> 5등 (고객평가 누적점수 기준)</td>
	</tr>

	<tr>
		<th class="content_tit">실수(룸)</th>
			<td class="content"> <select name="level" class="textarea" style="height:20px;" valid="E|A=호수를 선택해주세요.">
					<option value="">20</option></td>
		<th class="content_tit">2주간 커리큘럼</th>
			<td class="content"> <select name="level" class="textarea" style="height:20px;" valid="E|A=커리큘럼수를 선택해주세요.">
					<option value="">20</option><br>※2주를 기준으로 한 커리큘럼 수</td>
	</tr>

</table>


<table width="770"  align="center" border="1" cellspacing="2" cellpadding="1"id="member_content_02">
	<tr>
		<td class="tit" colspan="4">
			사업자정보
		</td>
	</tr>


	<tr>
		<th class="content_tit">상호</th>
			<td class="content"> <input type="text" size="20" value="헤리티지"></td>
		<th class="content_tit">사업자 등록번호</th>
			<td class="content"> <input type="text" size="7" value="헤리티지"><input type="text" size="7" value="헤리티지"style="margin-left:8px;"><input type="text" size="7" value="헤리티지"style="margin-left:8px;"></td>
	</tr>

	<tr>
		<th class="content_tit">대표자</th>
			<td class="content"> <input type="text" size="20" value="대표자성함"></td>
		<th class="content_tit">주민(법인)번호</th>
			<td class="content"> 개인<input type="radio" value="alone" name="individual">법인<input type="text" size="20" value="'-'없이주민번호를 입력해주세요."style="margin-left:8px;"></td>
	</tr>

	<tr>
		<th class="content_tit">업태/업종</th>
			<td class="content">  - </td>
		<th class="content_tit">사업자등록증사본</th>
			<td class="content"><input type="submit" value="등록하기"><input type="submit" value="사본보기"style="margin-left:8px;"></td>
	</tr>


	<tr>
		<th class="content_tit">사업장 주소</th>
			<td colspan="3" class="content"  style="text-align:left; "> 
				<input type="text" size="20" value="우편번호" style="margin-left:56px;"><span style="border:1px solid #2fade7;background-color:#2fade7;color:#ffffff; padding: 3px;margin-left:8px;">우편번호검색</span><br>
				지번<input type="text" size="79" value="지번"style="margin-left:32px; margin-top: 7px;"><br>
				도로명<input type="text" size="79" value="도로명"style="margin-left:20px; margin-top: 7px;"><br>
				공통상세<input type="text" size="79" value="공통상세"style="margin-left:8px; margin-top: 7px;">
			</td>
		
	</tr>

	<tr>
		<th class="content_tit">통신판매신고번호</th>
			<td class="content" > 
				<input type="text" size="20" value="123456789">
			</td> 
			<th class="content_tit">
				전화
			</th>
			<td class="content">
				<input type="text" size="20" value="전화">
			</td>
		
	</tr>

	<tr>
		<th class="content_tit">메일</th>
			<td class="content" > 
				<input type="text" size="20" value="m53161171@naver.com">
			</td> 
			<th class="content_tit">
				팩스
			</th>
			<td class="content">
				<input type="text" size="20" value="123456789">
			</td>
	</tr>


</table>


<table width="770"  align="center" border="1" cellspacing="2" cellpadding="1"id="member_content_02">
	<tr>
		<td class="tit" colspan="6" class="content">
			담당자
		</td>
	</tr>


	<tr>
		<th class="content_tit">홍보 담당자</th>
			<td class="content"> <input type="text" size="7" value="김수연"></td>
		<th class="content_tit">메일</th>
			<td class="content"> <input type="text" size="20" value="m53161171@naver.com"></td>
			<th class="content_tit" style="width:50px;">연락처</th>
			<td class="content"> <input type="text" size="20" value="010-7727-7590"></td>
	</tr>

	<tr>
		<th class="content_tit">정산 담당자</th>
			<td class="content"> <input type="text" size="7" value="김수연"></td>
		<th class="content_tit">메일</th>
			<td class="content"> <input type="text" size="20" value="m53161171@naver.com"></td>
			<th class="content_tit" style="width:50px;">연락처</th>
			<td class="content"> <input type="text" size="20" value="010-7727-7590"></td>
	</tr>

	<tr>
		<th class="content_tit" >운영 담당자</th>
			<td class="content"> <input type="text" size="7" value="김수연"></td>
		<th class="content_tit">메일</th>
			<td class="content"> <input type="text" size="20" value="m53161171@naver.com"></td>
			<th class="content_tit" style="width:50px;">연락처</th>
			<td class="content"> <input type="text" size="20" value="010-7727-7590"></td>
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
