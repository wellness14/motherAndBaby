<!--#include virtual="/common/menu/head.asp"-->
<%
	intIDX	= "36"'fncRequest("idx")  '35
	intNum	= ""'fncRequest("num")  '
	brd_id	= "EVENT"'fncRequest("brd_id") 'EVENT 
	secFlg	= "Y"'fncRequestForm("sec_flg")   ' Y
%>
 
<%
'-----------------------------------------------------------------------------
'	������ Ȯ��
	brd_tbl = "dbo.MO_BRD_"& brd_id &" "
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	�Խ��� �������� Ȯ��
	strSql = "IF object_id(N'"& brd_tbl &"') IS NOT NULL SELECT 'Y' ELSE SELECT 'N' "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		If Rs(0) = "N" Then 
			response.Write "<script type='text/javascript'>alert('�������� �ʴ� �Խ��� �Դϴ�.');history.back(-1);</script>"
			response.End 
		End If 
	End If 
	Call DBClose(Rs)
'-----------------------------------------------------------------------------

'--------------------------------------------------------------------------
'	�������� ����Ʈ ȣ��
	If intIDX <> "" Then 
		strSql = ""
		strSql = strSql & "		SELECT "
		strSql = strSql & "			BA_IDX "
		If brd_id = "NOTICE" Then 
		strSql = strSql & "			,BA_TYPE "
		End If 
		strSql = strSql & "			,BA_MEM_NM  "
		strSql = strSql & "			,BA_TITLE   "
		strSql = strSql & "			,BA_CONTENT   "
		strSql = strSql & "			,BA_SEC_FLG "
		strSql = strSql & "			,BA_REG_DT	"
		strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY BA_SEQ DESC, BA_IDX DESC) ROWNUM "
		strSql = strSql & "		FROM "& brd_tbl &" WITH(NOLOCK) "
		strSql = strSql & "		WHERE BA_CNLKBN='N' AND BA_IDX='"& intIDX &"' "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			If brd_id = "NOTICE" Then 
				ba_type		= Rs("BA_TYPE")
			End If 
			mem_nm		= Rs("BA_MEM_NM")
			title		= Rs("BA_TITLE")
			content		= Re_sqlFilter(Rs("BA_CONTENT"))
			sec_flg		= Rs("BA_SEC_FLG")
			reg_dt		= Left(Rs("BA_REG_DT"),10)
		End If 
		Call RSClose(Rs)
	Else
		response.Write "<script type='text/javascript'>history.back(-1);</script>"
		response.End 
	End If 
'--------------------------------------------------------------------------

'--------------------------------------------------------------------------
'	��б� Ȯ��
	If sec_flg <> "N" And sec_flg <> secFlg Then 
		response.Write "<script type='text/javascript'>history.back(-1);</script>"
		response.End 
	End If 
'--------------------------------------------------------------------------

'--------------------------------------------------------------------------
'	�亯 Ȯ��
	If intIDX <> "" Then 
		strSql = ""
		strSql = strSql & "		SELECT "
		strSql = strSql & "			BA_TITLE   "
		strSql = strSql & "			,BA_CONTENT   "
		strSql = strSql & "		FROM "& brd_tbl &" WITH(NOLOCK) "
		strSql = strSql & "		WHERE BA_CNLKBN='N' AND BA_DPH=2 AND BA_PIDX='"& intIDX &"' "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			re_title		= Rs("BA_TITLE")
			re_content		= Re_sqlFilter(Rs("BA_CONTENT"))
		End If 
		Call RSClose(Rs)
	End If 

 




