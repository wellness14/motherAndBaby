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
    mode		= fncRequest("mode")				'ó������(���/����)
	intIDX		= fncRequest("idx")
	page_name		= fncRequest("page_name")

 




	If mode = "ins" Or mode = "upd" Then 


	mo_helper_seq		= Trim(fncRequest("mo_helper_seq1"))   ' ��𵵿�� ������
	mo_helper_name1		= Trim(fncRequest("mo_helper_name1"))  '��𵵿�� �̸�
	mo_service_comment	= Trim(fncRequest("mo_service_comment"))   '��𵵿�� ���� ���

	mo_helper_seq_1		= Trim(fncRequest("mo_helper_seq_1"))   ' ��𵵿�� ������
	mo_helper_name_1	= Trim(fncRequest("mo_helper_name_1"))  '��𵵿�� �̸�
	mo_service_comment_1= Trim(fncRequest("mo_service_comment_1"))   '��𵵿�� ���� ���

	mo_helper_seq_2		= Trim(fncRequest("mo_helper_seq_2"))   ' ��𵵿�� ������
	mo_helper_name_2	= Trim(fncRequest("mo_helper_name_2"))  '��𵵿�� �̸�
	mo_service_comment_2= Trim(fncRequest("mo_service_comment_2"))   '��𵵿�� ���� ���

	mo_helper_seq_3		= Trim(fncRequest("mo_helper_seq_3"))   ' ��𵵿�� ������
	mo_helper_name_3	= Trim(fncRequest("mo_helper_name_3"))  '��𵵿�� �̸�
	mo_service_comment_3= Trim(fncRequest("mo_service_comment_3"))   '��𵵿�� ���� ���






		mem_id			= fncRequest("mem_id")				' ȸ��ID
		mem_nm			= fncRequest("mem_nm")				' ȸ����
		Ybirth			= fncRequest("Ybirth")				' �������
		Mbirth			= fncRequest("Mbirth")				' �������
		Dbirth			= fncRequest("Dbirth")				' �������

		phone_1			= Trim(fncRequest("phone_1"))		' ��ȭ��ȣ
		phone_2			= Trim(fncRequest("phone_2"))		' ��ȭ��ȣ
		phone_3			= Trim(fncRequest("phone_3"))		' ��ȭ��ȣ

		hp_1			= Trim(fncRequest("hp_1"))			' �ڵ�����ȣ
		hp_2			= Trim(fncRequest("hp_2"))			' �ڵ�����ȣ
		hp_3			= Trim(fncRequest("hp_3"))			' �ڵ�����ȣ

		post_1			= Trim(fncRequest("post_1"))		' �����ȣ
		post_2			= Trim(fncRequest("post_2"))		' �����ȣ

		addr_1			= Trim(fncRequest("addr_1"))		' �ּ�
		addr_2			= Trim(fncRequest("addr_2"))		' �ּ�

		check1			= fncRequest("check1")				' ��û����
		radio1			= fncRequest("radio1")				' �̿�Ⱓ
		radio2			= fncRequest("radio2")				' �̿�����

		childbirth_y	= fncRequest("childbirth_y")		' ��꿹����
		childbirth_m	= fncRequest("childbirth_m")		' ��꿹����
		childbirth_d	= fncRequest("childbirth_d")		' ��꿹����

		serviceSdt_y	= fncRequest("serviceSdt_y")		' ���񽺽�����
		serviceSdt_m	= fncRequest("serviceSdt_m")		' ���񽺽�����
		serviceSdt_d	= fncRequest("serviceSdt_d")		' ���񽺽�����

		serviceEdt_y	= fncRequest("serviceEdt_y")		' ����������
		serviceEdt_m	= fncRequest("serviceEdt_m")		' ����������
		serviceEdt_d	= fncRequest("serviceEdt_d")		' ����������

		radio3			= fncRequest("radio3")				' ������ �̿�
		radio4			= fncRequest("radio4")				' ������

		check2			= fncRequest("check2")				' Ư�̻���
		check3			= fncRequest("check3")				' ��������

		payment			= fncRequest("payment")				' ����
		radio5			= fncRequest("radio5")				' ��������
		radio6			= fncRequest("radio6")				' ��������
		payEdt_y		= fncRequest("payEdt_y")			' ������
		payEdt_m		= fncRequest("payEdt_m")			' ������
		payEdt_d		= fncRequest("payEdt_d")			' ������


		pay_name		= fncRequest("pay_name")			' �Ա���
		cancel_yn		= fncRequest("cancel_yn")			' ��ҿ���
		cancel_reason	= fncRequest("cancel_reason")	    ' ��һ���

		textarea		= fncRequest("textarea")			' ��㳻��


		

		extend_1_sy		= fncRequest("extend_1_sy")			' ���񽺿������1
		extend_1_sm		= fncRequest("extend_1_sm")			' 
		extend_1_sd		= fncRequest("extend_1_sd")			' 

		extend_1_ey		= fncRequest("extend_1_ey")			' ���񽺿���������1
		extend_1_em		= fncRequest("extend_1_em")			' 
		extend_1_ed		= fncRequest("extend_1_ed")			' 


		extend_2_sy		= fncRequest("extend_2_sy")			' ���񽺿������2
		extend_2_sm		= fncRequest("extend_2_sm")			' 
		extend_2_sd		= fncRequest("extend_2_sd")			' 

		extend_2_ey		= fncRequest("extend_2_ey")			' ���񽺿���������2
		extend_2_em		= fncRequest("extend_2_em")			' 
		extend_2_ed		= fncRequest("extend_2_ed")			' 


		extend_3_sy		= fncRequest("extend_3_sy")			' ���񽺿������3
		extend_3_sm		= fncRequest("extend_3_sm")			' 
		extend_3_sd		= fncRequest("extend_3_sd")			' 

		extend_3_ey		= fncRequest("extend_3_ey")			' ���񽺿���������3
		extend_3_em		= fncRequest("extend_3_em")			' 
		extend_3_ed		= fncRequest("extend_3_ed")			' 


	End If 
