<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"

Dim menuCode1, menuCode2 

menuCode1 = request("menuCode1") 
menuCode2 = request("menuCode2") 

If menuCode1 = "" Then menuCode1 = "20000" 
If menuCode2 = "" Then menuCode2 = "A"

%> 


<!DOCTYPE html>
<html>
<head>
	<!--#include virtual="/mobileweb/common/menu/top_head.asp"-->
	<meta name="format-detection" content="telephone=no" />
	<style>
	.tb_style01 {
    width: 360px;
    border-collapse: collapse;
    border-spacing: 0px;
    border-width: 2px 1px 1px; 
    border-style: solid;
    border-color: #7C9BD2 #D1D1D1 #D1D1D1;
    -moz-border-top-colors: none;
    -moz-border-right-colors: none;
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    border-image: none;
}

  .box_01{

    border:1px solid #d3d3d3; width:100px; height:51px;

  } 

  .box_02{

    border:5px solid #d3d3d3; width:250px; height:51px; background:#f1f1f1;

  }

	</style>
</head>
<body>
	<div id="wrap">
        <div id="msub_menu"> </div>    
		<div id="mheader">
         <!--#include virtual="/mobileweb/common/menu/top_all_menu.asp"-->	
        </div>
        <!----------------------------------------- 메뉴바시작 ----------------------------------------->
  		<div id="mnav" class="menu">
        <!--#include virtual="/mobileweb/common/menu/sub_menu.asp"-->	
    	</div>
        <!----------------------------------------- 본문 ----------------------------------------->

	<td width="360" valign="top"><table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
				<td style="padding-top:40px;"><img src="/image/sub01_subtitle07.jpg" width="360"  /></td>
			</tr>
			<tr>
			
				<td style="padding-bottom:50px;"><img src="/image/text_0088.jpg" width="360" />
				<table width="360" border="0" cellspacing="0" cellpadding="0">
				<tr>
			        <td width="60"><a href="./comp_1.asp"><img src="/comp/mapnavi/img/bt_0123_off.jpg" class="main_tab" style="cursor:pointer;" width="60" height="16" border="0" /></a></td>
			        <td width="60"><a href="./comp_2.asp"><img src="/comp/mapnavi/img/bt_0124_off.jpg" class="main_tab" style="cursor:pointer;" width="60" height="16" border="0" /></td>
			        <td width="60"><a href="./comp_3.asp"><img src="/comp/mapnavi/img/bt_0125_off.jpg" class="main_tab" style="cursor:pointer;" width="60" height="16" border="0" /></td>
			        <td width="60"><a href="./comp_4.asp"><img src="/comp/mapnavi/img/bt_0126_off.jpg" class="main_tab" style="cursor:pointer;" width="60" height="16" border="0" /></td>
			        <td width="60"><a href="./comp_5.asp"><img src="/comp/mapnavi/img/bt_0127_off.jpg" class="main_tab" style="cursor:pointer;"width="60" height="16" border="0" /></td>
			        <td width="60"><a href="./comp_6.asp"><img src="/comp/mapnavi/img/bt_0128_on.jpg" class="main_tab" style="cursor:pointer;" width="60" height="16" border="0" /></td>
		        </tr>
				<tr>
					<td colspan="6"><img src="/comp/mapnavi/img/img_0013.jpg" width="360" height="4" /></td>
				</tr>
				 </table>
				 <div class="all_view">
					<p style=" float:right;cursor:pointer;"> 전체펼치기
					</p>
				 </div>
				 <div class="all_view_close" style="display:none;cursor:pointer;">
					<p style=" float:right;" > 전체닫기
					</p>
				 </div>
				 <div id="simple_zisa">
