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
        	<% 
                If menuCode2 = "A" Then 
				   bodyimg = "sub11.jpg" 
				   widthimg = "360px" 
				ElseIf menuCode2 = "B" Then 
				   bodyimg = "sub12.jpg" 
				   widthimg = "360px"
                ElseIf menuCode2 = "C" Then 
				   bodyimg = "sub13.jpg" 
				   widthimg = "360px"
                ElseIf menuCode2 = "D" Then 
				   bodyimg = "sub14.jpg" 
				   widthimg = "360px"
                ElseIf menuCode2 = "E" Then 
				   bodyimg = "sub15.jpg" 
				   widthimg = "360px"
                ElseIf menuCode2 = "F" Then 
				   bodyimg = "sub16.jpg" 
				   widthimg = "360px"
                ElseIf menuCode2 = "H" Then 
				   bodyimg = "sub18.jpg" 
				   widthimg = "360px"
                End If 
           %>
           
           	   <% If menuCode2 <> "H" Then %> 

		   <% Else %> 
			<ul>
			<table>
		<td width="360" valign="top"><table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
				<td style="padding-top:0px;"><img src="http://mothernbaby.co.kr/mobileweb/comp/map181.jpg" width="360" border="0" usemap="#map222" /></td>
			</tr>
                </td>
                </table>
                <map name="map222" id="map222">
          
                
        
         
                 
                <area shape="poly" coords="313,414,321,444,299,453,287,478,302,490,229,558,216,550,212,524,192,533,181,526,173,505,176,489,168,482,180,478,198,458,214,460,235,469,259,468,274,445,274,434,288,424" href="http://mothernbaby.co.kr/mobileweb/comp/mapnavi/seoulnambu.html">
                
<area shape="poly" coords="170,590,122,653,128,658,157,652,142,687,144,720,174,712,201,693,198,679,230,637,229,625,203,608,183,599" href="http://mothernbaby.co.kr/mobileweb/comp/mapnavi/kbu4.html">

        
<area shape="poly" coords="150,330,125,339,117,391,87,405,146,456,162,437,158,428,176,418,180,423,206,419,206,412,175,391,181,380,169,355,162,354,166,339" href="http://mothernbaby.co.kr/mobileweb/comp/mapnavi/seoulseobukbu.html">
          <area shape="poly" coords="200,292,198,305,181,327,173,354,183,378,181,390,207,408,243,384,243,376,265,370,269,356,268,344,258,332,263,322,259,300,242,289,231,298" href="http://mothernbaby.co.kr/mobileweb/comp/mapnavi/seoulbukbu.html">
          <!--서부지역-->
          <area shape="poly" coords="268,370,275,377,272,384,271,400,262,411,267,434,252,462,235,462,213,452,194,452,173,475,163,474,151,458,165,439,163,429,176,422,180,425,209,421,209,410,246,387,247,378" href="http://mothernbaby.co.kr/mobileweb/comp/mapnavi/seouljungbu.html">
          <!--서부지사-->
          <area shape="poly" coords="169,534,159,543,156,547,147,547,139,547,136,541,129,537,123,547,118,552,113,547,107,532,104,525,95,503,105,503,111,500,117,505,119,494,125,492,132,481,137,470,156,471,165,481,174,490,172,503,177,524" href="http://mothernbaby.co.kr/mobileweb/comp/mapnavi/seoulGeumcheon.html">
          <area shape="poly" coords="130,478,127,489,119,492,116,502,110,498,105,502,96,502,84,495,68,517,55,511,58,504,53,493,60,478,72,481,79,476,85,480,97,480,100,462,105,457,98,435,127,450,138,454,152,466,141,465,133,470" href="http://mothernbaby.co.kr/mobileweb/comp/mapnavi/seoulseobu.html">
          <area shape="poly" coords="43,383,94,433,97,438,89,444,80,457,63,442,56,443,40,445,26,437,22,427,36,407" href="http://mothernbaby.co.kr/mobileweb/comp/mapnavi/seoulkangseo.html">
          <area shape="poly" coords="58,446,57,472,71,477,80,475,89,478,94,477,97,463,101,458,97,444,81,460,66,451" href="http://mothernbaby.co.kr/mobileweb/comp/mapnavi/seoulyangcheon.html">
          <area shape="poly" coords="104,659,120,655,128,661,151,655,139,686,141,725,133,738,104,730,88,735,79,700,93,701,105,694" href="http://mothernbaby.co.kr/mobileweb/comp/mapnavi/ksu2.html">
           <!--수원지사-->
		   <area shape="poly" coords="147,799,152,806,161,811,169,808,174,795,166,788,158,786,147,798" href="http://mothernbaby.co.kr/mobileweb/comp/mapnavi/kyeonggi_suwon.html">
		  <area shape="poly" coords="121,744,129,747,130,760,183,761,192,770,183,782,210,783,210,798,217,796,235,824,228,834,206,828,189,837,180,835,189,819,162,809,144,800,108,789,122,765" href="http://mothernbaby.co.kr/mobileweb/comp/mapnavi/kyungkinambu.html">
          <area shape="poly" coords="218,1019,258,998,304,1019,313,1085,281,1110,228,1078,230,1050" href="http://mothernbaby.co.kr/mobileweb/comp/mapnavi/incheon.html">
          <area shape="poly" coords="145,1226,164,1216,182,1230,181,1258,172,1267,194,1293,180,1327,130,1348,136,1365,122,1371,124,1380,83,1426,50,1407,67,1341,77,1294,93,1282,121,1283,143,1246" href="http://mothernbaby.co.kr/mobileweb/comp/mapnavi/daejeonyusunggu.html">
          <area shape="poly" coords="178,1269,199,1290,196,1303,191,1324,178,1332,187,1353,196,1352,218,1340,235,1347,238,1340,222,1323,227,1305,247,1274,268,1259,249,1236,239,1237,236,1254,216,1262,206,1256,187,1255"href="http://mothernbaby.co.kr/mobileweb/comp/mapnavi/daejeondaeduk.html">
          <area shape="poly" coords="258,1278,245,1295,234,1306,227,1323,241,1337,238,1352,213,1349,195,1357,216,1382,227,1388,232,1401,211,1407,219,1447,217,1461,207,1464,206,1482,224,1490,259,1450,251,1432,265,1413,259,1401,292,1333,288,1319,315,1306,302,1286,285,1282,278,1300,264,1289" href="http://mothernbaby.co.kr/mobileweb/comp/mapnavi/daejeondonggu.html">
          <area shape="poly" coords="172,1333,181,1349,170,1372,150,1404,152,1417,144,1431,145,1469,123,1498,119,1486,103,1464,90,1464,75,1440,104,1425,121,1398,127,1387,129,1373,142,1367,142,1362,138,1353,154,1341" href="http://mothernbaby.co.kr/mobileweb/comp/mapnavi/daejeonsugu.html">
          <area shape="poly" coords="183,1355,161,1403,155,1407,160,1420,168,1424,173,1435,169,1440,174,1459,188,1477,200,1478,202,1460,211,1457,215,1448,205,1434,209,1425,205,1407,217,1400,224,1399,221,1390,213,1387,199,1367" href="http://mothernbaby.co.kr/mobileweb/comp/mapnavi/daejeonjunggu.html">
          <area shape="poly" coords="76,1712,78,1718,70,1719,61,1745,44,1752,53,1766,48,1775,57,1787,67,1787,72,1792,84,1788,79,1770,86,1773,95,1768,95,1755,118,1747,116,1743,161,1745,157,1722,140,1717,137,1704,139,1700,113,1693,108,1701,96,1704,91,1711" href="http://mothernbaby.co.kr/mobileweb/comp/mapnavi/kbgumi.html">
          <!--한눈에보는 지사안내-->
          <area shape="rect" coords="167,173,349,240" href="http://mothernbaby.co.kr/mobileweb/comp/comp_1.asp?menuCode1=20000&menuCode2=A">
          </map>        
			<% End If %> 
            
            
            
            
            
