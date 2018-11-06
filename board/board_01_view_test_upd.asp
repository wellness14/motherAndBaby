<!--#include virtual="/common/menu/head.asp"-->
<%
	intIDX	= fncRequest("idx")  '35
	intNum	= fncRequest("num")  '
	brd_id	= fncRequest("brd_id") 'EVENT 
	secFlg	= fncRequestForm("sec_flg")   ' Y
	comment_seq		= fncRequest("comment_Seq")
	pw		= fncRequest("pw")
%>
 
<%
'-----------------------------------------------------------------------------
'	데이터 확인
	brd_tbl = "dbo.MO_BRD_"& brd_id &" "
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	게시판 생성여부 확인
	strSql = "IF object_id(N'"& brd_tbl &"') IS NOT NULL SELECT 'Y' ELSE SELECT 'N' "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		If Rs(0) = "N" Then 
			response.Write "<script type='text/javascript'>alert('존재하지 않는 게시판 입니다.');history.back(-1);</script>"
			response.End 
		End If 
	End If 
	Call DBClose(Rs)
'-----------------------------------------------------------------------------

'--------------------------------------------------------------------------
'	공지사항 리스트 호출
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
'	비밀글 확인
	If sec_flg <> "N" And sec_flg <> secFlg Then 
		response.Write "<script type='text/javascript'>history.back(-1);</script>"
		response.End 
	End If 
'--------------------------------------------------------------------------

'--------------------------------------------------------------------------
'	답변 확인
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
	 
		strWhere = " WHERE BA_IDX = '"& intIDX &"' and  BA_SEQ='"& comment_seq  &"' ORDER BY BA_SEQ DESC  "

		strSql = ""
		strSql = strSql & "		SELECT "
		strSql = strSql & "			BA_SEQ "
		strSql = strSql & "			,BA_NAME "
		strSql = strSql & "			,BA_EMAIL "
		strSql = strSql & "			,BA_PW "
		strSql = strSql & "			,BA_COMMENT "

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
				<td width="56" height="34" bgcolor="#979797" class="white_text"><div align="center">번호</div></td>
				<% If brd_id = "NOTICE" Then %>
				<td width="69" bgcolor="#979797" class="white_text"><div align="center">분류</div></td>
				<% End If %>
				<td width="442" bgcolor="#979797" class="white_text"><div align="center">제목</div></td>
				<td width="103" bgcolor="#979797" class="white_text"><div align="center">작성자</div></td>
				<td width="88" bgcolor="#979797" class="white_text"><div align="center">작성일</div></td>
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
			<br/><br/><br/><br/><br/>
			<!--
			<p style="margin-top:10px;">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="bbs_view">
			<tr>
				<td valign="top"><%=content%></td>
			</tr>
			</table>
			<% If re_content <> "" Then %>
			<p style="margin-top:10px;">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="bbs_view">
			<tr>
				<td valign="top"><%=re_content%></td>
			</tr>
			</table>
			<% End If %>

			 -->

			<!--table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
			<td><iframe src="http://www.mothernbaby.co.kr/board/open_event_02.html" width="750" height="3430" frameborder="0"></iframe></td>
			</tr>
			</table-->
			

 

		 

			<form id="oFrm_2" name="oFrm_2" method="post">
			<INPUT TYPE="hidden" name="mode" value="upd"/>
			<INPUT TYPE="hidden" name="idx" value="<%=intIDX%>"/>
			<INPUT TYPE="hidden" name="comment_Seq" value="<%=comment_seq%>"/>
			<INPUT TYPE="hidden" name="ogn_pw" value="<%=pw%>"/>
			 
 
<%
			If IsArray(arrList) Then 
				For num=0 To UBound(arrList,2)	
					comment_Seq		= arrList(0,num)
					comment_name	= arrList(1,num)
					comment_email	= arrList(2,num)
				'	comment_pw		= arrList(3,num)
					comment_comment	= arrList(4,num)
 