<br/>
				 <!--box_01 -->
				 <table align="center" class="tb_style01">
						<tr style="width:150px;height:30px; border:1px solid #d3d3d3; background:#f1f1f1;">
								<td width="360"><span style="margin-left:1px;">아랍에미리트 해외 지사</span></td> <td width="90"> <span style="margin-left:2px;cursor:pointer;" class="detail"> 자세히보기 </span>
								<span style="margin-left:2px; display:none;cursor:pointer;" class="closed"> 자세히보기닫기 </span></td> 
						</tr>
					  </table>
					  <div>
						<table align="center" class="tb_style01">
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td>주소</td> 
								<td width="210">  아랍에미리트  </td>
								<td align="right" colspan="2"><a href="https://www.facebook.com/mothernbabycare" target="_blank">
														<img src="/comp/mapnavi/img/social_link_facebook.png"/></a></td>
								<td align="center"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_twitter.png"/></a></td>
								<td align="left"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_kakao.png"/></a></td>  
						   </tr>
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td width="50">전화<br/>번호</td>
								<td> 02-557-3579&nbsp;&nbsp;<span style="background-image: url(/comp/mapnavi/img/iphoneappph2.PNG);width:15px;height:15px;"><a href="tel: 02-557-3579">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
								<td><span style="margin-left:-50px;">상담시간</span>
								</td> 
								<td colspan="3">AM 09:00<br/>~PM 06:00</td>
						   </tr>
						 </table>
					  </div>
				  <div class="box_011" style="display:none">
				  
					  <div style="padding-left:20px;width:335px;border:1px solid #D1D1D1;height:180px;overflow-x:hidden;overflow-y:auto;scrollbar-face-color:#FFFFFF;scrollbar-highlight-color: #FFFFFF;scrollbar-3dlight-color: #E3E3E3;scrollbar-shadow-color: #FFFFFF;scrollbar-darkshadow-color: #E3E3E3;scrollbar-track-color: #E3E3E3;scrollbar-arrow-color: #B7B7B7;"><img src="/comp/mapnavi/img/arap_simple.jpg"></img>
					  </div>
					 </div>


					 <!--box_02 -->
				 <table align="center" class="tb_style02">
						<tr style="width:150px;height:30px; border:1px solid #d3d3d3; background:#f1f1f1;">
								<td width="360"><span style="margin-left:1px;">그외 해외 지사</span></td> <td width="90"> <span style="margin-left:2px;cursor:pointer;" class="detail_2"> 자세히보기 </span>
								<span style="margin-left:2px; display:none;cursor:pointer;" class="closed_2"> 자세히보기닫기 </span></td> 
						</tr>
					  </table>
					  <div>
						<table align="center" class="tb_style01">
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td>주소</td> 
								<td width="210"> 경북구미시 공단동 26번지 낙동상가 503호 </td>
								<td align="right" colspan="2"><a href="https://www.facebook.com/mothernbabycare" target="_blank">
														<img src="/comp/mapnavi/img/social_link_facebook.png"/></a></td>
								<td align="center"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_twitter.png"/></a></td>
								<td align="left"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_kakao.png"/></a></td>  
						   </tr>
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td width="50">전화<br/>번호</td>
								<td> 02-557-3579&nbsp;&nbsp;<span style="background-image: url(/comp/mapnavi/img/iphoneappph2.PNG);width:15px;height:15px;"><a href="tel: 02-557-3579">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
								<td><span style="margin-left:-50px;">상담시간</span>
								</td> 
								<td colspan="3">AM 09:00<br/>~PM 06:00</td>
						   </tr>
						 </table>
					  </div>
				  <div class="box_012" style="display:none">
				  
					  <div style="padding-left:20px;width:335px;border:1px solid #D1D1D1;height:180px;overflow-x:hidden;overflow-y:auto;scrollbar-face-color:#FFFFFF;scrollbar-highlight-color: #FFFFFF;scrollbar-3dlight-color: #E3E3E3;scrollbar-shadow-color: #FFFFFF;scrollbar-darkshadow-color: #E3E3E3;scrollbar-track-color: #E3E3E3;scrollbar-arrow-color: #B7B7B7;"><img src="/comp/mapnavi/img/other_country_simple.jpg"></img>
					  </div>
					 </div>




					 
					


			</td>	
		</tr>
                </td>
			</tr>
		</table></td>
	</tr>
	</table>
	<!--#include virtual="/mobileweb/common/menu/foot_menu.asp"-->

<map name="detail_Map"><area shape="rect" coords="1,652,210,731" href="http://www.mothernbaby.co.kr/comp/comp_07-2.asp?mOne=1&mTwo=7">
</map></body>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	var main_tab = jQuery('.main_tab');
	var Img = jQuery('#service_img');
	var icd = jQuery('#icord');
	
