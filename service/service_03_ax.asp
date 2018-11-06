<%
Response.AddHeader "Cache-Control", "no-cache"
Response.AddHeader "Expires", "0"
Response.AddHeader "Pragma", "no-cache"
Response.ContentType = "text/html; charset=euc-kr"
%>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
'-------------------------------------------------------------------------------
'	����� ����
	uId			= Trim(fncRequestCookie("uid"))				'ȸ��	���̵�
	usernm		= LCase(fncRequestCookie("uname"))			'ȸ��	����
	mem_type	= LCase(Trim(fncRequestcookie("mem_type")))	'ȸ��	����
'-------------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	Request
    mode		= fncRequest("mode")				'ó������(���/����)
	intIDX		= fncRequest("idx")

	If mode = "type1" Or mode = "type2" Or mode = "ins" Then 
		Ybirth			= fncRequest("Ybirth")				' �������
		Mbirth			= fncRequest("Mbirth")				' �������
		Dbirth			= fncRequest("Dbirth")				' �������
		
		childbirth_y	= fncRequest("childbirth_y")		' ��꿹����
		childbirth_m	= fncRequest("childbirth_m")		' ��꿹����
		childbirth_d	= fncRequest("childbirth_d")		' ��꿹����

		marry_y			= fncRequest("marry_y")				' ��ȥ�����
		marry_m			= fncRequest("marry_m")				' ��ȥ�����
		marry_d			= fncRequest("marry_d")				' ��ȥ�����

		radio1			= fncRequest("radio1")				' ������
		radio2			= fncRequest("radio2")				' ù���� ����
		radio3			= fncRequest("radio3")				' ������ �̿� ����
		radio4			= fncRequest("radio4")				' �и�����
		radio5			= fncRequest("radio5")				' ��������
	
		txt1			= fncRequest("txt1")				' �����ּ�
		txt2			= fncRequest("txt2")				' Ű
		txt3			= fncRequest("txt3")				' �ӽ���������	
		txt4			= fncRequest("txt4")				' ���������

		sel1			= fncRequest("sel1")				' ������
		sel2			= fncRequest("sel2")				' �ѹ����
		sel3			= fncRequest("sel3")				' ��������������
		sel4			= fncRequest("sel4")				' ���̾�Ʈ�Ĵܰ���
		sel5			= fncRequest("sel5")				' �����м����α׷�
		sel6			= fncRequest("sel6")				' �Ʊ���̼ҵ�

		service			= fncRequest("mo_idx")
		totalchange		= fncRequest("totlachange")
	End If 
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	������ Ȯ��
	If Ybirth <> "" And Mbirth <> "" And Dbirth <> "" Then 
	birth = Ybirth & fncSetNumber(Mbirth) & fncSetNumber(Dbirth)
	Dbirth = Ybirth &"-"& fncSetNumber(Mbirth) &"-"& fncSetNumber(Dbirth)
	End If 
	
	If childbirth_y <> "" And childbirth_m <> "" And childbirth_d <> "" Then 
	childbirth = childbirth_y & fncSetNumber(childbirth_m) & fncSetNumber(childbirth_d)
	End If 
	
	If marry_y <> "" And marry_m <> "" And marry_d <> "" Then 
	marry = marry_y & fncSetNumber(marry_m) & fncSetNumber(marry_d)
	End If 

	intType1 = DateDiff("d",marry_y,childbirth_y)
	If intType1 >= 2000 Then 
		intType1 = 1
	Else 
		intType1 = 2
	End If 

	intType6 = DateDiff("YYYY",Dbirth,Date()) + 1
	If intType6 >= 35 Then 
		intType6 = "�̻�"
	Else
		intType6 = "����"
	End If 

	If txt1 <= 20 Then 
		intChr = 4
	ElseIf txt1 >= 21 And txt1 <= 25 Then 
		intChr = 6
	ElseIf txt1 >= 26 And txt1 <= 30 Then 
		intChr = 8
	ElseIf txt1 >= 31 And txt1 <= 35 Then 
		intChr = 10
	ElseIf txt1 >= 36 And txt1 <= 40 Then 
		intChr = 12
	End If 

	If Int(txt4) > Int(txt3+intChr) Then 
		intType7 = "��ü��"
	Else 
		intType7 = "����"
	End If 


	strParam = "mOne=6"
	strParam = strParam & "&mTwo=8"