<% If menuCode2 <> "G" Then %>
			<ul>
				<li>
				<img src="/mobileweb/html/images/<%=bodyimg%>" width="<%=widthimg%>" border="0" >
				</li>
            </ul>
		   <% Else %> 
			<ul>
			<table width="350" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td><img src="/mobileweb/html/images/sub17.jpg" width="360" border="0" /></td>		
			</tr>
			<tr>
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="ins">
			<input type="hidden" name="menuCode1" value="20000">
			<input type="hidden" name="menuCode2" value="G">
				<td bgcolor="#f6f6f6" style="padding-bottom:20px; padding-top:20px;">
					<table width="360" border="0" align="center" cellpadding="0" cellspacing="10">
					<tr>
						<td width="61"><img src="/mobileweb/html/images/text_0001.jpg" width="61" /></td>
						<td width="288">
							<label>
								<input type="text" name="txtCop" class="textarea" size="28" valid="E|M=20|T=업체명|A=업체명을 입력해 주세요"/>
							</label>
						</td>
					</tr>
					<tr>
						<td><img src="/mobileweb/html/images/text_0002.jpg" width="61" /></td>
						<td><label>
							<input type="text" name="txtNm" class="textarea" size="28" valid="E|M=10|T=담당자명|A=담당자명을 입력해 주세요"/>
						</label></td>
					</tr>
					<tr>
						<td><img src="/mobileweb/html/images/text_0003.jpg" width="61" /></td>
						<td><label>
							<select name="hp_1" class="textarea" style="height:35px;" valid="E|A=핸드폰번호를 선택해 주세요">
							<option value="">선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							</label>
							-
							<input type="text" name="hp_2" class="textarea" size="5" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>
							-
							<input type="text" name="hp_3" class="textarea" size="5" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>
						</td>
					</tr>
					<tr>
						<td><img src="/mobileweb/html/images/text_0004.jpg" width="61" /></td>
						<td><label>
							<textarea name="textarea" class="textarea10" valid="E|M=230|T=문의내용|A=문의내용을 입력해 주세요"></textarea>
						</label></td>
					</tr>
					</table>
				</td>	
			</form>
			</tr>
			<tr>
				<td style="padding-top:30px; padding-bottom:50px;">
					<div align="center" id="btn11">
						<div class="btn00"><img src="/mobileweb/html/images/bt_0001.jpg" width="110"  border="0" id="btnSubmit" style="cursor:pointer;"/></div>
						<div class="btn00"><img src="/mobileweb/html/images/bt_0002.jpg" width="110"  border="0" onClick="location.reload();" style="cursor:pointer;"/></div>
					</div>
				</td>	
			</tr> 
		</table>
			</ul>
			<% End If %> 
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        </div>
      <!--#include virtual="/mobileweb/common/menu/foot_menu.asp"-->
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
                
</html>