$(function() {

  $(".detail").click(function() {
  $(".box_011").css('display','block');
  $(".detail").css('display','none');
  $(".closed").css('display','block');
   });

  $(".closed").click(function() {
  $(".box_011").css('display','none');
  $(".detail").css('display','block');
  $(".closed").css('display','none');
   });



  $(".detail_2").click(function() {
  $(".box_012").css('display','block');
  $(".detail_2").css('display','none');
  $(".closed_2").css('display','block');
   });

  $(".closed_2").click(function() {
  $(".box_012").css('display','none');
  $(".detail_2").css('display','block');
  $(".closed_2").css('display','none');
   });



  $(".detail_3").click(function() {
  $(".box_013").css('display','block');
  $(".detail_3").css('display','none');
  $(".closed_3").css('display','block');
   });

  $(".closed_3").click(function() {
  $(".box_013").css('display','none');
  $(".detail_3").css('display','block');
  $(".closed_3").css('display','none');
   });


     $(".detail_4").click(function() {
  $(".box_014").css('display','block');
  $(".detail_4").css('display','none');
  $(".closed_4").css('display','block');
   });

  $(".closed_4").click(function() {
  $(".box_014").css('display','none');
  $(".detail_4").css('display','block');
  $(".closed_4").css('display','none');
   });


     $(".detail_5").click(function() {
  $(".box_015").css('display','block');
  $(".detail_5").css('display','none');
  $(".closed_5").css('display','block');
   });

  $(".closed_5").click(function() {
  $(".box_015").css('display','none');
  $(".detail_5").css('display','block');
  $(".closed_5").css('display','none');
   });

     $(".detail_6").click(function() {
  $(".box_016").css('display','block');
  $(".detail_6").css('display','none');
  $(".closed_6").css('display','block');
   });

  $(".closed_6").click(function() {
  $(".box_016").css('display','none');
  $(".detail_6").css('display','block');
  $(".closed_6").css('display','none');
   });

       $(".detail_7").click(function() {
  $(".box_017").css('display','block');
  $(".detail_7").css('display','none');
  $(".closed_7").css('display','block');
   });

  $(".closed_7").click(function() {
  $(".box_017").css('display','none');
  $(".detail_7").css('display','block');
  $(".closed_7").css('display','none');
   });

       $(".detail_8").click(function() {
  $(".box_018").css('display','block');
  $(".detail_8").css('display','none');
  $(".closed_8").css('display','block');
   });

  $(".closed_8").click(function() {
  $(".box_018").css('display','none');
  $(".detail_8").css('display','block');
  $(".closed_8").css('display','none');
   });
          $(".detail_9").click(function() {
  $(".box_019").css('display','block');
  $(".detail_9").css('display','none');
  $(".closed_9").css('display','block');
   });

  $(".closed_9").click(function() {
  $(".box_019").css('display','none');
  $(".detail_9").css('display','block');
  $(".closed_9").css('display','none');
   });
          $(".detail_10").click(function() {
  $(".box_020").css('display','block');
  $(".detail_10").css('display','none');
  $(".closed_10").css('display','block');
   });

  $(".closed_10").click(function() {
  $(".box_020").css('display','none');
  $(".detail_10").css('display','block');
  $(".closed_10").css('display','none');
   });
          $(".detail_11").click(function() {
  $(".box_021").css('display','block');
  $(".detail_11").css('display','none');
  $(".closed_11").css('display','block');
   });

  $(".closed_11").click(function() {
  $(".box_021").css('display','none');
  $(".detail_11").css('display','block');
  $(".closed_11").css('display','none');
   });


//전체 펼치기
    $(".all_view").click(function() {
  $(".box_011").css('display','block');
  $(".detail").css('display','none');
  $(".closed").css('display','block');

   $(".box_012").css('display','block');
  $(".detail_2").css('display','none');
  $(".closed_2").css('display','block');

   $(".box_013").css('display','block');
  $(".detail_3").css('display','none');
  $(".closed_3").css('display','block');

 $(".box_014").css('display','block');
  $(".detail_4").css('display','none');
  $(".closed_4").css('display','block');

 $(".box_015").css('display','block');
  $(".detail_5").css('display','none');
  $(".closed_5").css('display','block');

   $(".box_016").css('display','block');
  $(".detail_6").css('display','none');
  $(".closed_6").css('display','block');

  $(".box_017").css('display','block');
  $(".detail_7").css('display','none');
  $(".closed_7").css('display','block');

   $(".box_018").css('display','block');
  $(".detail_8").css('display','none');
  $(".closed_8").css('display','block');

 $(".box_019").css('display','block');
  $(".detail_9").css('display','none');
  $(".closed_9").css('display','block');

   $(".box_020").css('display','block');
  $(".detail_10").css('display','none');
  $(".closed_10").css('display','block');

  $(".box_021").css('display','block');
  $(".detail_11").css('display','none');
  $(".closed_11").css('display','block');


 $(".all_view").css('display','none');
 $(".all_view_close").css('display','block');
   });


    $(".all_view_close").click(function() {
  $(".box_011").css('display','none');
  $(".detail").css('display','block');
  $(".closed").css('display','none');

$(".box_012").css('display','none');
  $(".detail_2").css('display','block');
  $(".closed_2").css('display','none');

 
  $(".box_013").css('display','none');
  $(".detail_3").css('display','block');
  $(".closed_3").css('display','none');



  $(".box_014").css('display','none');
  $(".detail_4").css('display','block');
  $(".closed_4").css('display','none');

  $(".box_015").css('display','none');
  $(".detail_5").css('display','block');
  $(".closed_5").css('display','none');

  $(".box_016").css('display','none');
  $(".detail_6").css('display','block');
  $(".closed_6").css('display','none');


  $(".box_017").css('display','none');
  $(".detail_7").css('display','block');
  $(".closed_7").css('display','none');

   $(".box_018").css('display','none');
  $(".detail_8").css('display','block');
  $(".closed_8").css('display','none');

  $(".box_019").css('display','none');
  $(".detail_9").css('display','block');
  $(".closed_9").css('display','none');

  $(".box_020").css('display','none');
  $(".detail_10").css('display','block');
  $(".closed_10").css('display','none');


  $(".box_021").css('display','none');
  $(".detail_11").css('display','block');
  $(".closed_11").css('display','none');

 $(".all_view_close").css('display','none');
 $(".all_view").css('display','block');

   });


 

});
</script>
</html>
