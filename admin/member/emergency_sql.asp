<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
 	idx = fncRequest("idx")  
 
	mode			= fncRequest("mode")	

If mode = "ins" Or mode = "upd" Then  

	mode		= fncRequest("mode")	
	reply_content	= Trim(fncRequest("reply_content"))		' 
	hp1			= Trim(fncRequest("hp1"))			' 
	hp2			= Trim(fncRequest("hp2"))			' 
	hp3			= Trim(fncRequest("hp3"))			' 
	radio4		= Trim(fncRequest("radio4"))		' �������̿�
	child_birth	= fncRequest("child_birth")				'  
	gender		= fncRequest("gender")				'  
	mem_nm		= fncRequest("mem_nm")				'  
	ch_type		= fncRequest("ch_type")				'  �и�Ÿ��
	gender		= fncRequest("gender")				'  ����
 
 End If 

 hp = hp1 & "-" & hp2 & "-" & hp3

 '	1 �и�������
	If child_birth <> "" Then 
		birth_j_arr=split(child_birth,"-") 
		birth_y = birth_j_arr(0)
		birth_m = birth_j_arr(1)
		birth_d = birth_j_arr(2)
		birth = birth_y &  birth_m  &  birth_d 
	End If 

'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	������ Ȯ��

	Select Case mode 
			Case "ins" :
 
				strSql = ""
				strSql = strSql & " INSERT INTO MO_EMERGENCY_SERVICE ( "
				strSql = strSql & "       MR_MEM_ID  "
				strSql = strSql & ",      MR_MEM_NM  "
			    strSql = strSql & ",      MR_HP   "
				strSql = strSql & ",      MR_CHILDBIRTH " 
		        strSql = strSql & ",      ME_TYPE " 
				strSql = strSql & ",      ME_CHILD_GENDER  " 
				strSql = strSql & ",      MR_CLINIC  " 
				strSql = strSql & ",      MR_CONTENT  "  
				strSql = strSql & " )  "
				strSql = strSql & " VALUES "
				strSql = strSql & "			(    "
				strSql = strSql & "	 		'"& mem_id &"' "
				strSql = strSql & "	,		'"& mem_nm &"'   "
				strSql = strSql & "	,		'"& hp &"' "
				strSql = strSql & "	,		'"& birth &"' "
				strSql = strSql & "	,		'"& ch_type &"'  "
				strSql = strSql & "	,		'"& gender &"'   "
				strSql = strSql & "	,		'"& radio3 &"'   "
				strSql = strSql & "	,		'"& contents &"'   "
				strSql = strSql & "	 		) ; "
	'			response.Write strSql
	'			response.End 

	Call DBExec(strSql, "main") : Call DBClose(DBCon)
	intMsg = 2
 
 
 
%>
 
<%
		Case "upd" : 

				strSql = ""	

				strSql = strSql & " UPDATE MO_EMERGENCY_SERVICE SET "
 
			    strSql = strSql & "       MR_HP			  ='"& hp &"' "
				strSql = strSql & ",      MR_CHILDBIRTH	  ='"& birth &"' "
		        strSql = strSql & ",      ME_TYPE		  ='"& ch_type &"' "
				strSql = strSql & ",      ME_CHILD_GENDER ='"& gender &"' " 
				strSql = strSql & ",      MR_CLINIC		  ='"& radio4 &"' " 
				strSql = strSql & ",      ME_REPLY_CONTENT	  ='"& reply_content &"' " 
			If reply_content <> "" Then 
				strSql = strSql & ",      ME_REPLY	  ='Y' " 
			End if
 
				strSql = strSql & "	WHERE EM_SEQ='"& idx &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3




			Case "delete" : 
				If idx > 0 Then 
					strSql = ""
					strSql = strSql & " UPDATE   MO_EMERGENCY_SERVICE SET "
					strSql = strSql & " MS_CNLKBN ='Y'	WHERE EM_SEQ='"& idx &"' "
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
				parent.location.href = "./emergency_list.asp"
			break;
			case(3) :
				alert('���� ��ϵǾ����ϴ�.');
				parent.location.href = "./emergency_list.asp"
			break;
			case(4) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "./emergency_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