'------------comment 
		Dim mode : mode = "ins"


		strTable = " FROM MO_BRD_EVENT_COMMENT WITH(NOLOCK) "
	 
		strWhere = " WHERE BA_IDX = '"& intIDX &"'  ORDER BY BA_SEQ DESC  "

		strSql = ""
		strSql = strSql & "		SELECT "
		strSql = strSql & "			BA_SEQ "
		strSql = strSql & "			,BA_NAME "
		strSql = strSql & "			,BA_EMAIL "
		strSql = strSql & "			,BA_PW "
		strSql = strSql & "			,BA_COMMENT "
		strSql = strSql & "			,BA_ENT_DT "

		strSql = strSql & "			   "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			mode	= "upd"
'			comment_Seq		= Rs(0)
'			comment_name	= Rs(1)
'			comment_email	= Rs(2)
'			comment_pw		= Rs(3)
'			comment_comment	= Rs(4)
 
			arrList = Rs.GetRows()
		End If 
		Call DBClose(Rs) : DBClose(Rs1)


 
  



'--------------------------------------------------------------------------
%>
<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
	<!--#include virtual="/common/menu/left.asp"-->
	
		<td width="850" valign="top">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-top:40px;"><img src="/image/sub04_subtitle0<%=mTwo%>.jpg" width="770" height="43" /></td>
			</tr>
			</table>
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-top:15px; padding-bottom:15px;"><div align="right"><a href="./board_0<%=mTwo%>.asp?<%=strParam%>"><img src="/image/bt_0006.jpg" width="123" height="36" border="0" /></a></div></td>
			</tr>
			</table>
				
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="2">
			<tr>
				<td width="56" height="34" bgcolor="#979797" class="white_text"><div align="center">��ȣ</div></td>
				<% If brd_id = "NOTICE" Then %>
				<td width="69" bgcolor="#979797" class="white_text"><div align="center">�з�</div></td>
				<% End If %>
				<td width="442" bgcolor="#979797" class="white_text"><div align="center">����</div></td>
				<td width="103" bgcolor="#979797" class="white_text"><div align="center">�ۼ���</div></td>
				<td width="88" bgcolor="#979797" class="white_text"><div align="center">�ۼ���</div></td>
			</tr>
			
			<tr>
				<td height="34" bgcolor="#ebebeb"><div align="center"><%=intNum%></div></td>
				<% If brd_id = "NOTICE" Then %>
				<td bgcolor="#ebebeb"><div align="center"><%=ba_type%></div></td>
				<% End If %>
				<td bgcolor="#ebebeb" style="padding-left:10px;"><%=title%></td>
				<td bgcolor="#ebebeb"><div align="center"><%=mem_nm%></div></td>
				<td bgcolor="#ebebeb"><div align="center"><%=reg_dt%></div></td>
			</tr>
			</table>
			
			<p style="margin-top:10px;">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="bbs_view">
			<tr>
				<td valign="top"><p align="center" style="text-align: center;">&nbsp;</p><p align="center" style="text-align: center;"><font color="#ef007c"><strong><font size="5"><span style="color: rgb(120, 32, 185);">�ȳ��ϼ���. ��������</span><span style="color: rgb(120, 32, 185);">^^</span></font></strong></font></p><p align="center" style="text-align: center;"><font color="#ef007c"><strong><font size="5"><span style="color: rgb(120, 32, 185);"></span></font></strong></font>&nbsp;</p><p align="center" style="text-align: center;"><font color="#ef007c"><strong><font size="5"><span style="color: rgb(120, 32, 185);">&#8203;�����غ��̺� ���� ����</span></font></strong></font></p><p align="center" style="text-align: center;"><font color="#ef007c"><font size="5"><span style="color: rgb(120, 32, 185);"><strong>����</strong><strong><font face="����ü">&#8226;</font></strong> <strong>����</strong><strong><font face="����ü">&#8226;</font></strong> <strong>��õ ����&nbsp; </strong></span></font></font></p><p align="center" style="text-align: center;"><font color="#ef007c"><strong><font size="5"><span style="color: rgb(120, 32, 185);">���� �̺�Ʈ�� �Ұ��ص帳�ϴ�.!!</span></font></strong></font><div class="autosourcing-stub-extra-saved"></div><p></p><p>&nbsp;</p><p>&nbsp;</p><p align="center" style="text-align: center;"><span>&#8203;</span></p><p align="center" style="text-align: center;"><span></span>&nbsp;</p><p align="center" style="text-align: center;"><span>&#8203;</span></p><p align="center" style="text-align: center;"><span><img title="20150826174629.jpg" src="http://mothernbaby.co.kr/upload_file/board/20150826/20150826174629.jpg"><br style="clear: both;"></span>&nbsp;</p><p align="center" style="text-align: center;">&nbsp;</p><p align="center" style="text-align: center;">&nbsp;</p><span style="color: rgb(120, 32, 185); font-family: ����ü,gulimche; font-size: 18pt;"><p align="center" style="text-align: center;"><strong>�����غ��̺� </strong><span style="color: rgb(120, 32, 185);"><strong>��������</strong></span></p><p align="center" style="text-align: center;"><font color="#ef007c"><font size="5"><span style="color: rgb(120, 32, 185);"><strong>����</strong><strong><font face="����ü">&#8226;</font></strong> <strong>����</strong><strong><font face="����ü">&#8226;</font></strong> <strong>��õ ����</strong></span></font></font></p><p align="center" style="text-align: center;"><font color="#ef007c"><font size="5"><span style="color: rgb(120, 32, 185);"><strong></strong></span></font></font>&nbsp;</p><p align="center" style="text-align: center;"><font color="#ef007c"><font size="5"><span style="color: rgb(120, 32, 185);">&nbsp;</span></font></font><strong>���� ��</strong><strong>��Ʈ��</strong></p></span><p align="center" style="text-align: center;"><span style="color: rgb(120, 32, 185); font-family: ����ü,gulimche; font-size: 18pt;"><strong>&nbsp;&nbsp;&nbsp; </strong></span><strong><span style="color: rgb(120, 32, 185); font-family: ����ü,gulimche; font-size: 18pt;">�����մϴ�.</span><span style="color: rgb(120, 32, 185); font-family: ����ü,gulimche; font-size: 18pt;">!!!.</span></strong></p><p align="center" style="text-align: center;"><strong><span style="color: rgb(120, 32, 185); font-family: ����ü,gulimche; font-size: 18pt;">&#8203;</span></strong></p><p align="center" style="text-align: center;"><strong><span style="color: rgb(120, 32, 185); font-family: ����ü,gulimche; font-size: 18pt;">������ �̺�Ʈ !!! </span></strong></p><p align="center" style="text-align: center;"><strong><span style="color: rgb(120, 32, 185); font-family: ����ü,gulimche; font-size: 18pt;">&#8203;</span></strong></p><p align="center" style="text-align: center;"><strong><span style="color: rgb(120, 32, 185); font-family: ����ü,gulimche; font-size: 18pt;">&#8203;</span></strong></p><span style="color: rgb(120, 32, 185); font-family: ����ü,gulimche; font-size: 18pt;"><p align="center" style="text-align: center;"><span style="color: rgb(120, 32, 185); font-family: ����ü,gulimche; font-size: 18pt;"><span style="color: rgb(239, 0, 124); font-family: ����ü,gulimche; font-size: 18pt;">�����غ��̺�&nbsp;��������, ����&#8226;����&#8226;��õ ���縦 ���� </span></span></p><p align="center" style="text-align: center;"><span style="color: rgb(120, 32, 185); font-family: ����ü,gulimche; font-size: 18pt;"><span style="color: rgb(239, 0, 124); font-family: ����ü,gulimche; font-size: 18pt;">���ĵ���� ������ �Ͻø� ��ǰ �����ñ���</span></span></p><p align="center" style="text-align: center;"><span style="color: rgb(120, 32, 185); font-family: ����ü,gulimche; font-size: 18pt;"><span style="color: rgb(239, 0, 124); font-family: ����ü,gulimche; font-size: 18pt;">&#8203;</span></span></p><p align="center" style="text-align: center;"><span style="color: rgb(120, 32, 185); font-family: ����ü,gulimche; font-size: 18pt;"><span style="color: rgb(239, 0, 124); font-family: ����ü,gulimche; font-size: 18pt;">������ ���ϼ��� ���ڳ� ���̺����</span></span></p><p align="center" style="text-align: center;"><span style="color: rgb(120, 32, 185); font-family: ����ü,gulimche; font-size: 18pt;"><span style="color: rgb(239, 0, 124); font-family: ����ü,gulimche; font-size: 18pt;">�԰� �ٸ��� ���ڳ� ���̵�� ����&#8203;�� �帳�ϴ�. </span></span></p><p align="center" style="text-align: center;"><span style="color: rgb(120, 32, 185); font-family: ����ü,gulimche; font-size: 18pt;"><span style="color: rgb(239, 0, 124); font-family: ����ü,gulimche; font-size: 18pt;">&#8203;</span></span></p><p align="center" style="text-align: center;"><span style="color: rgb(120, 32, 185); font-family: ����ü,gulimche; font-size: 18pt;"><span style="color: rgb(239, 0, 124); font-family: ����ü,gulimche; font-size: 18pt;">�����غ��̺� �������� (031-206-&#8203;3578)��</span></span></p><p align="center" style="text-align: center;"><span style="color: rgb(120, 32, 185); font-family: ����ü,gulimche; font-size: 18pt;"><span style="color: rgb(239, 0, 124); font-family: ����ü,gulimche; font-size: 18pt;">�����غ��̺� ����,����,��õ���� (02-597-3579)��</span></span></p><p align="center" style="text-align: center;"><span style="color: rgb(120, 32, 185); font-family: ����ü,gulimche; font-size: 18pt;"><span style="color: rgb(239, 0, 124); font-family: ����ü,gulimche; font-size: 18pt;">��ȭ�ϼż� �����û�� �Ϸ�Ǹ� ������ �Ϸ�˴ϴ�.</span></span></p><p align="center" style="text-align: center;"><span style="color: rgb(120, 32, 185); font-family: ����ü,gulimche; font-size: 18pt;"><span style="color: rgb(239, 0, 124); font-family: ����ü,gulimche; font-size: 18pt;">�������̴� ���ѷ��ּ��� !!! </span></span></p><p class="autosourcing-stub-extra">&nbsp;</p></span><p align="center" style="text-align: center;"><iframe src="http://www.mothernbaby.co.kr/board/open_event_01.html" width="755" height="2200" frameborder="0"></iframe>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p align="center" style="text-align: center;">&nbsp;</p><p align="center" style="text-align: center;">&nbsp;</p><p>&nbsp;</p><p align="center" style="text-align: center;"><span style="color: rgb(255, 255, 255); font-family: ����ü,gulimche; font-size: 24pt; background-color: rgb(0, 153, 153);"><span>&#8203;</span>����� �� ���� �Դϴ�.</span></p><p align="center" style="text-align: center;"><span style="color: rgb(239, 0, 124); font-family: ����ü,gulimche; font-size: 18pt;">&#8203;</span></p><p align="center" style="text-align: center;"><span style="color: rgb(239, 0, 124); font-family: ����ü,gulimche; font-size: 18pt;">�����غ��̺� ���ĵ����</span><div class="autosourcing-stub-extra-saved"></div><p></p><p>&nbsp;</p><p>&nbsp;</p></td>

			</tr>
			</table>
		<!--	<% If re_content <> "" Then %>
			<p style="margin-top:10px;">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="bbs_view">
			<tr>
				<td valign="top"><%=re_content%></td>
			</tr>
			</table>
			<% End If %>-->

			 