'-----------------------------------------------------------------------------	

'-------------------------------------------------------------------------------------------
'	������ Ȯ��
	If birth = "" Or marry = "" Or childbirth = "" Then 
		intMsg = 1
	ElseIf radio1 = "" Or radio2 = "" Or radio3 = "" Or radio4 = "" Or radio5 = "" Then 
		intMsg = 1
	Else 
		Select Case mode
			Case "type1" : 
				strSql = " SELECT MO_IDX,MO_SERVICE,MO_CHARGE FROM MO_SERVICE_INFO WITH(NOLOCK) "
				strSql = strSql & " WHERE MO_TYPE1='"& intType1 &"' "
				strSql = strSql & " AND MO_TYPE2='"& radio4 &"' "
				strSql = strSql & " AND MO_TYPE3='"& radio1 &"' "
				strSql = strSql & " AND MO_TYPE4='"& radio3 &"' "
				strSql = strSql & " AND MO_TYPE5='"& radio5 &"' "
				strSql = strSql & " AND MO_TYPE6='"& intType6 &"' "
				strSql = strSql & " AND MO_TYPE7='"& intType7 &"' "
				response.write strSql
'				response.End 
				Set	Rs = DBExec(strSql,"main")
				If Not Rs.EOF Then 
					mo_idx	= Rs(0)
					service = Replace(Rs(1),"||",",")
					charge	= FormatNumber(Rs(2),0)

					strSql = " SELECT MS_SERVICE_NM FROM MO_SERVICE_LINK A WITH(NOLOCK) "
					strSql = strSql & " 	INNER JOIN MO_SERVICE_NM B WITH(NOLOCK) ON A.MS_IDX = B.MS_IDX "
					strSql = strSql & " WHERE MO_IDX='"& mo_idx &"' "
					strSql = strSql & " ORDER BY A.MS_IDX ASC "
					Set Rs1 = DBExec(strSql,"main")
					If Not Rs1.EOF Then 
						Do Until Rs1.EOF
							If service_nm <> "" Then service_nm = service_nm & ","
							service_nm = service_nm & Rs1(0)
							Rs1.movenext
						Loop
					End If 
					Call RSClose(Rs1)
					strContent = " <td width='179' height='180' bgcolor='#f6f6f6'><div align='center'><img src='/image/img_0011.jpg' /></div></td>"
					strContent = strContent & " <td width='591' bgcolor='#f6f6f6' style='font-size:15px; color:#000000'>������ �ǰ��� ���������� �����غ��̺� �Բ��ϰڽ��ϴ�.<br />"
					strContent = strContent & " ���Բ��� <span style='color:#ff015a; font-weight:bold;'>"& service &"</span> ���α׷��� �����Ͻø�, <br />"
					strContent = strContent & " <span style='color:#ff015a; font-weight:bold;'>���񽺿���� "& charge &"��</span>�Դϴ�.<br /><br />"
					strContent = strContent & " ����, ��õ �ΰ����񽺷δ�,<br />"
					strContent = strContent & " <span style='color:#ff015a; font-weight:bold;'>"& service_nm &"</span>�� ���ص帳�ϴ�.</td> "
					strContent = strContent & " <input type='hidden' id='service' name='service' value='"& mo_idx &"'> "
					intMsg = 2
				End If 
				Call RSClose(Rs)
			Case "type2" : 
				strSql = " SELECT MO_CHARGE FROM MO_SERVICE_INFO WITH(NOLOCK) "
				strSql = strSql & " WHERE MO_TYPE1='"& intType1 &"' "
				strSql = strSql & " AND MO_TYPE2='"& radio4 &"' "
				strSql = strSql & " AND MO_TYPE3='"& radio1 &"' "
				strSql = strSql & " AND MO_TYPE4='"& radio3 &"' "
				strSql = strSql & " AND MO_TYPE5='"& radio5 &"' "
				strSql = strSql & " AND MO_TYPE6='"& intType6 &"' "
				strSql = strSql & " AND MO_TYPE7='"& intType7 &"' "