'-----------------------------------------------------------------------------


'-----------------------------------------------------------------------------
'	������ Ȯ��
	birth = Ybirth & fncSetNumber(Mbirth) & fncSetNumber(Dbirth)
	phone = phone_1 & "-" & phone_2 & "-" & phone_3
	hp = hp_1 & "-" & hp_2 & "-" & hp_3
	post = post_1 & "-" & post_2

	check1 = Replace(check1,",","||")
	check2 = Replace(check2,",","||")
	check3 = Replace(check3,",","||")

	childbirth = childbirth_y & fncSetNumber(childbirth_m) & fncSetNumber(childbirth_d)

	serviceSdt = serviceSdt_y & fncSetNumber(serviceSdt_m) & fncSetNumber(serviceSdt_d)
	serviceEdt = serviceEdt_y & fncSetNumber(serviceEdt_m) & fncSetNumber(serviceEdt_d)

	If extend_1_sy <> "" And extend_1_sm <> "" And extend_1_sd <> "" Then 
		serviceSdt_1 = extend_1_sy & fncSetNumber(extend_1_sm) & fncSetNumber(extend_1_sd)
	End If 

	If extend_1_ey <> "" And extend_1_em <> "" And extend_1_ed <> "" Then 
		serviceEdt_1 = extend_1_ey & fncSetNumber(extend_1_em) & fncSetNumber(extend_1_ed)
	End If 

	If extend_2_sy <> "" And extend_2_sm <> "" And extend_2_sd <> "" Then 
		serviceSdt_2 = extend_2_sy & fncSetNumber(extend_2_sm) & fncSetNumber(extend_2_sd)
	End If 

	If extend_2_ey <> "" And extend_2_em <> "" And extend_2_ed <> "" Then 
		serviceEdt_2 = extend_2_ey & fncSetNumber(extend_2_em) & fncSetNumber(extend_2_ed)
	End If 


	If extend_3_sy <> "" And extend_3_sm <> "" And extend_3_sd <> "" Then 
		serviceSdt_3 = extend_3_sy & fncSetNumber(extend_3_sm) & fncSetNumber(extend_3_sd)
	End If 

	If extend_3_ey <> "" And extend_3_em <> "" And extend_3_ed <> "" Then 
		serviceEdt_3 = extend_3_ey & fncSetNumber(extend_3_em) & fncSetNumber(extend_3_ed)
	End If 


	If payEdt_y <> "" And payEdt_m <> "" And payEdt_d <> "" Then 
		payDate	   = payEdt_y & fncSetNumber(payEdt_m) & fncSetNumber(payEdt_d)
	End If 
