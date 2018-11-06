<!--#include virtual="/common/menu/head.asp"-->
<%
	  SearchDong = fncRequest("SearchDong")
	  mem_nm		= Trim(fncRequest("mem_nm"))
%>
<HEAD>
	<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<link rel="stylesheet" type="text/css" href="/admin/common/css/style.css">
	<link type="text/css" rel="stylesheet" href="/admin/common/css/mega_admin2.css" />
	<style type="text/css">
		body{margin:0;padding:0;font:12px/1.3 Dotum;color:#ccc;}
		div,select, span, table,button,form{margin:0;padding:0;}
		#container{width:100%;}
		#container .linmap{}
		#container .linemap a{font:12px/1.3 Dotum;color:#ccc;text-decoration:none;}
		#container select{font:12px/1.3 Dotum;}
		#container .selection{padding:11px 15px 11px 15px;border:2px solid #AABAE0;margin-top:20px;margin-bottom:20px;}
		#container .selection *{vertical-align:middle;}
		.footerBtns{position:relative;width:100%;text-align:center;margin-top:20px;}
		.footerBtns .btns{}
	</style>
</head>

<body>
	<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center"><strong><h2>회원검색</h2></strong></td>
	</tr>
 
	<tr>
		<td style="padding-left:20px;color:#666;font-size:11px;">찾으시는 회원정보를 <span style="color:#E06A6A;text-decoration:underline;">클릭</span>하시면 선택이 됩니다.</td>
	</tr>
		<table  class="tb_style02">
	<tr>
		<td width="75" align="center">이름</td>
		<td width="90" align="center">전화번호</td>
		<td width="95" align="center">생년월일</td>
	</tr>
 
</table>
	<tr>
		<td height="50" style="padding-left:20px;">
			<div style="padding-left:20px;width:480px;border:1px solid #D1D1D1;height:300px;overflow-x:hidden;overflow-y:auto;scrollbar-face-color:#FFFFFF;scrollbar-highlight-color: #FFFFFF;scrollbar-3dlight-color: #E3E3E3;scrollbar-shadow-color: #FFFFFF;scrollbar-darkshadow-color: #E3E3E3;scrollbar-track-color: #E3E3E3;scrollbar-arrow-color: #B7B7B7;">
	<!--

strSql = " SELECT MM_MEM_NM, MD_PHONE, MD_HP, SUBSTRING(MD_BIRTH, 0, 5) MD_BIRTH1, SUBSTRING(MD_BIRTH, 5, 2) MD_BIRTH2, SUBSTRING(MD_BIRTH, 7, 2) MD_BIRTH3, MD_POST, MD_ADDR1, MD_ADDR2, MD_MEM_ID  FROM MO_MEM_MAS WITH(NOLOCK)     INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON  MM_MEM_ID = MD_MEM_ID   WHERE  MM_MEM_NM   like '%"& mem_nm &"%'   order by MM_MEM_NM asc  "
			Set Rs = DBExec(strSql,"main")

	-->

	
	<%
			strSql = " SELECT MM_MEM_NM, MD_PHONE, MD_HP, MD_BIRTH, MD_POST, MD_ADDR1, MD_ADDR2, MD_MEM_ID  FROM MO_MEM_MAS WITH(NOLOCK)     INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON  MM_MEM_ID = MD_MEM_ID   WHERE  MM_MEM_NM   like '%"& mem_nm &"%'   order by MM_MEM_NM asc  "
			Set Rs = DBExec(strSql,"main")
			If Not Rs.EOF Then   
				Do Until RS.EOF

				mem_nm		= Rs(0)
				phone		= Rs(1)
				hp			= Rs(2)
				birth		= Rs(3)
				post		= Rs(4)
				addr_1		= Rs(5)
				addr_2		= Rs(6)
				user_id		= Rs(7)


			'	데이터 확인 
				If phone <> "" Then 
					arrPhone	= Split(phone,"-")
					phone_1		= arrPhone(0)
					phone_2		= arrPhone(1)
					phone_3		= arrPhone(2)
				End If  

			If hp <> "" Then 
				arrHp	= Split(hp,"-")
				hp_1	= arrHp(0)
				hp_2	= arrHp(1)
				hp_3	= arrHp(2)
			End If 

			If birth <> "" Then 
				birthY = Left(birth,4)
				Mbirth = Mid(birth,5,2)
				If Mbirth < 10 Then Mbirth = Right(Mbirth,1)
				Dbirth = Right(birth,2)
				If Dbirth < 10 Then Dbirth = Right(Dbirth,1)
			End If 

			If post <> "" Then 
				 post1 =  Left(post,3)
				 post2 =  Right(post,3)
			End If 


	%>
			<a href="#_blank" onclick="fncInputAddr('<%=mem_nm%>','<%=phone_1%>','<%=phone_2%>','<%=phone_3%>','<%=hp_1%>','<%=hp_2%>','<%=hp_3%>','<%=birthY%>','<%=Mbirth%>','<%=Dbirth%>','<%=post1%>','<%=post2%>','<%=Replace(addr_1, "'", "")%>','<%=Replace(addr_2, "'", "")%>','<%=user_id%>')" class="post_text">
			<div style="padding-left:25px;"><%=Rs(0)%>   <span style="padding-left:90px;"><%=Rs(2)%></span
			> <span style="padding-left:90px;"><%=Rs(3)%> </span
			></div> </a><br />
	<%
					Rs.movenext
				Loop 
			End If 
	 
	%>
			</div>
		</td>
	</tr>
	</table>
</body>
<script type="text/javascript">

	function fncInputAddr(mname, mphpone1, mphpone2, mphpone3, mhp1, mhp2, mhp3, mbirth1, mbirth2, mbirth3, mpost1, mpost2, maddr1, maddr2, mid){
		opener.InputPostInfo(mname, mphpone1, mphpone2, mphpone3, mhp1, mhp2, mhp3, mbirth1, mbirth2, mbirth3, mpost1, mpost2, maddr1, maddr2, mid);
		self.close();
	}
</script>
</html>
