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
<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<%	
'-----------------------------------------------------------------------------
'	Request
    mode		= fncRequest("mode")				'ó������(���/����)
	intIDX		= fncRequest("idx")

	




	If mode = "ins" Or mode = "upd" Then 


	mo_helper_seq		= Trim(fncRequest("mo_helper_seq1"))		'��𵵿�� ������
	mo_helper_name1		= Trim(fncRequest("mo_helper_name1"))		'��𵵿�� �̸�
	mo_service_comment	= Trim(fncRequest("mo_service_comment"))	'��𵵿�� ���� ���

	mo_helper_seq_1		= Trim(fncRequest("mo_helper_seq_1"))		'��𵵿�� ������
	mo_helper_name_1	= Trim(fncRequest("mo_helper_name_1"))		'��𵵿�� �̸�
	mo_service_comment_1= Trim(fncRequest("mo_service_comment_1"))	'��𵵿�� ���� ���

	mo_helper_seq_2		= Trim(fncRequest("mo_helper_seq_2"))		'��𵵿�� ������
	mo_helper_name_2	= Trim(fncRequest("mo_helper_name_2"))		'��𵵿�� �̸�
	mo_service_comment_2= Trim(fncRequest("mo_service_comment_2"))  '��𵵿�� ���� ���

	mo_helper_seq_3		= Trim(fncRequest("mo_helper_seq_3"))		'��𵵿�� ������
	mo_helper_name_3	= Trim(fncRequest("mo_helper_name_3"))		'��𵵿�� �̸�
	mo_service_comment_3= Trim(fncRequest("mo_service_comment_3"))  '��𵵿�� ���� ���






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

		s_happy_yn		= fncRequest("s_happy_yn")			' ���񽺽��۽���������
		e_happy_yn		= fncRequest("e_happy_yn")			 ' �������� ����

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

		pdt_no			= fncRequest("pdt_no")				' ��꼱������

		Q16_Y			= fncRequest("Q16_Y")				'  
		Q16_M			= fncRequest("Q16_M")				'  
		Q16_D			= fncRequest("Q16_D")				'  

		Q17_Y			= fncRequest("Q17_Y")				'   ��꼱���ڽ� �ù���
		Q17_M			= fncRequest("Q17_M")				'   
		Q17_D			= fncRequest("Q17_D")				'   

		product_1			= fncRequest("product_1")		'   �����
		product_2			= fncRequest("product_2")		'   �����Ҹ�ǰ   

		product_week		= fncRequest("product_week")		'  product_week
		product_price		= fncRequest("product_price")		'  product_week

		Q12_Y			= fncRequest("Q12_Y")				'   �����
		Q12_M			= fncRequest("Q12_M")				'   
		Q12_D			= fncRequest("Q12_D")				'   

		massage1			= fncRequest("massage1")			'   massage1
		massage2			= fncRequest("massage2")			'   massage1
		massage3			= fncRequest("massage3")			'   massage1  

		Q14_1			= fncRequest("Q14_1")				'  Q14_1
		Q14_2			= fncRequest("Q14_2")				'  Q14_1

		Q15_Y			= fncRequest("Q15_Y")				'  Q15_Y  

		Q16_baby			= fncRequest("Q16_baby")				'  Q16_baby  


		add_payment			= fncRequest("add_payment")				' �߰����  
		birth_j				= fncRequest("birth")				' ����(�޷�)  



	End If 
'-----------------------------------------------------------------------------

		check3_fam1=""
		check3_fam2=""
		check3_fam3=""
		check3_fam4=""
		check3_num1=""
		check3_num2=""
		check3_num3=""
		check3_num4=""
 

%>
 
<%

'-----------------------------------------------------------------------------


'--------�޷��߰��� ���� ----------------------------------------------------------
	birth_j_arr=split(birth_j,"-") 
	birth_y = birth_j_arr(0)
	birth_m = birth_j_arr(1)
	birth_d = birth_j_arr(2)
	birth = birth_y &  birth_m  &  birth_d 
'--------�޷��߰��� ���� ----------------------------------------------------------


 
'	������ Ȯ��
'	birth = Ybirth & fncSetNumber(Mbirth) & fncSetNumber(Dbirth)
	phone = phone_1 & "-" & phone_2 & "-" & phone_3
	hp = hp_1 & "-" & hp_2 & "-" & hp_3
	post = post_1 & "-" & post_2

	check1 = Replace(check1,",","||")
	check2 = Replace(check2,",","||")
	check3 = Replace(check3,",","||")