<!--
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
			<td><iframe src="http://www.mothernbaby.co.kr/board/open_event_02.html" width="750" height="3430" frameborder="0"></iframe></td>
			</tr>
			</table>-->
	 <!--		

<div class="box_main" id="box_main">

			<form id="oFrm" name="oFrm" method="post">
			<INPUT TYPE="hidden" name="mode" value="ins"/>
			<INPUT TYPE="hidden" name="idx" value="<%=intIDX%>"/>
			<INPUT TYPE="hidden" name="comment_Seq" value=""/>
			<INPUT TYPE="hidden" name="LEVEL" value="1"/>
				<table width="650" border="0" align="center" cellpadding="0" cellspacing="10" style="margin:0 auto; width:740px;height:210px;background-color:#ebebeb; border-top:2px solid #ccc;">
					<tr>
						<td width="74">����</td>
						<td width="546"><input type="text" name="mem_nm" class="textarea" size="35" valid="E|M=10|A=������ �Է��� �ּ���"/></td>
					</tr>
					<tr>
						<td>�̸���</td>
						<td><input type="text" name="email" class="textarea" size="60" valid="E|M=50|A=�̸����� �Է��� �ּ���"/></td>
					</tr>
					<tr>
						<td>��й�ȣ</td>
						<td><input type="password" name="pw" class="textarea" size="35" valid="E|N|M=10|T=��й�ȣ|A=��й�ȣ�� �Է��� �ּ���"/></td>
					</tr>
					<tr>
						<td>URL�Է�</td>
						<td><textarea name="content"class="textarea7"  valid="E|M=3000|A=������ �Է��� �ּ���"></textarea></td>
					</tr>
				</table>
			</form>
			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<input type="button" value="�� ��" onClick="COMMENT();" class="button">&nbsp;&nbsp;&nbsp;
					</td>
				</tr>  
			</table>

			<form id="oFrm_2" name="oFrm_2" method="post">
			 

