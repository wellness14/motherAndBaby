<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"

%>

	<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td><img src="/mobileweb/html/images/text_0028.jpg" width="360"/></td>
	</tr>
	<tr>
		<td height="50" style="padding-top:20px; padding-left:20px;"><img src="/mobileweb/html/images/text_0029.jpg"  style="position:relative; top:1px; left:25px;"/></td>
	</tr>
	<tr>
		<td height="60" style="padding-left:10px;">
			<input type="text" name="SearchDong" id="SearchDong" class="textarea" size="30"/>&nbsp;
			<img src="/mobileweb/html/images/bt_0003.jpg" width="110" border="0" align="absmiddle" onclick="fncSearchPost();" style="position:relative; top:2px; left:115px;"/>
		</td>
	</tr>
	<tr>
		<td><img src="/mobileweb/html/images/img_0002.jpg" width="360" height="32" /></td>
	</tr>
    
	<tr>
		<td style="padding-left:20px;color:#666;font-size:11px;">선택을 위해 주소를 <span style="color:#E06A6A;text-decoration:underline;">클릭</span>하시기 바랍니다.</td>
	</tr>
	<tr>
		<td height="50" style="padding-left:20px;">
		<div id="listpart" style="width:330px;border:1px solid #D1D1D1;height:180px;overflow-x:hidden;overflow-y:auto;scrollbar-face-color:#FFFFFF;scrollbar-highlight-color: #FFFFFF;scrollbar-3dlight-color: #E3E3E3;scrollbar-shadow-color: #FFFFFF;scrollbar-darkshadow-color: #E3E3E3;scrollbar-track-color: #E3E3E3;scrollbar-arrow-color: #B7B7B7">
		</div>
		</td>
	</tr>
	<tr>
			<td><a onClick="div1_closeLayer('AreaZip')" class="close" id="pb02"><img src="/mobileweb/html/images/bt_close.jpg" width="110" border="0" align="center" style="cursor:pointer;"/></a></td>
	</tr>
	</table>

<script type="text/javascript" src="/mobileweb/common/js/ajax_common.js"></script>
<script type="text/javascript">
	function fncSearchPost(){
		var SearchDong = document.getElementById("SearchDong").value.replace(/\s/g, "");

		if(SearchDong==""){
			alert("검색하실 지역의 동 혹은 읍/면 이름을 입력해주세요.");
			document.getElementById("SearchDong").focus();
			return;
		}
		if(SearchDong.length<2){
			alert("두 글자 이상 입력해주세요.");
			document.getElementById("SearchDong").focus();
			return;
		}

        fncAxListHtml("/mobileweb/member/pop_zipcode_ax_answer.asp?SearchDong="+document.getElementById("SearchDong").value,"#listpart");
	
	}

	function fncInputAddr(postcd1,postcd2,postcd,addrnm){
		document.getElementById("post_1").value = postcd1; 
		document.getElementById("post_2").value = postcd2; 
		document.getElementById("addr_1").value = addrnm; 
		InputPostInfo(postcd1,postcd2,postcd,addrnm);
        document.getElementById('AreaZip').style.display = "none";
	}


</script>