'				response.write strSql
'				response.End 
				Set	Rs = DBExec(strSql,"main")
				If Not Rs.EOF Then 
					charge	= Rs(0)

					If sel1 <> "" Then charge = charge + sel1 * 100000
					If sel2 = "Y" Then charge = charge + 200000
					If sel3 = "Y" Then charge = charge + 100000
					If sel4 = "Y" Then charge = charge + 50000
					If sel5 = "Y" Then charge = charge + 100000
					If sel6 = "Y" Then charge = charge + 80000
					
					strContent = " <td width='66' bgcolor='#f6f6f6'><img src='/image/img_0012.jpg' width='72' height='68' /></td>"
					strContent = strContent & " <td width='704' bgcolor='#f6f6f6' style='font-size:15px; color:#000000; font-weight:bold;'><div align='center'>������ ������������ �������� �������� "
					strContent = strContent & " 	<span style='color:#ff015a; font-weight:bold;'> "& FormatNumber(charge,0)&"��</span>�Դϴ�.</div>"
					strContent = strContent & " </td> "
					strContent = strContent & " <input type='hidden' id='total' name='total' value='"& charge &"'> "
					intMsg = 3
				End If 
				Call RSClose(Rs)
			Case "ins" : 
				If uId <> "" Then 
					strSql = ""
					strSql = strSql & " INSERT INTO MO_SERVICE ( "
					strSql = strSql & "		MS_MEM_ID,MS_MEM_NM,MS_BIRTH,MS_CHILDBIRTH,MS_MARRY, "
					strSql = strSql & "		MS_TYPE1,MS_TYPE2,MS_TYPE3,MS_TYPE4,MS_TYPE5, "
					strSql = strSql & "		MS_TXT1,MS_TXT2,MS_TXT3,MS_TXT4, "
					strSql = strSql & "		MS_SEL1,MS_SEL2,MS_SEL3,MS_SEL4,MS_SEL5,MS_SEL6, "
					strSql = strSql & "		MS_SERVICE, MS_TOTAL ) "
					strSql = strSql & "	SELECT "
					strSql = strSql & "		'"& uId &"','"& usernm &"','"& birth &"','"& childbirth &"','"& marry &"' "
					strSql = strSql & "		,'"& radio1 &"','"& radio2 &"','"& radio3 &"','"& radio4 &"','"& radio5 &"' "
					strSql = strSql & "		,'"& txt1 &"','"& txt2 &"','"& txt3 &"','"& txt4 &"' "
					strSql = strSql & "		,'"& sel1 &"','"& sel2 &"','"& sel3 &"','"& sel4 &"','"& sel5 &"','"& sel6 &"' "
					strSql = strSql & "		,'"& service &"','"& totalchange &"' "
					response.write strSql
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 4
				End If 
		End Select 
	End If 
%>
<script type="text/javascript">
	function Init(e) {
		switch(e) {
			case(1) :
				alert('�����͸� �ٽ� Ȯ���� �ּ���.');
			break;
			case(2) :
				parent.fncSetServiceInfo("<%=strContent%>")
			break;
			case(3) :
				parent.fncSetServiceFinal("<%=strContent%>")
			break;
			case(4) :	
				alert('������������ ������ ����Ǿ����ϴ�.');
				parent.location.href = "/member/member_service.asp?<%=strParam%>"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>