'---------------------------------------------------------------
'�ڵ��Է�
		If check2 <> "" Then 
			class_value = check2
			dim myarray                          
			myarray=split(class_value,"||") 
				For i = 0 To UBound(myarray)
				'	response.write i & "��° : " & myarray(i) & "<br>"
						If myarray(i) = "�ֵ���" Then
							add_twin_check = "�ֵ����ɾ�"
						End If 
					%> 
<script>
//	 alert("<%=myarray(i)%>");
</script> 
					<%
				Next 
		End If

  
		If check3 <> "" Then 
			check3_value = check3
			dim check3_array                          
			check3_array=split(check3_value,"||") 
				For i = 0 To UBound(check3_array)
				'	response.write i & "��° : " & check3_array(i) & "<br>"
%> 
<script>
//		 alert("<%=check3_array(i)%>");	 
</script> 
<%
 
						If trim(check3_array(i)) = "�����оƵ�1��" Then	
							check3_fam1 = "�����оƵ�"	
							check3_num1  = "1"
						elseif  trim(check3_array(i)) = "�����оƵ�2��" Then	
							check3_fam1 = "�����оƵ�"
							check3_num1  = "2"
						elseif  trim(check3_array(i)) = "�����оƵ�3��" Then	
							check3_fam1 = "�����оƵ�"
							check3_num1  = "3"
						elseif  trim(check3_array(i)) = "�����оƵ�4��" Then
							check3_fam1 = "�����оƵ�"
							check3_num1  = "4"
						elseif  trim(check3_array(i)) = "�����оƵ�5��" Then	
							check3_fam1 = "�����оƵ�"
							check3_num1  = "5"
						elseif  trim(check3_array(i)) = "���оƵ�1��" Then
							check3_fam2 = "���оƵ�"
							check3_num2  = "1"
						elseif  trim(check3_array(i)) = "���оƵ�2��" Then
							check3_fam2 = "���оƵ�"
							check3_num2  = "2"
						elseif  trim(check3_array(i)) = "���оƵ�3��" Then
							check3_fam2 = "���оƵ�"
							check3_num2  = "3"
						elseif  trim(check3_array(i)) = "���оƵ�4��" Then
							check3_fam2 = "���оƵ�"
							check3_num2  = "4"
						elseif  trim(check3_array(i)) = "���оƵ�5��" Then
							check3_fam2 = "���оƵ�"
							check3_num2  = "5"
						elseif  trim(check3_array(i)) = "��Ÿ����1��" Then
							check3_fam3 = "�߰�����"
							check3_num3  = "1"
						elseif  trim(check3_array(i)) = "��Ÿ����2��" Then
							check3_fam3 = "�߰�����"	
							check3_num3  = "2"					
						elseif  trim(check3_array(i)) = "��Ÿ����3��" Then
							check3_fam3 = "�߰�����"
							check3_num3  = "3"
						ElseIf  trim(check3_array(i)) = "�θ��" Then
							check3_fam4 = "�߰�����"
							check3_num4  = "1"
						End If  
				Next 
%> 
<script>
 //		alert("<%=check3_fam1%>");alert("<%=check3_num1%>");
//		alert("<%=check3_fam2%>");alert("<%=check3_num2%>");
//		alert("<%=check3_fam3%>");alert("<%=check3_num3%>");
//		alert("<%=check3_fam4%>");alert("<%=check3_num4%>");  
</script> 
<%
		End If 
'----------------------------------------------------------------
%> 
<script>
 
</script> 
<%
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

	If Q12_Y <> "" And Q12_M <> "" And Q12_D <> "" Then 
	Q12_YMD = Q12_Y & fncSetNumber(Q12_M) & fncSetNumber(Q12_D)
	End If 

	If Q16_Y <> "" And Q16_M <> "" And Q16_D <> "" Then 
	Q16_YMD = Q16_Y & fncSetNumber(Q16_M) & fncSetNumber(Q16_D)
	End If 

	If Q17_Y <> "" And Q17_M <> "" And Q17_D <> "" Then 
	Q17_YMD = Q17_Y & fncSetNumber(Q17_M) & fncSetNumber(Q17_D)
	End If 
'-----------------------------------------------------------------------------	

If mode = "ins" And mem_id = "" Then 
		intMsg = 1