'-----------------------------------------------------------------------------	

	If mode = "ins" And mem_id = "" Then 
		intMsg = 1
	Else 

 
		Select Case mode 
			Case "ins" : 
				strSql = ""
				strSql = strSql & " INSERT INTO MO_RESERVATION ( "
				strSql = strSql & "         MR_MEM_ID,MR_MEM_NM,MR_BIRTH,MR_PHONE,MR_HP,MR_POST,MR_ADDR1,MR_ADDR2, "
				strSql = strSql & "         MR_SERVICE,MR_PERIOD,MR_TYPE,MR_CHILDBIRTH,MR_SERVICESDT,MR_SERVICEEDT,MR_CLINIC, "
				strSql = strSql & "         MR_EXPER,MR_UNIQUE,MR_FAMILY,MR_PAY_MENT,MR_PAY_TYPE,MR_PAY_STATE,MR_PAY_DT,MR_CONTENT, "
				strSql = strSql & "			MR_SERVICESDT1, MR_SERVICEEDT1, MR_SERVICESDT2, MR_SERVICEEDT2, MR_SERVICESDT3, MR_SERVICEEDT3,  "
				strSql = strSql & "         MR_PAY_NAME, MR_CANCEL_YN, MR_CANCEL_REASON "
				strSql = strSql & " )  "
				strSql = strSql & " SELECT "
				strSql = strSql & "			'"& mem_id &"','"& mem_nm &"','"& birth &"','"& phone &"','"& hp &"','"& post &"','"& addr_1 &"','"& addr_2 &"', "
				strSql = strSql & "			'"& check1 &"','"& radio1 &"','"& radio2 &"','"& childbirth &"','"& serviceSdt &"','"& serviceEdt &"','"& radio3 &"', "
				strSql = strSql & "			'"& radio4 &"','"& check2 &"','"& check3 &"','"& payment &"','"& radio5 &"','"& radio6 &"','"& payDate &"' "
				strSql = strSql & "			,'"& textarea &"','"& serviceSdt_1 &"','"& serviceEdt_1 &"','"& serviceSdt_2 &"','"& serviceEdt_2 &"' "
				strSql = strSql & "			,'"& serviceSdt_3 &"','"& serviceEdt_3 &"','"& pay_name &"','"& cancel_yn &"','"& cancel_reason &"' ;"
	'			response.Write strSql
	'			response.End 
 
	Call DBExec(strSql, "main") : Call DBClose(DBCon)
	intMsg = 2