%>
			
			
				<table width="650" border="0" align="center" cellpadding="0" cellspacing="10" style="margin:0 auto; width:740px;height:210px;background-color:#ebebeb; border-top:2px solid #ccc;">
					<tr>
						<td width="74">성명</td>
						<td width="546"><input type="text" name="mem_nm" class="textarea" size="35" value="<%=comment_name%>" valid="E|M=10|A=성명을 입력해 주세요"/></td>
					</tr>
					<tr> 
						<td>이메일</td>
						<td><input type="text" name="email" class="textarea" size="60" value="<%=comment_email%>" valid="E|M=50|A=이메일을 입력해 주세요"/></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pw" class="textarea" size="35" value="" /></td>
					</tr>
					<tr>
						<td>URL입력</td>
						<td><textarea name="content"class="textarea7" value="<%=comment_comment%>" valid="E|M=3000|A=내용을 입력해 주세요"><%=comment_comment%></textarea>&nbsp;&nbsp;&nbsp;<input type="button" value="수 정"   onClick="COMMENT2();" class="button"></td>
					</tr>
					 
				</table>
			
		 
						
						<!--input type="button" value="답 글" class="detail" id="com_num" onClick="">-->
		 
					
		 
			
<%
		Next 
	Else
%>
			<tr>
				<td colspan="10" style="text-align:center;margin-top:50px;">등록된 댓글이 없습니다.<br/><br/><br/></td>
			</tr>
			
			 	 
<%
	End If
%>
</form>
 
<!--
<%If comment_Seq <> "" then%>
	<div style="display:none;margin:0 auto; width:740px;background-color:#ebebeb; border-top:2px solid #ccc;" class="box_1" id="box_1">
				  
				<form id="oFrm_3" name="oFrm_3" method="post">
					<INPUT TYPE="hidden" name="mode" value="ins"/>
					<INPUT TYPE="hidden" name="idx" value="<%=intIDX%>"/>
					<INPUT TYPE="hidden" name="comment_Seq" value=""/>
					<INPUT TYPE="hidden" name="LEVEL" value="2"/>
						<table width="650" border="0" align="center" cellpadding="0" cellspacing="10">
							<tr>
								<td width="74">성명</td>
								<td width="546"><input type="text" name="mem_nm" id="mem_nm" class="textarea" size="35" valid="E|M=10|A=성명을 입력해 주세요"/></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" name="email" class="textarea" size="60" valid="E|M=50|A=이메일을 입력해 주세요"/></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type="password" name="pw" class="textarea" size="35" valid="E|N|M=10|T=비밀번호|A=비밀번호를 입력해 주세요"/></td>
							</tr>
							<tr>
								<td>URL입력</td>
								<td><textarea name="content"class="textarea7"  valid="E|M=3000|A=내용을 입력해 주세요"></textarea></td>
							</tr>
						</table>
				</form>
			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<input type="button" value="답글등록"  onClick="COMMENT_3();" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="취소" onClick="history.back(-1);" class="button">&nbsp;&nbsp;&nbsp;
					</td>
				</tr>  
			</table>
	</div>
	<% End if%>		-->
 
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>





 
<script type="text/javascript">
 
 /*
$(function() {

  $(".detail").click(function() {

  $(".box_1").css('display','block');
  $(".box_main").css('display','none');
  $(".closed").css('display','block');
   });
 
});
 */

	
	function COMMENT() {
		 if(confirm("댓글을 등록하시겠습니까?")) {
 

		var form = document.oFrm;
		 
 
		form.action = "comment_sql.asp";
		form.target = "_self";
		form.submit();

 
   }

}

	function COMMENT2() {
		 if(confirm("댓글을 수정하시겠습니까?")) {
 

		var form2 = document.oFrm_2;
		 
			 if(form2.mem_nm.value == ""){
				 alert("성함을 입력해주세요");
				 return false;
			 }
			 if(form2.email.value == ""){
				 alert("이메일을 입력해주세요");
				 return false;
			 }
			 if(form2.pw.value == ""){
				 alert("비밀번호를 입력해주세요");
				 return false;
			 }
			 if(form2.content.value == ""){
				 alert("내용을 입력해주세요");
				 return false;
			 }

			if (form2.pw.value != form2.ogn_pw.value){
				alert("비밀번호가 틀립니다.");
				 return false;
			}

 
		 
 

		form2.action = "comment_sql.asp?mOne=4&mTwo=5";
		form2.target = "_self";
		form2.submit();
 
   }

}

  

 


 

</script>
</html>