Else 

 

		Select Case mode 
			Case "ins" :   
'��������  

		'�����̸�,	�̿�Ⱓ,		�̿�Ÿ��(�����), Ư�̻���(�ֵ���), �߰�����, 
		'check1,	radio1,		radio2		  check2	 ,  check3 
		If check1 <> "" Then 
			strSql1 = ""	
			strSql1 = strSql1 & "	select code				"
			strSql1 = strSql1 & "	FROM						"
			strSql1 = strSql1 & "	MO_SERVICE_CODE				"
			strSql1 = strSql1 & "	where						"
			strSql1 = strSql1 & "	CODENAME = '"& check1 &"' AND depth=1 	"  
			Set Rs = DBExec(strSql1,"main")	
			If Not Rs.EOF Then 
				DEPTH_1_CODE	= Rs(0)  '���� ���α׷�
			End If  
		End If
 

		If DEPTH_1_CODE <> "" Then 
			If radio2		= "����� + 5��" Then
				work_type	= "�����"
				work_day	= "5��"
			ElseIf radio2	= "����� + 6��" Then
				work_type	= "�����"
				work_day	= "6��"
			ElseIf radio2	= "���� + 5��" Then
				work_type	= "����"
				work_day	= "5��"
			ElseIf radio2	= "���� + 6��" Then
				work_type	= "����"
				work_day	= "6��"
			ElseIf radio2	= "����� + ���� + 5��" Then
				work_type	= "�����+����"
				work_day	= "5��"
			ElseIf radio2	= "����� + ���� + 6��" Then
				work_type	= "�����+����"
				work_day	= "6��"
		End if
 

			strSql1 = ""	
			strSql1 = strSql1 & "	;select code 															"
			strSql1 = strSql1 & "	FROM																	"
			strSql1 = strSql1 & "	MO_SERVICE_CODE															"
			strSql1 = strSql1 & "	where																	"
			strSql1 = strSql1 & "	up_code = '"& DEPTH_1_CODE &"'	AND		CODENAME =	'"& work_type &"'	" 

			Set Rs = DBExec(strSql1,"main")	
			If Not Rs.EOF Then 
				DEPTH_2_CODE	= Rs(0) '����� , ���� 
			End If  

			strSql1 = ""	
			strSql1 = strSql1 & "	;select code 															"
			strSql1 = strSql1 & "	FROM																	"
			strSql1 = strSql1 & "	MO_SERVICE_CODE															"
			strSql1 = strSql1 & "	where																	"
			strSql1 = strSql1 & "	up_code = '"& DEPTH_2_CODE &"'	AND		CODENAME =	'"& work_day &"'	" 

			Set Rs = DBExec(strSql1,"main")	
			If Not Rs.EOF Then 
				DEPTH_3_CODE	= Rs(0) '5�� 6�� 
			End If  
 
			strSql1 = ""	
			strSql1 = strSql1 & "	;select code, price														"
			strSql1 = strSql1 & "	FROM																	"
			strSql1 = strSql1 & "	MO_SERVICE_CODE															"
			strSql1 = strSql1 & "	where																	"
			strSql1 = strSql1 & "	up_code = '"& DEPTH_3_CODE &"' AND  CODENAME = '"& radio1 &"'			" 
			
			Set Rs = DBExec(strSql1,"main")	
			If Not Rs.EOF Then 
				DEPTH_4_CODE	= Rs(0) '1~4��
				DEPTH_4_PRICE	= Rs(1) '����
			End If  

			'----------------------------------------------------------------------	�߰���� �ֵ��� ---------------------------------------------------------------------------- 
			If add_twin_check <> "" Then 
				strSql1 = ""	
				strSql1 = strSql1 & "	;select code 														"
				strSql1 = strSql1 & "	FROM																"
				strSql1 = strSql1 & "	MO_SERVICE_CODE														"
				strSql1 = strSql1 & "	where																"
				strSql1 = strSql1 & "	up_code = 'A0001'	AND		CODENAME =	'"& work_type &"'			" 
				
				Set Rs = DBExec(strSql1,"main")	
				If Not Rs.EOF Then 
					ADD_DEPTH_2_CODE	= Rs(0) '����� , ���� 
				End If  


				strSql1 = ""	
				strSql1 = strSql1 & "	;select code , price														"
				strSql1 = strSql1 & "	FROM																		"
				strSql1 = strSql1 & "	MO_SERVICE_CODE																"
				strSql1 = strSql1 & "	where																		"
				strSql1 = strSql1 & "	up_code = '"& ADD_DEPTH_2_CODE &"' AND  CODENAME = '"& add_twin_check &"'	" 
				
				Set Rs = DBExec(strSql1,"main")	
				If Not Rs.EOF Then 
					ADD_DEPTH_3_CODE	= Rs(0) '    �ֵ���
					ADD_DEPTH_3_PRICE	= Rs(1) '    ����  
				End If   
				
				depth = "0"

				Response.write 		DEPTH_1_CODE   &","
				Response.write 		DEPTH_2_CODE   &","
				Response.write 		DEPTH_3_CODE   &","
				Response.write 		DEPTH_4_CODE   &","
				Response.write 		DEPTH_4_PRICE  &","

				Response.write 		ADD_DEPTH_2_CODE  &","
				Response.write 		ADD_DEPTH_3_CODE  &","
				Response.write 		ADD_DEPTH_3_PRICE  &"," 
			End If