' select ISNULL(MAX(MO_EXTEND),0)  FROM MO_HELPER_SERVICE   where  MD_HELPER_SEQ = '169' ����� �������� ����Ƚ�� ���ϱ�

		If mo_helper_seq <> "" Then 
		
				strSql = ""
				strSql = strSql & " INSERT INTO MO_HELPER_SERVICE ( "
				strSql = strSql & "        MD_HELPER_SEQ, "
				strSql = strSql & "        MR_IDX, "
				strSql = strSql & "        MO_SEQ, "
				strSql = strSql & "        MD_HELPER_COMMENT, "
				strSql = strSql & "        MO_EXTEND "
				strSql = strSql & " )  "
				strSql = strSql & " VALUES ( " & mo_helper_seq  
				strSql = strSql & " ,(SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
				strSql = strSql & " ,(SELECT ISNULL(MAX(MO_SEQ), 0)+ 1 from  MO_HELPER_SERVICE  where  MD_HELPER_SEQ = '"& mo_helper_seq &"' "
				strSql = strSql & " and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM  MO_HELPER_SERVICE) )"
				strSql = strSql & " ,  '"& mo_service_comment &"'  "

				strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0)  from  MO_HELPER_SERVICE where MR_IDX = "
				strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   "
				strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) ) "
		

				Call DBExec(strSql, "main") : Call DBClose(DBCon)
		End If 


	'���� ���� �μ�Ʈ 1

	If mo_helper_seq_1 <> "" Then 

	'MO_EXTEND �� ���ؼ� �����Ҷ� �μ�Ʈ 

			strSql = ""
			strSql = strSql & " select MR_SERVICESDT1   "
			strSql = strSql & " FROM "
			strSql = strSql & " MO_RESERVATION "
			strSql = strSql & " where "
			strSql = strSql & "  MR_IDX = '"& intIDX &"' ; " 

			Set Rs = DBExec(strSql,"main")	
			If Not Rs.EOF Then
				
				MO_EXTEND				    = Rs(0)

			
	 
			End If 

			Call RSClose(Rs)

 
	
			strSql = ""
			strSql = strSql & " INSERT INTO MO_HELPER_SERVICE ( "
			strSql = strSql & "        MD_HELPER_SEQ, "
			strSql = strSql & "        MR_IDX, "
			strSql = strSql & "        MO_SEQ, "
			strSql = strSql & "        MD_HELPER_COMMENT, "
			strSql = strSql & "        MO_EXTEND "
			strSql = strSql & " )  "
			strSql = strSql & " VALUES ( " & mo_helper_seq_1  
			strSql = strSql & " ,(SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
			strSql = strSql & " ,(SELECT ISNULL(MAX(MO_SEQ), 0)  from  MO_HELPER_SERVICE  where  MD_HELPER_SEQ = '"& mo_helper_seq &"' "
			strSql = strSql & " and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM  MO_HELPER_SERVICE) )"
			strSql = strSql & " ,  '"& mo_service_comment_1 &"'  "
			
		If extend_1_sy <> ""   Then	
			strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0) + 1 from  MO_HELPER_SERVICE where MR_IDX = "
			strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
			strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) )  "  
		Else
			strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0)  from  MO_HELPER_SERVICE where MR_IDX = "
			strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
			strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) ) "
		End if

			Call DBExec(strSql, "main") : Call DBClose(DBCon)
	End If 

	' ���� ���� �μ�Ʈ 2

			If mo_helper_seq_2 <> "" Then 

	'MO_EXTEND �� ���ؼ� �����Ҷ� �μ�Ʈ 

			strSql = ""
			strSql = strSql & " select MR_SERVICESDT2   "
			strSql = strSql & " FROM "
			strSql = strSql & " MO_RESERVATION "
			strSql = strSql & " where "
			strSql = strSql & "  MR_IDX = '"& intIDX &"' ; " 

			Set Rs = DBExec(strSql,"main")	
			If Not Rs.EOF Then
				
				MO_EXTEND				    = Rs(0)

			
	 
			End If 

			Call RSClose(Rs)
 
			strSql = ""
			strSql = strSql & " INSERT INTO MO_HELPER_SERVICE ( "
			strSql = strSql & "        MD_HELPER_SEQ, "
			strSql = strSql & "        MR_IDX, "
			strSql = strSql & "        MO_SEQ, "
			strSql = strSql & "        MD_HELPER_COMMENT, "
			strSql = strSql & "        MO_EXTEND "
			strSql = strSql & " )  "
			strSql = strSql & " VALUES ( " & mo_helper_seq_2  
			strSql = strSql & " ,(SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
			strSql = strSql & " ,(SELECT ISNULL(MAX(MO_SEQ), 0)  from  MO_HELPER_SERVICE  where  MD_HELPER_SEQ = '"& mo_helper_seq &"' "
			strSql = strSql & " and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM  MO_HELPER_SERVICE) )"
			strSql = strSql & " ,  '"& mo_service_comment_2 &"'  "
			
		If extend_2_sy <> ""   Then	
			strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0) + 1 from  MO_HELPER_SERVICE where MR_IDX = "
			strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
			strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) )  "  
		Else
			strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0)  from  MO_HELPER_SERVICE where MR_IDX =   "
			strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
			strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) ) "
		End if

			Call DBExec(strSql, "main") : Call DBClose(DBCon)
	End If 

 
	'���񽺿��� �μ�Ʈ 3

			If mo_helper_seq_3 <> "" Then 

	'MO_EXTEND �� ���ؼ� �����Ҷ� �μ�Ʈ 

			strSql = ""
			strSql = strSql & " select MR_SERVICESDT3   "
			strSql = strSql & " FROM "
			strSql = strSql & " MO_RESERVATION "
			strSql = strSql & " where "
			strSql = strSql & "  MR_IDX = '"& intIDX &"' ; " 

			Set Rs = DBExec(strSql,"main")	
			If Not Rs.EOF Then

				MO_EXTEND				    = Rs(0)


			End If 

			Call RSClose(Rs)
 

	
			strSql = ""
			strSql = strSql & " INSERT INTO MO_HELPER_SERVICE ( "
			strSql = strSql & "        MD_HELPER_SEQ, "
			strSql = strSql & "        MR_IDX, "
			strSql = strSql & "        MO_SEQ, "
			strSql = strSql & "        MD_HELPER_COMMENT, "
			strSql = strSql & "        MO_EXTEND "
			strSql = strSql & " )  "
			strSql = strSql & " VALUES ( " & mo_helper_seq_3  
			strSql = strSql & " ,(SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
			strSql = strSql & " ,(SELECT ISNULL(MAX(MO_SEQ), 0)  from  MO_HELPER_SERVICE  where  MD_HELPER_SEQ = '"& mo_helper_seq &"' "
			strSql = strSql & " and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)   FROM  MO_HELPER_SERVICE) )"
			strSql = strSql & " ,  '"& mo_service_comment_3 &"'  "
			
		If extend_3_sy <> ""   Then	
			strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0) + 1 from  MO_HELPER_SERVICE where MR_IDX =  "
			strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
			strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) )  "  
		Else
			strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0)  from  MO_HELPER_SERVICE where MR_IDX =  "
			strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
			strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) ) "
		End if

			Call DBExec(strSql, "main") : Call DBClose(DBCon)
	End If 
 
	

			Case "upd" : 
				If intIDX > 0 Then 
					strSql = ""
					strSql = strSql & " UPDATE MO_RESERVATION SET "
					strSql = strSql & "		MR_MEM_NM = '"& mem_nm &"' "
					strSql = strSql & "		,MR_BIRTH = '"& birth &"' "
					strSql = strSql & "		,MR_PHONE = '"& phone &"' "
					strSql = strSql & "		,MR_HP = '"& hp &"' "
					strSql = strSql & "		,MR_POST = '"& post &"' "
					strSql = strSql & "		,MR_ADDR1 = '"& addr_1 &"' "
					strSql = strSql & "		,MR_ADDR2 = '"& addr_2 &"' "
					strSql = strSql & "		,MR_SERVICE = '"& check1 &"' "
					strSql = strSql & "		,MR_PERIOD = '"& radio1 &"' "
					strSql = strSql & "		,MR_TYPE = '"& radio2 &"' "
					strSql = strSql & "		,MR_CHILDBIRTH = '"& childbirth &"' "
					strSql = strSql & "		,MR_SERVICESDT = '"& serviceSdt &"' "
					strSql = strSql & "		,MR_SERVICEEDT = '"& serviceEdt &"' "
					strSql = strSql & "		,MR_CLINIC = '"& radio3 &"' "
					strSql = strSql & "		,MR_EXPER = '"& radio4 &"' "
					strSql = strSql & "		,MR_UNIQUE = '"& check2 &"' "
					strSql = strSql & "		,MR_FAMILY = '"& check3 &"' "
					strSql = strSql & "		,MR_PAY_MENT = '"& payment &"' "
					strSql = strSql & "		,MR_PAY_TYPE = '"& radio5 &"' "
					strSql = strSql & "		,MR_PAY_STATE = '"& radio6 &"' "
					strSql = strSql & "		,MR_PAY_DT = '"& payDate &"' "
					strSql = strSql & "		,MR_CONTENT = '"& textarea &"' "
					strSql = strSql & "		,MR_SERVICESDT1 = '"& serviceSdt_1 &"' "
					strSql = strSql & "		,MR_SERVICEEDT1 = '"& serviceEdt_1 &"' "
					strSql = strSql & "		,MR_SERVICESDT2 = '"& serviceSdt_2 &"' "
					strSql = strSql & "		,MR_SERVICEEDT2 = '"& serviceEdt_2 &"' "
					strSql = strSql & "		,MR_SERVICESDT3 = '"& serviceSdt_3 &"' "
					strSql = strSql & "		,MR_SERVICEEDT3 = '"& serviceEdt_3 &"' "
					strSql = strSql & "		,MR_PAY_NAME = '"& pay_name &"' "
					strSql = strSql & "		,MR_CANCEL_YN = '"& cancel_yn &"' "
					strSql = strSql & "		,MR_CANCEL_REASON = '"& cancel_reason &"' "
 
					strSql = strSql & "	WHERE MR_IDX='"& intIDX &"' "
					'response.Write strSql

					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3



