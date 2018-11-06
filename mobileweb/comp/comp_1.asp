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
        <div id="mcontainer">

 


	<td width="360" valign="top"><table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
				<td style="padding-top:40px;"><img src="/image/sub01_subtitle07.jpg" width="360"  /></td>
			</tr>
			<tr>
			
				<td style="padding-bottom:50px;"><img src="/image/text_0088.jpg" width="360" />
				<table width="360" border="0" cellspacing="0" cellpadding="0">
				<tr>
			        <td width="60"><a href="./comp_1.asp"><img src="/comp/mapnavi/img/bt_0123_on.jpg" class="main_tab" style="cursor:pointer;" width="60" height="16" border="0" /></a></td>
			        <td width="60"><a href="./comp_2.asp"><img src="/comp/mapnavi/img/bt_0124_off.jpg" class="main_tab" style="cursor:pointer;" width="60" height="16" border="0" /></td>
			        <td width="60"><a href="./comp_3.asp"><img src="/comp/mapnavi/img/bt_0125_off.jpg" class="main_tab" style="cursor:pointer;" width="60" height="16" border="0" /></td>
			        <td width="60"><a href="./comp_4.asp"><img src="/comp/mapnavi/img/bt_0126_off.jpg" class="main_tab" style="cursor:pointer;" width="60" height="16" border="0" /></td>
			        <td width="60"><a href="./comp_5.asp"><img src="/comp/mapnavi/img/bt_0127_off.jpg" class="main_tab" style="cursor:pointer;"width="60" height="16" border="0" /></td>
			        <td width="60"><a href="./comp_6.asp"><img src="/comp/mapnavi/img/bt_0128_off.jpg" class="main_tab" style="cursor:pointer;" width="60" height="16" border="0" /></td>
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
								<td width="360"><span style="margin-left:1px;">서울 북부 지역(도봉, 강북, 노원, 성북)</span></td> <td width="90"> <span style="margin-left:2px;cursor:pointer;" class="detail"> 자세히보기 </span>
								<span style="margin-left:2px; display:none;cursor:pointer;" class="closed"> 자세히보기닫기 </span></td> 
						</tr>
					  </table>
					  <div>
						<table align="center" class="tb_style01">
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td>주소</td> 
								<td width="210">서울특별시 강남구 역삼동 736-38<br/> 혜림빌딩 3층 마더앤베이비</td>
								<td align="right" colspan="2"><a href="https://www.facebook.com/mothernbabycare" target="_blank">
														<img src="/comp/mapnavi/img/social_link_facebook.png"/></a></td>
								<td align="center"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_twitter.png"/></a></td>
								<td align="left"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_kakao.png"/></a></td>  
						   </tr>
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td width="50">전화<br/>번호</td>
								<td>02-557-3579&nbsp;&nbsp;<span style="background-image: url(/comp/mapnavi/img/iphoneappph2.PNG);width:15px;height:15px;"><a href="tel:02-557-3579">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
								<td><span style="margin-left:-50px;">상담시간</span>
								</td> 
								<td colspan="3">AM 09:00<br/>~PM 06:00</td> 
						   </tr>
						 </table>
					  </div>
				  <div class="box_011" style="display:none">
					  <div style="padding-left:20px;width:335px;border:1px solid #D1D1D1;height:180px;overflow-x:hidden;overflow-y:auto;scrollbar-face-color:#FFFFFF;scrollbar-highlight-color: #FFFFFF;scrollbar-3dlight-color: #E3E3E3;scrollbar-shadow-color: #FFFFFF;scrollbar-darkshadow-color: #E3E3E3;scrollbar-track-color: #E3E3E3;scrollbar-arrow-color: #B7B7B7;"><img src="/comp/mapnavi/img/seoul_bukbu.jpg"></img>
					  </div>
					 </div>


					 <!--box_02 -->
				 <table align="center" class="tb_style02">
						<tr style="width:150px;height:30px; border:1px solid #d3d3d3; background:#f1f1f1;">
								<td width="360"><span style="margin-left:1px;">서울 서북부 지역(은평, 서대문, 마포, 종로)</span></td> <td width="90"> <span style="margin-left:2px;cursor:pointer;" class="detail_2"> 자세히보기 </span>
								<span style="margin-left:2px; display:none;cursor:pointer;" class="closed_2"> 자세히보기닫기 </span></td> 
						</tr>
					  </table>
					  <div>
						<table align="center" class="tb_style01">
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td>주소</td> 
								<td width="210">서울특별시 강남구 역삼동 736-38<br/> 혜림빌딩 3층 마더앤베이비</td>
								<td align="right" colspan="2"><a href="https://www.facebook.com/mothernbabycare" target="_blank">
														<img src="/comp/mapnavi/img/social_link_facebook.png"/></a></td>
								<td align="center"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_twitter.png"/></a></td>
								<td align="left"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_kakao.png"/></a></td>  
						   </tr>
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td width="50">전화<br/>번호</td>
								<td>02-557-3579&nbsp;&nbsp;<span style="background-image: url(/comp/mapnavi/img/iphoneappph2.PNG);width:15px;height:15px;"><a href="tel:02-557-3579">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
								<td><span style="margin-left:-50px;">상담시간</span>
								</td> 
								<td colspan="3">AM 09:00<br/>~PM 06:00</td> 
						   </tr>
						 </table>
					  </div>
				  <div class="box_012" style="display:none">
				  
					  <div style="padding-left:20px;width:335px;border:1px solid #D1D1D1;height:180px;overflow-x:hidden;overflow-y:auto;scrollbar-face-color:#FFFFFF;scrollbar-highlight-color: #FFFFFF;scrollbar-3dlight-color: #E3E3E3;scrollbar-shadow-color: #FFFFFF;scrollbar-darkshadow-color: #E3E3E3;scrollbar-track-color: #E3E3E3;scrollbar-arrow-color: #B7B7B7;"><img src="/comp/mapnavi/img/seoul_seobukbu.jpg"></img>
					  </div>
					 </div>




					 
					 <!--box_03 -->
				 <table align="center" class="tb_style03">
						<tr style="width:150px;height:30px; border:1px solid #d3d3d3; background:#f1f1f1;">
								<td width="360"><span style="margin-left:1px;">서울 중부 지역(용산, 중구, 성동, 광진, 동대문, 중랑)</span></td> <td width="90"> <span style="margin-left:2px;cursor:pointer;" class="detail_3"> 자세히보기 </span>
								<span style="margin-left:2px; display:none;cursor:pointer;" class="closed_3"> 자세히보기닫기 </span></td> 
						</tr>
					  </table>
					  <div>
						<table align="center" class="tb_style01">
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td>주소</td> 
								<td width="210">서울특별시 강남구 역삼동 736-38<br/> 혜림빌딩 3층 마더앤베이비</td>
								<td align="right"  colspan="2"><a href="https://www.facebook.com/mothernbabycare" target="_blank">
														<img src="/comp/mapnavi/img/social_link_facebook.png"/></a></td>
								<td align="center"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_twitter.png"/></a></td>
								<td align="left"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_kakao.png"/></a></td>  
						   </tr>
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td width="50">전화<br/>번호</td>
								<td>02-557-3579&nbsp;&nbsp;<span style="background-image: url(/comp/mapnavi/img/iphoneappph2.PNG);width:15px;height:15px;"><a href="tel:02-557-3579">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
								<td><span style="margin-left:-50px;">상담시간</span>
								</td> 
								<td colspan="3">AM 09:00<br/>~PM 06:00</td>
						   </tr>
						 </table>
					  </div>
				  <div class="box_013" style="display:none">
				  
					  <div style="padding-left:20px;width:335px;border:1px solid #D1D1D1;height:180px;overflow-x:hidden;overflow-y:auto;scrollbar-face-color:#FFFFFF;scrollbar-highlight-color: #FFFFFF;scrollbar-3dlight-color: #E3E3E3;scrollbar-shadow-color: #FFFFFF;scrollbar-darkshadow-color: #E3E3E3;scrollbar-track-color: #E3E3E3;scrollbar-arrow-color: #B7B7B7;"><img src="/comp/mapnavi/img/seoul_joongbu.jpg"></img>
					  </div>
					 </div>



					  <!--box_04 -->
				 <table align="center" class="tb_style01">
						<tr style="width:150px;height:30px; border:1px solid #d3d3d3; background:#f1f1f1;">
								<td width="360"><span style="margin-left:1px;">서울 강서지사(강서)</span></td> <td width="90"> <span style="margin-left:2px;cursor:pointer;" class="detail_4"> 자세히보기 </span>
								<span style="margin-left:2px; display:none;cursor:pointer;" class="closed_4"> 자세히보기닫기 </span></td> 
						</tr>
					  </table>
					  <div>
						<table align="center" class="tb_style01">
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td>주소</td> 
								<td width="210">서울특별시 양천구 신정동 883 심미에셈빌 206호</td>
								<td align="right"  colspan="2"><a href="https://www.facebook.com/mothernbabycare" target="_blank">
														<img src="/comp/mapnavi/img/social_link_facebook.png"/></a></td>
								<td align="center"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_twitter.png"/></a></td>
								<td align="left"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_kakao.png"/></a></td>  
						   </tr>
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td width="50">전화<br/>번호</td>
								<td>02-6203-3578&nbsp;&nbsp;<span style="background-image: url(/comp/mapnavi/img/iphoneappph2.PNG);width:15px;height:15px;"><a href="tel:02-6203-3578">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
								<td><span style="margin-left:-50px;">상담시간</span>
								</td> 
								<td colspan="3">AM 09:00<br/>~PM 06:00</td>
 
						   </tr>
						 </table>
					  </div>
				  <div class="box_014" style="display:none">
				  
					  <div style="padding-left:20px;width:335px;border:1px solid #D1D1D1;height:210px;overflow-x:hidden;overflow-y:auto;scrollbar-face-color:#FFFFFF;scrollbar-highlight-color: #FFFFFF;scrollbar-3dlight-color: #E3E3E3;scrollbar-shadow-color: #FFFFFF;scrollbar-darkshadow-color: #E3E3E3;scrollbar-track-color: #E3E3E3;scrollbar-arrow-color: #B7B7B7;"><img src="/comp/mapnavi/img/seoul_kangseo.jpg"></img>
					  </div>
					 </div>



					  <!--box_05 -->
				 <table align="center" class="tb_style01">
						<tr style="width:150px;height:30px; border:1px solid #d3d3d3; background:#f1f1f1;">
								<td width="360"><span style="margin-left:1px;">서울 양천지사(양천)</span></td> <td width="90"> <span style="margin-left:2px;cursor:pointer;" class="detail_5"> 자세히보기 </span>
								<span style="margin-left:2px; display:none;cursor:pointer;" class="closed_5"> 자세히보기닫기 </span></td> 
						</tr>
					  </table>
					  <div>
						<table align="center" class="tb_style01">
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td>주소</td> 
								<td width="210">서울특별시 양천구 신정동 883 심미에셈빌 206호</td>
								<td align="right"  colspan="2"> <a href="https://www.facebook.com/mothernbabycare" target="_blank">
														<img src="/comp/mapnavi/img/social_link_facebook.png"/></a></td>
								<td align="center"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_twitter.png"/></a></td>
								<td align="left"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_kakao.png"/></a></td>  
						   </tr>
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td width="50">전화<br/>번호</td>
								<td>02-6203-3578&nbsp;&nbsp;<span style="background-image: url(/comp/mapnavi/img/iphoneappph2.PNG);width:15px;height:15px;"><a href="tel:02-6203-3578">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
								<td><span style="margin-left:-50px;">상담시간</span>
								</td> 
								<td colspan="3">AM 09:00<br/>~PM 06:00</td>
						   </tr>
						 </table>
					  </div>
				  <div class="box_015" style="display:none">
				  
					  <div style="padding-left:20px;width:335px;border:1px solid #D1D1D1;height:210px;overflow-x:hidden;overflow-y:auto;scrollbar-face-color:#FFFFFF;scrollbar-highlight-color: #FFFFFF;scrollbar-3dlight-color: #E3E3E3;scrollbar-shadow-color: #FFFFFF;scrollbar-darkshadow-color: #E3E3E3;scrollbar-track-color: #E3E3E3;scrollbar-arrow-color: #B7B7B7;"><img src="/comp/mapnavi/img/seoul_kangseo.jpg"></img>
					  </div>
					 </div>

					 
					  <!--box_06 -->
				 <table align="center" class="tb_style01">
						<tr style="width:150px;height:30px; border:1px solid #d3d3d3; background:#f1f1f1;">
								<td width="360"><span style="margin-left:1px;">서울 영등포지역</span></td> <td width="90"> <span style="margin-left:2px;cursor:pointer;" class="detail_6"> 자세히보기 </span>
								<span style="margin-left:2px; display:none;cursor:pointer;" class="closed_6"> 자세히보기닫기 </span></td> 
						</tr>
					  </table>
					  <div>
						<table align="center" class="tb_style01">
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td>주소</td> 
								<td width="210">서울특별시 강남구 역삼동 736-38 혜림빌딩 3층 마더앤베이비</td>
								<td align="right"  colspan="2"><a href="https://www.facebook.com/mothernbabycare" target="_blank">
														<img src="/comp/mapnavi/img/social_link_facebook.png"/></a></td>
								<td align="center"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_twitter.png"/></a></td>
								<td align="left"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_kakao.png"/></a></td>  
						   </tr>
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td width="50">전화<br/>번호</td>
								<td>02-557-3579&nbsp;&nbsp;<span style="background-image: url(/comp/mapnavi/img/iphoneappph2.PNG);width:15px;height:15px;"><a href="tel:02-557-3579">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
								<td><span style="margin-left:-50px;">상담시간</span>
								</td> 
								<td colspan="3">AM 09:00<br/>~PM 06:00</td>
						   </tr>
						 </table>
					  </div>
				  <div class="box_016" style="display:none">
				  
					  <div style="padding-left:20px;width:335px;border:1px solid #D1D1D1;height:180px;overflow-x:hidden;overflow-y:auto;scrollbar-face-color:#FFFFFF;scrollbar-highlight-color: #FFFFFF;scrollbar-3dlight-color: #E3E3E3;scrollbar-shadow-color: #FFFFFF;scrollbar-darkshadow-color: #E3E3E3;scrollbar-track-color: #E3E3E3;scrollbar-arrow-color: #B7B7B7;"><img src="/comp/mapnavi/img/seoul_seobu.jpg"></img>
					  </div>
					 </div>


					 
					  <!--box_07 -->
				 <table align="center" class="tb_style01">
						<tr style="width:150px;height:30px; border:1px solid #d3d3d3; background:#f1f1f1;">
								<td width="360"><span style="margin-left:1px;">서울 구로지역</span></td> <td width="90"> <span style="margin-left:2px;cursor:pointer;" class="detail_7"> 자세히보기 </span>
								<span style="margin-left:2px; display:none;cursor:pointer;" class="closed_7"> 자세히보기닫기 </span></td> 
						</tr>
					  </table>
					  <div>
						<table align="center" class="tb_style01">
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td>주소</td> 
								<td width="210">서울특별시 강남구 역삼동 736-38 혜림빌딩 3층 마더앤베이비</td>
								<td align="right"  colspan="2"><a href="https://www.facebook.com/mothernbabycare" target="_blank">
														<img src="/comp/mapnavi/img/social_link_facebook.png"/></a></td>
								<td align="center"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_twitter.png"/></a></td>
								<td align="left"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_kakao.png"/></a></td>  
						   </tr>
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td width="50">전화<br/>번호</td>
								<td>02-557-3579&nbsp;&nbsp;<span style="background-image: url(/comp/mapnavi/img/iphoneappph2.PNG);width:15px;height:15px;"><a href="tel:02-557-3579">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
								<td><span style="margin-left:-50px;">상담시간</span>
								</td> 
								<td colspan="3">AM 09:00<br/>~PM 06:00</td>
						   </tr>
						 </table>
					  </div>
				  <div class="box_017" style="display:none">
				  
					  <div style="padding-left:20px;width:335px;border:1px solid #D1D1D1;height:180px;overflow-x:hidden;overflow-y:auto;scrollbar-face-color:#FFFFFF;scrollbar-highlight-color: #FFFFFF;scrollbar-3dlight-color: #E3E3E3;scrollbar-shadow-color: #FFFFFF;scrollbar-darkshadow-color: #E3E3E3;scrollbar-track-color: #E3E3E3;scrollbar-arrow-color: #B7B7B7;"><img src="/comp/mapnavi/img/seoul_seobu.jpg"></img>
					  </div>
					 </div>

					 
					  <!--box_08 -->
				 <table align="center" class="tb_style01">
						<tr style="width:150px;height:30px; border:1px solid #d3d3d3; background:#f1f1f1;">
								<td width="360"><span style="margin-left:1px;">서울 동작지사</span></td> <td width="90"> <span style="margin-left:2px;cursor:pointer;" class="detail_8"> 자세히보기 </span>
								<span style="margin-left:2px; display:none;cursor:pointer;" class="closed_8"> 자세히보기닫기 </span></td> 
						</tr>
					  </table>
					  <div>
						<table align="center" class="tb_style01">
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td>주소</td> 
								<td width="210">서울특별시 관악구 남현동 602-43 미래오피스텔 2층 202호</td>
								<td align="right"  colspan="2"><a href="https://www.facebook.com/mothernbabycare" target="_blank">
														<img src="/comp/mapnavi/img/social_link_facebook.png"/></a></td>
								<td align="center"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_twitter.png"/></a></td>
								<td align="left"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_kakao.png"/></a></td>  
						   </tr>
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td width="50">전화<br/>번호</td>
								<td>02-597-3579&nbsp;&nbsp;<span style="background-image: url(/comp/mapnavi/img/iphoneappph2.PNG);width:15px;height:15px;"><a href="tel:02-597-3579">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
								<td><span style="margin-left:-50px;">상담시간</span>
								</td> 
								<td colspan="3">AM 09:00<br/>~PM 06:00</td>
						   </tr>
						 </table>
					  </div>
				  <div class="box_018" style="display:none">
				  
					  <div style="padding-left:20px;width:335px;border:1px solid #D1D1D1;height:225px;overflow-x:hidden;overflow-y:auto;scrollbar-face-color:#FFFFFF;scrollbar-highlight-color: #FFFFFF;scrollbar-3dlight-color: #E3E3E3;scrollbar-shadow-color: #FFFFFF;scrollbar-darkshadow-color: #E3E3E3;scrollbar-track-color: #E3E3E3;scrollbar-arrow-color: #B7B7B7;"><img src="/comp/mapnavi/img/seoulGeumcheon.jpg"></img>
					  </div>
					 </div>


					 <!--box_09 -->
				 <table align="center" class="tb_style01">
						<tr style="width:150px;height:30px; border:1px solid #d3d3d3; background:#f1f1f1;">
								<td width="360"><span style="margin-left:1px;">서울 관악지사</span></td> <td width="90"> <span style="margin-left:2px;cursor:pointer;" class="detail_9"> 자세히보기 </span>
								<span style="margin-left:2px; display:none;cursor:pointer;" class="closed_9"> 자세히보기닫기 </span></td> 
						</tr>
					  </table>
					  <div>
						<table align="center" class="tb_style01">
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td>주소</td> 
								<td width="210">서울특별시 관악구 남현동 602-43 미래오피스텔 2층 202호</td>
								<td align="right"  colspan="2"><a href="https://www.facebook.com/mothernbabycare" target="_blank">
														<img src="/comp/mapnavi/img/social_link_facebook.png"/></a></td>
								<td align="center"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_twitter.png"/></a></td>
								<td align="left"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_kakao.png"/></a></td>  
						   </tr>
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td width="50">전화<br/>번호</td>
								<td>02-597-3579&nbsp;&nbsp;<span style="background-image: url(/comp/mapnavi/img/iphoneappph2.PNG);width:15px;height:15px;"><a href="tel:02-597-3579">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
								<td><span style="margin-left:-50px;">상담시간</span>
								</td> 
								<td colspan="3">AM 09:00<br/>~PM 06:00</td>
						   </tr>
						 </table>
					  </div>
				  <div class="box_019" style="display:none">
				  
					  <div style="padding-left:20px;width:335px;border:1px solid #D1D1D1;height:225px;overflow-x:hidden;overflow-y:auto;scrollbar-face-color:#FFFFFF;scrollbar-highlight-color: #FFFFFF;scrollbar-3dlight-color: #E3E3E3;scrollbar-shadow-color: #FFFFFF;scrollbar-darkshadow-color: #E3E3E3;scrollbar-track-color: #E3E3E3;scrollbar-arrow-color: #B7B7B7;"><img src="/comp/mapnavi/img/seoulGeumcheon.jpg"></img>
					  </div>
					 </div>

					 <!--box_10 -->
				 <table align="center" class="tb_style01">
						<tr style="width:150px;height:30px; border:1px solid #d3d3d3; background:#f1f1f1;">
								<td width="360"><span style="margin-left:1px;">서울 금천지사</span></td> <td width="90"> <span style="margin-left:2px;cursor:pointer;" class="detail_10"> 자세히보기 </span>
								<span style="margin-left:2px; display:none;cursor:pointer;" class="closed_10"> 자세히보기닫기 </span></td> 
						</tr>
					  </table>
					  <div>
						<table align="center" class="tb_style01">
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td>주소</td> 
								<td width="210">서울특별시 관악구 남현동 602-43 미래오피스텔 2층 202호</td>
								<td align="right"  colspan="2"><a href="https://www.facebook.com/mothernbabycare" target="_blank">
														<img src="/comp/mapnavi/img/social_link_facebook.png"/></a></td>
								<td align="center"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_twitter.png"/></a></td>
								<td align="left"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_kakao.png"/></a></td>  
						   </tr>
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td width="50">전화<br/>번호</td>
								<td>02-597-3579&nbsp;&nbsp;<span style="background-image: url(/comp/mapnavi/img/iphoneappph2.PNG);width:15px;height:15px;"><a href="tel:02-597-3579">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
								<td><span style="margin-left:-50px;">상담시간</span>
								</td> 
								<td colspan="3">AM 09:00<br/>~PM 06:00</td> 
						   </tr>
						 </table>
					  </div>
				  <div class="box_020" style="display:none">
				  
					  <div style="padding-left:20px;width:335px;border:1px solid #D1D1D1;height:225px;overflow-x:hidden;overflow-y:auto;scrollbar-face-color:#FFFFFF;scrollbar-highlight-color: #FFFFFF;scrollbar-3dlight-color: #E3E3E3;scrollbar-shadow-color: #FFFFFF;scrollbar-darkshadow-color: #E3E3E3;scrollbar-track-color: #E3E3E3;scrollbar-arrow-color: #B7B7B7;"><img src="/comp/mapnavi/img/seoulGeumcheon.jpg"></img>
					  </div>
					 </div>



					  <!--box_07 -->
				 <table align="center" class="tb_style01">
						<tr style="width:150px;height:30px; border:1px solid #d3d3d3; background:#f1f1f1;">
								<td width="360"><span style="margin-left:1px;">서울 남부지역(서초, 강남, 송파, 강동)</span></td> <td width="90"> <span style="margin-left:2px;cursor:pointer;" class="detail_11"> 자세히보기 </span>
								<span style="margin-left:2px; display:none;cursor:pointer;" class="closed_11"> 자세히보기닫기 </span></td> 
						</tr>
					  </table>
					  <div>
						<table align="center" class="tb_style01">
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td>주소</td> 
								<td width="210">서울특별시 강남구 역삼동 736-38 혜림빌딩 3층 마더앤베이비</td>
								<td align="right"  colspan="2"><a href="https://www.facebook.com/mothernbabycare" target="_blank">
														<img src="/comp/mapnavi/img/social_link_facebook.png"/></a></td>
								<td align="center"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_twitter.png"/></a></td>
								<td align="left"><a href="#" target="_blank"><img src="/comp/mapnavi/img/social_link_kakao.png"/></a></td>  
						   </tr>
						   <tr style="width:150px;height:30px; border:1px solid #d3d3d3;">
								<td width="50">전화<br/>번호</td>
								<td>02-557-3579&nbsp;&nbsp;<span style="background-image: url(/comp/mapnavi/img/iphoneappph2.PNG);width:15px;height:15px;"><a href="tel:02-557-3579">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
								<td><span style="margin-left:-50px;">상담시간</span>
								</td> 
								<td colspan="3">AM 09:00<br/>~PM 06:00</td>
						   </tr>
						 </table>
					  </div>
				  <div class="box_021" style="display:none">
				  
					  <div style="padding-left:20px;width:335px;border:1px solid #D1D1D1;height:180px;overflow-x:hidden;overflow-y:auto;scrollbar-face-color:#FFFFFF;scrollbar-highlight-color: #FFFFFF;scrollbar-3dlight-color: #E3E3E3;scrollbar-shadow-color: #FFFFFF;scrollbar-darkshadow-color: #E3E3E3;scrollbar-track-color: #E3E3E3;scrollbar-arrow-color: #B7B7B7;"><img src="/comp/mapnavi/img/seoul_nambu.jpg"></img>
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
</map>
	</div> 
</body> 
<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
<script type="text/javascript" src="/mobileweb/common/js/frm_common.js"></script>
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSubmit = jQuery("#btnSubmit");

	btnSubmit.click(function(){
		if (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./comp_06_sql.asp"
	});
</script>
<script>
	$('document').ready(function(){
    $('.menu').fixedMenu();
    });
</script>
<script type="text/javascript">
	$(document).ready(function(){			   
		$(".ani-bg").animate({
			marginTop:"75px"       
		}, 0 );	
	});
</script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				// Define any icon actions before calling the toolbar
				$('.toolbar-icons a').on('click', function( event ) {
					event.preventDefault();
				});
				$('#normal-button-bottom').toolbar({content: '#user-options', position: 'bottom'});
			});
</script>
<script type="text/javascript">
<!--
//레이어1 팝업 열기
function div1_openLayer(IdName){
 var pop = document.getElementById(IdName);
 pop.style.display = "block";
}

//레이어1 팝업 닫기
function div1_closeLayer(IdName){
 var pop = document.getElementById(IdName);
 pop.style.display = "none";
}
//-->
</script>
                
 
<script type="text/javascript">
 
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
