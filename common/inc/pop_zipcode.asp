<!--#include virtual="/common/menu/head.asp"-->
<%
	  SearchDong = fncRequest("SearchDong")
%>
<body>
	<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td><img src="/image/text_0028.jpg" /></td>
	</tr>
	<tr>
		<td height="50" style="padding-top:20px; padding-left:20px;"><img src="/image/text_0029.jpg" /></td>
	</tr>
	<tr>
		<td height="60" style="padding-left:20px;">
			<input type="text" name="SearchDong" id="SearchDong" value="<%=SearchDong%>" onkeydown="javascript:if(event.keyCode==13) fncSearchPost();" class="textarea" size="30"/>&nbsp;
			<img src="/image/bt_0003.jpg" border="0" align="absmiddle" onclick="fncSearchPost();" style="cursor:pointer;"/>
		</td>
	</tr>
	<tr>
		<td><img src="/image/img_0002.jpg" width="500" height="32" /></td>
	</tr>
	<tr>
		<td style="padding-left:20px;color:#666;font-size:11px;">������ ���� �ּҸ� <span style="color:#E06A6A;text-decoration:underline;">Ŭ��</span>�Ͻñ� �ٶ��ϴ�.</td>
	</tr>
	<tr>
		<td height="50" style="padding-left:20px;">
			<div style="width:420px;border:1px solid #D1D1D1;height:200px;overflow-x:hidden;overflow-y:auto;scrollbar-face-color:#FFFFFF;scrollbar-highlight-color: #FFFFFF;scrollbar-3dlight-color: #E3E3E3;scrollbar-shadow-color: #FFFFFF;scrollbar-darkshadow-color: #E3E3E3;scrollbar-track-color: #E3E3E3;scrollbar-arrow-color: #B7B7B7">
	<%
		If SearchDong <> "" Then
			strSql = "SELECT ZM_ZIP_CD, ZM_DO+' '+ZM_GU+' '+ZM_DON+' '+ZM_BUN ZM_ADDR,ZM_DO+' '+ZM_GU+' '+ZM_DON FROM MO_ZIP_MAS WITH(NOLOCK) WHERE ZM_DON LIKE '" & SearchDong &"%' ORDER BY ZM_ZIP_CD"
			Set Rs = DBExec(strSql,"main")
			If Not Rs.EOF Then   
				Do Until RS.EOF

	%>
			<a href="#_blank" onclick="fncInputAddr('<%=Left(Rs(0),3)%>','<%=Right(Rs(0),3)%>','<%=Rs(0)%>','<%=Rs(2)%>')" class="post_text"><%=RS(0)%>&nbsp;&nbsp;&nbsp;<%=Replace(Rs(1),SearchDong,"<strong>"&SearchDong&"</strong>")%></a><br />
	<%
					Rs.movenext
				Loop 
			End If 
		End If 
	%>
			</div>
		</td>
	</tr>
	</table>
</body>
<script type="text/javascript">
	function fncSearchPost(){
		var SearchDong = document.getElementById("SearchDong").value.replace(/\s/g, "");

		if(SearchDong==""){
			alert("�˻��Ͻ� ������ �� Ȥ�� ��/�� �̸��� �Է����ּ���.");
			document.getElementById("SearchDong").focus();
			return;
		}
		if(SearchDong.length<2){
			alert("�� ���� �̻� �Է����ּ���.");
			document.getElementById("SearchDong").focus();
			return;
		}

		location.href="pop_zipcode.asp?SearchDong="+SearchDong;
	}

	function fncInputAddr(postcd1,postcd2,postcd,addrnm){
		opener.InputPostInfo(postcd1,postcd2,postcd,addrnm);
		self.close();
	}
</script>
</html>