<%
			If IsArray(arrList) Then 
				For num=0 To UBound(arrList,2)	
					comment_Seq		= arrList(0,num)
					comment_name	= arrList(1,num)
					comment_email	= arrList(2,num)
					comment_pw		= arrList(3,num)
					comment_comment	= arrList(4,num)
					comment_date	= arrList(5,num)
 
 
 
%>
			
			 
				<table width="650" border="0" align="center" cellpadding="0" cellspacing="10" style="margin:0 auto; width:740px;height:110px;background-color:#ebebeb; border-top:2px solid #ccc;">
					<tr>
						<td style="width:100px;">URL�Է�</td>
						<td style="width:600px;"><%=comment_name%>�Բ��� ���ϱ�<%=Left(comment_date,18)%><br/> <br/> <%=comment_comment%> </td>
						<td  style="width:40px;"><input type="button" value="�� ��"   onClick="COMMENT_upd('<%=comment_Seq%>','<%=intIDX%>','<%=comment_pw%>');"  class="button"></td>
					</tr>
				</table>
			
		 
			 
		 
					
		 
			
<%
		Next 
	Else
%>
			<tr>
				<td colspan="10" style="text-align:center;margin-top:50px;">��ϵ� ����� �����ϴ�.<br/><br/><br/></td>
			</tr>
			
			 	 