'������Ʈ�� ��𵵿�� �˻��� �����ϱ� MO_EXTEND 0
 

			If mo_helper_seq <> "" Then 
		

					strSql = ""
					strSql = strSql & " INSERT INTO MO_HELPER_SERVICE ( "
					strSql = strSql & "        MD_HELPER_SEQ, "
					strSql = strSql & "        MR_IDX, "
					strSql = strSql & "        MO_SEQ, "
					strSql = strSql & "        MD_HELPER_COMMENT, "
					strSql = strSql & "        MO_EXTEND "
					strSql = strSql & " )  "
					strSql = strSql & " VALUES ( " & mo_helper_seq  
					strSql = strSql & " ,  " & intIDX 
					strSql = strSql & " ,(SELECT ISNULL(MAX(MO_SEQ), 0)+ 1 from  MO_HELPER_SERVICE  where  MD_HELPER_SEQ = '"& mo_helper_seq &"' "
					strSql = strSql & " and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM  MO_HELPER_SERVICE) )"
					strSql = strSql & " ,  '"& mo_service_comment &"' "
				
					strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0)  from  MO_HELPER_SERVICE where MR_IDX = "
					strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   "
					strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) ) "
				
 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
			End If 


			'������Ʈ�� ��𵵿�� �˻��� �����ϱ� MO_EXTEND 1
 

			If mo_helper_seq_1 <> "" Then 

				strSql = ""
				strSql = strSql & " select MR_SERVICESDT1   "
				strSql = strSql & " FROM "
				strSql = strSql & " MO_RESERVATION "
				strSql = strSql & " where "
				strSql = strSql & "  MR_IDX = '"& intIDX &"' ; " 

				Set Rs = DBExec(strSql,"main")	
				If Not Rs.EOF Then
					
					MO_EXTEND				    = Rs(0)

				
		 
				End If 

				Call RSClose(Rs)

					strSql = ""
					strSql = strSql & " INSERT INTO MO_HELPER_SERVICE ( "
					strSql = strSql & "        MD_HELPER_SEQ, "
					strSql = strSql & "        MR_IDX, "
					strSql = strSql & "        MO_SEQ, "
					strSql = strSql & "        MD_HELPER_COMMENT, "
					strSql = strSql & "        MO_EXTEND "
					strSql = strSql & " )  "
					strSql = strSql & " VALUES ( " & mo_helper_seq_1  
					strSql = strSql & " ,  " & intIDX 
					strSql = strSql & " ,(SELECT ISNULL(MAX(MO_SEQ), 0) from  MO_HELPER_SERVICE  where  MD_HELPER_SEQ = '"& mo_helper_seq &"' "
					strSql = strSql & " and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM  MO_HELPER_SERVICE) )"
					strSql = strSql & " ,  '"& mo_service_comment_1 &"'  "
				If extend_1_sy <> ""   Then	
					strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0) + 1 from  MO_HELPER_SERVICE where MR_IDX = "
					strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
					strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) )  "  
				Else
					strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0)  from  MO_HELPER_SERVICE where MR_IDX = "
					strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
					strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) ) "
				End if
		
 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
			End If 


			'������Ʈ�� ��𵵿�� �˻��� �����ϱ� MO_EXTEND 2
 

			If mo_helper_seq_2 <> "" Then 

				strSql = ""
				strSql = strSql & " select MR_SERVICESDT2   "
				strSql = strSql & " FROM "
				strSql = strSql & " MO_RESERVATION "
				strSql = strSql & " where "
				strSql = strSql & "  MR_IDX = '"& intIDX &"' ; " 

				Set Rs = DBExec(strSql,"main")	
				If Not Rs.EOF Then
					
					MO_EXTEND				    = Rs(0)

				
		 
				End If 

				Call RSClose(Rs)

					strSql = ""
					strSql = strSql & " INSERT INTO MO_HELPER_SERVICE ( "
					strSql = strSql & "        MD_HELPER_SEQ, "
					strSql = strSql & "        MR_IDX, "
					strSql = strSql & "        MO_SEQ, "
					strSql = strSql & "        MD_HELPER_COMMENT, "
					strSql = strSql & "        MO_EXTEND "
					strSql = strSql & " )  "
					strSql = strSql & " VALUES ( " & mo_helper_seq_2  
					strSql = strSql & " ,  " & intIDX 
					strSql = strSql & " ,(SELECT ISNULL(MAX(MO_SEQ), 0) from  MO_HELPER_SERVICE  where  MD_HELPER_SEQ = '"& mo_helper_seq &"' "
					strSql = strSql & " and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM  MO_HELPER_SERVICE) )"
					strSql = strSql & " ,  '"& mo_service_comment_2 &"' "
				If extend_2_sy <> ""   Then	
					strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0) + 1 from  MO_HELPER_SERVICE where MR_IDX = "
					strSql = strSql & "  '"& intIDX &"'    " 
					strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) )  "  
				Else
					strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0)  from  MO_HELPER_SERVICE where MR_IDX = "
					strSql = strSql & "  '"& intIDX &"'   " 
					strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) ) "
				End if
		
 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
			End If 


			'������Ʈ�� ��𵵿�� �˻��� �����ϱ� MO_EXTEND 3
 

			If mo_helper_seq_3 <> "" Then 

				strSql = ""
				strSql = strSql & " select MR_SERVICESDT3   "
				strSql = strSql & " FROM "
				strSql = strSql & " MO_RESERVATION "
				strSql = strSql & " where "
				strSql = strSql & "  MR_IDX = '"& intIDX &"' ; " 

				Set Rs = DBExec(strSql,"main")	
				If Not Rs.EOF Then
					
					MO_EXTEND				    = Rs(0)

				
		 
				End If 

				Call RSClose(Rs)

					strSql = ""
					strSql = strSql & " INSERT INTO MO_HELPER_SERVICE ( "
					strSql = strSql & "        MD_HELPER_SEQ, "
					strSql = strSql & "        MR_IDX, "
					strSql = strSql & "        MO_SEQ, "
					strSql = strSql & "        MD_HELPER_COMMENT, "
					strSql = strSql & "        MO_EXTEND "
					strSql = strSql & " )  "
					strSql = strSql & " VALUES ( " & mo_helper_seq_3  
					strSql = strSql & " ,  " & intIDX 
					strSql = strSql & " ,(SELECT ISNULL(MAX(MO_SEQ), 0) from  MO_HELPER_SERVICE  where  MD_HELPER_SEQ = '"& mo_helper_seq &"' "
					strSql = strSql & " and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM  MO_HELPER_SERVICE) )"
					strSql = strSql & " ,  '"& mo_service_comment_3 &"' "
				If extend_3_sy <> ""   Then	
					strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0) + 1 from  MO_HELPER_SERVICE where MR_IDX = "
					strSql = strSql & "  '"& intIDX &"'    " 
					strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) )  "  
				Else
					strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0)  from  MO_HELPER_SERVICE where MR_IDX = "
					strSql = strSql & "  '"& intIDX &"'   " 
					strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) ) "
				End if
		
 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
			End If 
		End If 