'----------------------------------------------------------------------	�߰����  �߰����� ---------------------------------------------------------------------------- 
		If check3 <> "" Then 
				strSql1 = ""	
				strSql1 = strSql1 & "	;select code 									"
				strSql1 = strSql1 & "	FROM														"
				strSql1 = strSql1 & "	MO_SERVICE_CODE												"
				strSql1 = strSql1 & "	where														"
				strSql1 = strSql1 & "	up_code = 'A0001'	AND		CODENAME =	'"& work_type &"'	" 

				Set Rs = DBExec(strSql1,"main")	
				If Not Rs.EOF Then 
					ADD_FAM1_DEPTH_2_CODE	= Rs(0) '����� , ���� 
				End If  

				strSql1 = ""	
				strSql1 = strSql1 & "	;select code , price									"
				strSql1 = strSql1 & "	FROM														"
				strSql1 = strSql1 & "	MO_SERVICE_CODE												"
				strSql1 = strSql1 & "	where														"
				strSql1 = strSql1 & "	up_code = '"& ADD_FAM1_DEPTH_2_CODE &"'	AND		CODENAME =	'"& check3_fam1 &"'	" 
				
				Set Rs = DBExec(strSql1,"main")	
				If Not Rs.EOF Then 
					ADD_FAM2_DEPTH_3_CODE	= Rs(0) '�߰����� Ÿ��
					ADD_FAM2_DEPTH_3_PRICE	= Rs(1) '�߰����� ����
				End If  

				strSql1 = ""	
				strSql1 = strSql1 & "	;select code , price									"
				strSql1 = strSql1 & "	FROM														"
				strSql1 = strSql1 & "	MO_SERVICE_CODE												"
				strSql1 = strSql1 & "	where														"
				strSql1 = strSql1 & "	up_code = '"& ADD_FAM1_DEPTH_2_CODE &"'	AND		CODENAME =	'"& check3_fam2 &"'	" 
				
				Set Rs = DBExec(strSql1,"main")	
				If Not Rs.EOF Then 
					ADD_FAM3_DEPTH_3_CODE	= Rs(0) '�߰����� Ÿ��
					ADD_FAM3_DEPTH_3_PRICE	= Rs(1) '�߰����� ���� 
				End If  

				strSql1 = ""	
				strSql1 = strSql1 & "	;select code , price									"
				strSql1 = strSql1 & "	FROM														"
				strSql1 = strSql1 & "	MO_SERVICE_CODE												"
				strSql1 = strSql1 & "	where														"
				strSql1 = strSql1 & "	up_code = '"& ADD_FAM1_DEPTH_2_CODE &"'	AND		CODENAME =	'"& check3_fam3 &"'	" 
				
				Set Rs = DBExec(strSql1,"main")	
				If Not Rs.EOF Then 
					ADD_FAM4_DEPTH_3_CODE	= Rs(0) '�߰����� Ÿ��
					ADD_FAM4_DEPTH_3_PRICE	= Rs(1) '�߰����� ���� 
				End If  

				strSql1 = ""	
				strSql1 = strSql1 & "	;select code , price									"
				strSql1 = strSql1 & "	FROM														"
				strSql1 = strSql1 & "	MO_SERVICE_CODE												"
				strSql1 = strSql1 & "	where														"
				strSql1 = strSql1 & "	up_code = '"& ADD_FAM1_DEPTH_2_CODE &"'	AND		CODENAME =	'"& check3_fam4 &"'	" 
				
				Set Rs = DBExec(strSql1,"main")	
				If Not Rs.EOF Then 
					ADD_FAM5_DEPTH_3_CODE	= Rs(0) '�߰����� Ÿ��
					ADD_FAM5_DEPTH_3_PRICE	= Rs(1) '�߰����� ���� 
				End If   

		End If 
 
	End If

 
		If DEPTH_1_CODE <> "" And DEPTH_2_CODE <> "" And DEPTH_3_CODE <> "" And DEPTH_4_CODE <> "" And DEPTH_4_PRICE <> "" Then
	 
			strSql = ""
			strSql = strSql & " INSERT INTO MO_DATA_RESERVATION ( "
			strSql = strSql & "			MR_IDX					"
			strSql = strSql & " ,       SERVICE_CODE			"
			strSql = strSql & " ,       TYPE_CODE				"
			strSql = strSql & " ,       PERIOD_CODE				"
			strSql = strSql & " ,       DAY_CODE				"
			strSql = strSql & " ,       PRICE					" 
			strSql = strSql & " ,       ADD_TYPE				"
	'		strSql = strSql & " ,       ADD_FAMILY1				"
	'		strSql = strSql & " ,       ADD_FAMILY2				"
	'		strSql = strSql & " ,       ADD_FAMILY3				"
	'		strSql = strSql & " ,       ADD_FAMILY4				"
	'		strSql = strSql & " ,       ADD_FAMILY5				"
	'		strSql = strSql & " ,       ADD_OVER_TIME			"
	'		strSql = strSql & " ,       ADD_HOLIDAY_WORK		"
			strSql = strSql & " ,       ADD_PRICE		"
			strSql = strSql & " ) "
			strSql = strSql & " VALUES (  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION) "   
			strSql = strSql & " ,  '"&	DEPTH_1_CODE			&"' "
			strSql = strSql & " ,  '"&	DEPTH_2_CODE			&"' "
			strSql = strSql & " ,  '"&	DEPTH_3_CODE			&"' "
			strSql = strSql & " ,  '"&	DEPTH_4_CODE			&"' "
			strSql = strSql & " ,  '"&	DEPTH_4_PRICE			&"' "   
			strSql = strSql & " ,  '"&	birth		&"' "
	'		strSql = strSql & " ,  '"&	ADD_DEPTH_3_CODE		&"' "
	'		strSql = strSql & " ,  '"&	ADD_FAM2_DEPTH_3_CODE	&"' "
	'		strSql = strSql & " ,  '"&	ADD_FAM3_DEPTH_3_CODE	&"' "
		'	strSql = strSql & " ,  '"&	ADD_FAM4_DEPTH_3_CODE	&"' "
		'	strSql = strSql & " ,  '"&	ADD_FAM5_DEPTH_3_CODE	&"' "
	'		strSql = strSql & " ,  '"&		depth				&"' "
	'		strSql = strSql & " ,  '"&		depth				&"' "
			strSql = strSql & " ,  '"&		add_payment				&"' )"

			Call DBExec(strSql, "main") : Call DBClose(DBCon)
			Response.write 		"finish"
		End if
		 




	
			If uId = "wellness14" And pdt_no <> "" Then 
				 
			End if
 

			If mo_helper_seq <> "" Then  

			End If 
 
			If mo_helper_seq_1 <> "" Then 
 
			End If 

	 
			If mo_helper_seq_2 <> "" Then 
 
			End If 
 

			If mo_helper_seq_3 <> "" Then 
		 
			End If 
		 
			

			Case "upd" : 
				  
			If uId = "wellness14" And pdt_no <> "" Then 

			End if
			   
			If mo_helper_seq <> "" Then 
		
 			End If 
 
			If mo_helper_seq_1 <> "" Then 
 
			End if
		 
			If mo_helper_seq_2 <> "" Then  

			End If  
 
%>
 
<% 
			Case "del" : 
				If intIDX > 0 Then  
					intMsg = 4
				End If 
  
			Case "delete" : 
				If intIDX > 0 Then  
					intMsg = 4
				End If 

		End Select 
	End If 
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
				parent.location.href = "./member_reser_list.asp?<%=strParam%>"
			break;
			case(3) :
				alert('���� ��ϵǾ����ϴ�.');
				parent.location.href = "./member_reser_list.asp"
			break;
			case(4) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "./member_reser_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