<%
	End If
%>

</form>
</div>
-->
<%If comment_Seq <> "" then%>
<!--
	<div style="display:none;margin:0 auto; width:740px;background-color:#ebebeb; border-top:2px solid #ccc;" class="box_1" id="box_1">
				  
				<form id="oFrm_3" name="oFrm_3" method="post">
					<INPUT TYPE="hidden" name="mode" value="ins"/>
					<INPUT TYPE="hidden" name="idx" value="<%=intIDX%>"/>
					<INPUT TYPE="hidden" name="comment_Seq" value=""/>
					<INPUT TYPE="hidden" name="LEVEL" value="2"/>
						<table width="650" border="0" align="center" cellpadding="0" cellspacing="10">
							<tr>
								<td width="74">����</td>
								<td width="546"><input type="text" name="mem_nm" id="mem_nm" class="textarea" size="35" valid="E|M=10|A=������ �Է��� �ּ���"/></td>
							</tr>
							<tr>
								<td>�̸���</td>
								<td><input type="text" name="email" class="textarea" size="60" valid="E|M=50|A=�̸����� �Է��� �ּ���"/></td>
							</tr>
							<tr>
								<td>��й�ȣ</td>
								<td><input type="password" name="pw" class="textarea" size="35" valid="E|N|M=10|T=��й�ȣ|A=��й�ȣ�� �Է��� �ּ���"/></td>
							</tr>
							<tr>
								<td>URL�Է�</td>
								<td><textarea name="content"class="textarea7"  valid="E|M=3000|A=������ �Է��� �ּ���"></textarea></td>
							</tr>
						</table>
				</form>
			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<input type="button" value="��۵��"  onClick="COMMENT_3();" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="���" onClick="location.href='/board/board_01_view_test.asp';" class="button">&nbsp;&nbsp;&nbsp;
					</td>
				</tr>  
			</table>
	</div>
	-->
	<% End if%>		
 
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>





 
<script type="text/javascript">
 
 
$(function() {

  $(".detail").click(function() {

  $(".box_1").css('display','block');
  $(".box_main").css('display','none');
  $(".closed").css('display','block');
   });
 
});
 

	
	function COMMENT() {
		 if(confirm("����� ����Ͻðڽ��ϱ�?")) {

			var form = document.oFrm;
		 
			 if(form.mem_nm.value == ""){
				 alert("������ �Է����ּ���");
				 return false;
			 }
			 if(form.email.value == ""){
				 alert("�̸����� �Է����ּ���");
				 return false;
			 }
			 if(form.pw.value == ""){
				 alert("��й�ȣ�� �Է����ּ���");
				 return false;
			 }
			 if(form.content.value == ""){
				 alert("������ �Է����ּ���");
				 return false;
			 }
 

	
 
		form.action = "comment_sql.asp";
		form.target = "_self";
		form.submit();

 
   }

}

	function COMMENT2(seq,idx,name,email,pw,cmt,mode) {
		 if(confirm("����� �����Ͻðڽ��ϱ�?")) {
 

		var form2 = document.oFrm_2;
		var m_seq = seq;
		var m_idx = idx;
		var m_name = name;
		var m_email = email;
		var m_pw = pw;
		var m_cmt = cmt;
		var m_mode = mode;
 
		
 

		form2.action = "comment_sql.asp?comment_Seq="+m_seq+"&idx="+m_idx+"&mem_nm="+m_name+"&email="+m_email+"&pw="+m_pw+"&content="+m_cmt+"&mode="+m_mode;
		//form2.action = "comment_sql.asp";
		form2.target = "_self";
		form2.submit();
 
   }

}

	function COMMENT_upd(seq,idx,pw) {
		  if(confirm("����ȭ������ ���ðڽ��ϱ�?")) {
 

		var form2 = document.oFrm_2;
		var m_seq = seq;
		var m_idx = idx;
		var m_pw = pw;
		
 

		form2.action = "board_01_view_test_upd.asp?mOne=4&mTwo=5&comment_Seq="+m_seq+"&idx="+m_idx+"&pw="+m_pw;
		form2.target = "_self";
		form2.submit();
		  }
   

}


	function COMMENT_add(seq,idx) {
		 
 

		var form3 = document.oFrm_2;
		var m_seq = seq;
		var m_idx = idx;
 
		
 

		form3.action = "board_01_view_test_add.asp?mOne=4&mTwo=5&comment_Seq="+m_seq+"&idx="+m_idx;
		form3.target = "_self";
		form3.submit();
 
   

}
  

 


 

</script>
</html>