%>
 
<%


			Case "del" : 
				If intIDX > 0 Then 
					strSql = ""
					strSql = strSql & " UPDATE MO_RESERVATION SET "
					strSql = strSql & "		MR_CNLKBN = 'Y' "
					strSql = strSql & "	WHERE MR_IDX='"& intIDX &"' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 4
				End If 




			Case "delete" : 
				If intIDX > 0 Then 
					strSql = ""
					strSql = strSql & " delete from MO_RESERVATION  "
					strSql = strSql & "	WHERE MR_IDX='"& intIDX &"' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 4
				End If 

		End Select 
	End If 
%>
<%
If page_name = "pay_y_list" then
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
				parent.location.href = "./mobile_member_reser_pay_y_list.asp?<%=strParam%>"
			break;
			case(3) :
				alert('���� ��ϵǾ����ϴ�.');
				parent.location.href = "./mobile_member_reser_pay_y_list.asp"
			break;
			case(4) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "./mobile_member_reser_pay_y_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>



<%
elseIf page_name = "service_ing_list" then
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
				parent.location.href = "./mobile_member_reser_service_ing_list.asp?<%=strParam%>"
			break;
			case(3) :
				alert('���� ��ϵǾ����ϴ�.');
				parent.location.href = "./mobile_member_reser_service_ing_list.asp"
			break;
			case(4) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "./mobile_member_reser_service_ing_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>


<%
elseIf page_name = "service_end_list" then
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
				parent.location.href = "./mobile_member_reser_service_end_list.asp?<%=strParam%>"
			break;
			case(3) :
				alert('���� ��ϵǾ����ϴ�.');
				parent.location.href = "./mobile_member_reser_service_end_list.asp"
			break;
			case(4) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "./mobile_member_reser_service_end_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>



<%
elseIf page_name = "cancel_list" then
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
				parent.location.href = "./mobile_member_reser_cancel_list.asp?<%=strParam%>"
			break;
			case(3) :
				alert('���� ��ϵǾ����ϴ�.');
				parent.location.href = "./mobile_member_reser_cancel_list.asp"
			break;
			case(4) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "./mobile_member_reser_cancel_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>




<%
else
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
				parent.location.href = "./mobile_member_reser_list.asp?<%=strParam%>"
			break;
			case(3) :
				alert('���� ��ϵǾ����ϴ�.');
				parent.location.href = "./mobile_member_reser_list.asp"
			break;
			case(4) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "./mobile_member_reser_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>

<%End if%>
