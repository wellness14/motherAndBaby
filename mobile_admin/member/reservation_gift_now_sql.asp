<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : ����Ȯ��
'�� �� �� : member_reser_sql.asp
'�ۼ����� : 2014/04/12
'�� �� �� : �̼���
'-----------------------------------------------------------------------
'��������   ������  ��������
'=======================================================================
'
'======================================================================= 
%>
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual="/admin/common/asp/mobile_checkUser.asp"-->
<%	
'-----------------------------------------------------------------------------
'	Request
now_seq = fncRequest("now_seq") 
pdt_seq = fncRequest("pdt_seq") 
mode			= fncRequest("mode")	
If mode = "ins" Or mode = "upd" Then 

 
	pdt_no		= Trim(fncRequest("pdt_no"))    
	in_y	= Trim(fncRequest("in_y"))    
	in_m	= Trim(fncRequest("in_m"))    
	in_d	= Trim(fncRequest("in_d"))    

	in_ea		= Trim(fncRequest("in_ea"))    

	If in_y <> "" And in_m <> "" And in_d <> "" then
		in_ymd = in_y & fncSetNumber(in_m) & fncSetNumber(in_d)
	End if
 

 End if
 
'-----------------------------------------------------------------------------


'-----------------------------------------------------------------------------
'	������ Ȯ��
	Select Case mode 
			Case "ins" :

 

	 
strSql = ""
strSql = strSql & " INSERT INTO MO_RESERVATION_GIFT_NOW_EA ( "
strSql = strSql & "       MD_GIFT_SEQ "
strSql = strSql & ",      MD_GIFT_NOW_EA_SEQ "
strSql = strSql & ",      MD_GIFT_IN_DATE "
strSql = strSql & ",      MD_GIFT_EA "


strSql = strSql & " )  "
strSql = strSql & " VALUES "
strSql = strSql & "			(  '"& pdt_no &"'   "
strSql = strSql & "	,(SELECT ISNULL(MAX([MD_GIFT_NOW_EA_SEQ] ),0)+1 from  [MO_RESERVATION_GIFT_NOW_EA] where [MD_GIFT_SEQ] = '"& pdt_no &"') "
strSql = strSql & "	,		'"& in_ymd &"'   "
strSql = strSql & "	,		'"& in_ea &"') ; "
'			response.Write strSql
'			response.End 

	Call DBExec(strSql, "main") : Call DBClose(DBCon)
	intMsg = 2
 
 
 
%>
 
<%
		Case "upd" : 

				strSql = ""

				strSql = strSql & " UPDATE MO_RESERVATION_GIFT_NOW_EA SET "
'				strSql = strSql & "		MD_GIFT_SEQ ='"& pdt_no &"' "
				strSql = strSql & "		 MD_GIFT_IN_DATE ='"& in_ymd &"' "
				strSql = strSql & "		,MD_GIFT_EA ='"& in_ea &"' "
			 
 
				strSql = strSql & "	WHERE MD_GIFT_NOW_EA_SEQ='"& now_seq &"'  "
				strSql = strSql & "	and MD_GIFT_SEQ='"& pdt_seq &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3




			Case "delete" : 
				If now_seq > 0 Then 
					strSql = ""
					strSql = strSql & " delete from MO_RESERVATION_GIFT_NOW_EA  "
					strSql = strSql & "	WHERE MD_GIFT_NOW_EA_SEQ='"& now_seq &"' "
					strSql = strSql & "	and MD_GIFT_SEQ='"& pdt_seq &"'; "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 4
				End If 
		
	End Select 
 
%>
<script type="text/javascript">
	function Init(e) {
		switch(e) {
			case(1) :
				alert('ȸ�������� Ȯ���� �ּ���');
				history.go(-1);
			break;
			case(2) :
				alert('���������� ��ϵǾ����ϴ�.');
				parent.location.href = "./reservation_gift_now_list.asp"
			break;
			case(3) :
				alert('���� ��ϵǾ����ϴ�.');
				parent.location.href = "./reservation_gift_now_list.asp"
			break;
			case(4) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "./reservation_gift_now_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
