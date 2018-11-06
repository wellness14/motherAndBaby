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
	<div id="navi_tit_name"><span  class="position_navi">회원관리 > 업체회원 > 입점사등급</span>
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






<table width="770"  align="center" border="1" cellspacing="2" cellpadding="1"id="content">

	<tr>
		<th  class="content_tit">등급명칭</th>
		<td colspan="4" class="content"><input type="text" size="20" value=" - "> </td>
		
	</tr>

	<tr>
		<th  class="content_tit">등급아이콘</th>
		
		<td class="content">-기본아이콘 (권장 15 x 16)</td>
		<td class="content" style="background-color: #daf3ff;"><span class="f_cie" >파일선택</span></td>
		<td class="content"><input type="text" size="20" value=" - "></td>
		<td class="content" style="background-color: #daf3ff;"><span class="f_save" >저장</td>
	</tr>

	<tr>
		<th rowspan="6" class="content_tit">산정기준</th>
		<td colspan="4" class="content_02" id="line_off">
		<input type="radio" value="auto" name="auto_care">
		자동관리 : 선택한 조건을 모두 만족할 때 등급변경</td>
	</tr>

	<tr>
		<td colspan="4" class="content_02"  id="line_off">
		<input type="checkbox">
		찜수
		<input type="text" size="20" value=" - " style="margin-left:70px;" >
		<span style="margin-left:7px;">개 이상
		</span>
		</td>
	</tr>

	<tr>
		<td colspan="4" class="content_02" id="line_off">
		<input type="checkbox">
		응답율
		<input type="text" size="20" value=" - "style="margin-left:58px;">
		<span style="margin-left:7px;">
		%이상
		</span>
		</td>
	</tr>

	<tr>
		<td colspan="4" class="content_02"  id="line_off">
		<input type="checkbox">고객평가점수<input type="text" size="20" value=" - "style="margin-left:28px;">
		<span style="margin-left:7px;">
		점 이상
		</span>
		</td>
	</tr>

	<tr>
		<td colspan="4" class="content_02"  id="line_off">
		<input type="checkbox">
		출액 (누적)
		<input type="text" size="20" value=" - "style="margin-left:37px;">
		<span style="margin-left:7px;">
		원 이상
		</span>
		</td>
	</tr>

	<tr>
		<td colspan="4" class="content_02">
		<input type="radio" value="auto" name="auto_care">
		수동관리 :  해당 등급에 속하거나 제외에 대한 결정을 모두 수동으로 함<br>
		※등급설정은 “3. 앱관리 > 프로모션 > 노출관리” 에서 할 수 있습니다.
		</td>
	</tr>


</table>

<div id="10_cencle" style="border:1px solid #ffffff;text-align:right; margin-top: 20px;margin-bottom: 20px;">
		<div class="10_cencle_bt" >
			<span   class="10_cencle_bt_01" style="border:1px solid #2fade7;background-color:#2fade7;color:#ffffff;padding: 3px 20px 3px 20px; margin-top:7px; margin-right:30px;" >취소</span>
			<span   class="10_cencle_bt_02" style="border:1px solid #2fade7;background-color:#2fade7;color:#ffffff;padding: 3px 20px 3px 20px; margin-top:7px; margin-right:10px;">저장</span>
		</div>
</div>

<table width="770"  align="center" border="1" cellspacing="2" cellpadding="1"id="member_content_02">
	


	<tr>
		<th class="content_tit">등급</th>
		<th class="content_tit">지정일</th>
		<th class="content_tit">관리</th>
			
	</tr>
	<tr>
		
		<td class="content"> 1등급</td>
		<td class="content"> yyyy.mm.dd</td>
		<td class="content"> <span class="setting" >관리</span></td>
	</tr>





</div>





</body>

</html>
