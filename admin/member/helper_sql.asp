<%
'======================================================================
'�� �� �� : �����غ��� - ����
'����� : ȸ�� ����
'�� �� �� : member_sql.asp
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
    mode			= fncRequest("mode")				'ó������(���/����)
	hp_seq			= Trim(fncRequest("hp_seq"))		' �����ID
	




	If mode = "ins" Or mode = "upd" Then 
		
		filePath	= Trim(fncRequest("filePath"))
		varFileNm	= Trim(fncRequest("varFileNm")) 

		hp_name		    = Trim(fncRequest("hp_name"))				' ������ �̸�
		jumin1          = Trim(fncRequest("jumin1"))			' �ֹι�ȣ���ڸ�
		jumin2          = Trim(fncRequest("jumin2"))				' �ֹι�ȣ���ڸ�

		hp_1            = Trim(fncRequest("hp_1"))				' �������ڸ�
		hp_2            = Trim(fncRequest("hp_2"))				' ����������ڸ�
		hp_3            = Trim(fncRequest("hp_3"))				' �������ڸ�

		phone_1         = Trim(fncRequest("phone_1"))				' �������ڸ�
		phone_2         = Trim(fncRequest("phone_2"))				' ����������ڸ�
		phone_3         = Trim(fncRequest("phone_3"))				' �������ڸ�

		local          = fncRequest("local")				    ' ������
		part          = fncRequest("part")				    ' ������ ������

		post_1         = Trim(fncRequest("post_1"))				' ������ȣ��
		post_2         = Trim(fncRequest("post_2"))				' ������ȣ��
		addr_1         = Trim(fncRequest("addr_1"))				' �ּ�
		addr_2         = Trim(fncRequest("addr_2"))				' ���ּ�

		hp_type			= fncRequest("hp_type")				' ����� �з�
		hope_work		= fncRequest("hope_work")			' ����ٹ�����  
		bank			= Trim(fncRequest("bank"))				' �������� 

		account		    = Trim(fncRequest("account"))		        ' ���¹�ȣ 
		account_name	= Trim(fncRequest("account_name"))		' ������ 
		hp_hope     	= fncRequest("hp_hope")		        ' ����ٹ����� 


		hp_near	        = fncRequest("hp_near")		        ' ���������ö�� 
		edu_org     	= fncRequest("edu_org")		        ' ���������� 
		dip_no      	= Trim(fncRequest("dip_no"))		        ' ���     


		license     	= fncRequest("license")	        	' �ڰ��� 

		license1     	= fncRequest("license1")	        	' �ڰ��� 
		license2     	= fncRequest("license2")	        	' �ڰ��� 
		license3     	= fncRequest("license3")	        	' �ڰ��� 
		license4     	= fncRequest("license4")	        	' �ڰ��� 
		license5     	= fncRequest("license5")	        	' �ڰ��� 
		license6     	= fncRequest("license6")

		license_no1   	= fncRequest("license1_gb")		    ' �޼� 
		license_no2   	= fncRequest("license2_gb")		    ' �޼� 
		license_no3   	= fncRequest("license3_gb")		    ' �޼� 
		license_no4   	= fncRequest("license4_gb")		    ' �޼� 
		license_no5   	= fncRequest("license5_gb")		    ' �޼� 
		license_no6   	= fncRequest("license6_gb")		    ' �޼� 


		license_no   	= fncRequest("license_no")		    ' �޼� 
		hp_riligion	    = fncRequest("hp_riligion")		    ' ���� 

		INSURANCE_FLG	= fncRequest("INSURANCE_FLG")		' ����� ��������  
		INSURANCE_NO	= Trim(fncRequest("INSURANCE_NO"))		' ���ǹ�ȣ 


		startY			= fncRequest("startY")				' �����Ⱓ���۳� 
		startM			= fncRequest("startM")				' �����Ⱓ���ۿ� 
		startD			= fncRequest("startD")				' �����Ⱓ������ 


		endY			= fncRequest("endY")				' �����Ⱓ�������� 
		endM			= fncRequest("endM")				' �����Ⱓ�������� 
		endD			= fncRequest("endD")				' �����Ⱓ�������� 

		INSURANCE_NOW	= fncRequest("INSURANCE_NOW")		' ���� 
		hp_picture		= fncRequest("hp_picture")			' ������ ���� 

		QUALIFICTION	= fncRequest("QUALIFICTION")		' �ڰݻ��� 
		QnA				= fncRequest("QnA")					' ��Ÿ���� 

		i_start				= fncRequest("i_start_date")			' ����(�޷�)  
		i_end				= fncRequest("i_end_date")				' ����(�޷�)  

		health_flg				= fncRequest("health_flg")				' �ǰ���������

		If part <> "" then
			class_value = part
			dim myarray                          
			myarray=split(class_value,":")
			class_value_1=myarray(0)      
			title_value_1=myarray(1)
		End if

	End If 
'-----------------------------------------------------------------------------
 



 '--------�޷��߰��� ���� ----------------------------------------------------------
If i_start <> "" Then  
	i_start_arr=split(i_start,"-") 
	i_start_y = i_start_arr(0)
	i_start_m = i_start_arr(1)
	i_start_d = i_start_arr(2)
	i_start_ymd = i_start_y &  i_start_m  &  i_start_d 

End If 

If i_end <> "" then
	i_end_arr=split(i_end,"-") 
	i_end_y = i_end_arr(0)
	i_end_m = i_end_arr(1)
	i_end_d = i_end_arr(2)
	i_end_ymd = i_end_y &  i_end_m  &  i_end_d 
 End If 

'--------�޷��߰��� ���� ----------------------------------------------------------

'-----------------------------------------------------------------------------
'	������ Ȯ��
	If startY <> "" And startM <> "" And startD <> "" Then 
	startYMD = startY & fncSetNumber(startM) & fncSetNumber(startD)
	End If 


	phone = phone_1 & "-" & phone_2 & "-" & phone_3
	hp = hp_1 & "-" & hp_2 & "-" & hp_3
	post = post_1 & "-" & post_2
	

	If INSURANCE_FLG = "" Then INSURANCE_FLG = "N"


	If endY <> "" And endM <> "" And endD <> "" Then 
	endYMD = endY & fncSetNumber(endM) & fncSetNumber(endD)
	End If 

'-----------------------------------------------------------------------------	

	Select Case mode 
		Case "ins" : 
			strSql = ""
			strSql = strSql & " INSERT INTO MO_HELPER ( "
			strSql = strSql & " MD_HELPER_SEQ, MD_HELPER_NAME, MD_HELPER_JUMIN1, MD_HELPER_JUMIN2, MD_HELPER_PHONE, MD_HELPER_HP, MD_HELPER_LOCAL, MD_HELPER_LOCAL_ORIGINAL,  "
			strSql = strSql & "       MD_HELPER_POST, MD_HELPER_ADDR1, MD_HELPER_ADDR2, MD_HELPER_FLG, MD_HELPER_WORK_FLG, MD_HELPER_BANK,   "
			strSql = strSql & "       MD_HELPER_ACCOUNT,MD_HELPER_ACCOUNT_NAME, MD_HELPER_HOPE, MD_HELPER_NEAR, MD_HELPER_EDU,  "
			strSql = strSql & "       MD_HELPER_DIPLOMA_NO, MD_HELPER_LICENSE, MD_HELPER_LICENSE_NO, MD_HELPER_RELIGION, MD_HELPER_INSURANCE_FLG,   "
			strSql = strSql & "       MD_HELPER_INSURANCE_NO, MD_HELPER_INSURANCE_START, MD_HELPER_INSURANCE_END, MD_HELPER_INSURANCE_NOW_FLG,   "
			strSql = strSql & "       MD_HELPER_PICTURE, MD_HELPER_QUALIFICTION, MD_HELPER_QnA , MD_HELPER_LICENSE_1, MD_HELPER_LICENSE_2, "
			strSql = strSql & " MD_HELPER_LICENSE_3,MD_HELPER_LICENSE_4, MD_HELPER_LICENSE_5, MD_HELPER_LICENSE_NO_1, MD_HELPER_LICENSE_NO_2  "
			strSql = strSql & "  , MD_HELPER_LICENSE_NO_3, MD_HELPER_LICENSE_NO_4, MD_HELPER_LICENSE_NO_5 , MD_HELPER_HEALTH"
			strSql = strSql & "   "
			strSql = strSql & "   "
			strSql = strSql & "   "
  

			strSql = strSql & " )  "
			strSql = strSql & " VALUES ( (SELECT ISNULL(MAX(MD_HELPER_SEQ), 0) + 1 FROM MO_HELPER)"
			strSql = strSql & ",'"& hp_name &"','"& jumin1 &"','"& jumin2 &"','"& phone &"','"&  hp &"','"&  class_value_1 &"','"&  title_value_1 &"','"& post &"','"& addr_1 &"','"& addr_2 &"', '"
			strSql = strSql & hp_type &"','"& hope_work &"','"& bank &"','"& account &"','"& account_name &"','"& hp_hope &"','"& hp_near &"','"& edu_org &"', '"
			strSql = strSql & dip_no &"','"& license1 &"','"& license_no1 &"','"& hp_riligion &"','"& INSURANCE_FLG &"','"& INSURANCE_NO &"','"& i_start_ymd &"','"& i_end_ymd &"', '"
			strSql = strSql & INSURANCE_NOW &"','"& filePath &"','"& QUALIFICTION &"','"& QnA &"', '"
			strSql = strSql & license2 &"','"& license3 &"','"& license4 &"','"& license5 &"','"& license6 & "', '"
			strSql = strSql & license_no2 &"','"& license_no3 &"','"& license_no4 &"','"& license_no5 & "', '"& license_no6 & "','"
			strSql = strSql & health_flg &"');"

'          response.Write strSql
'		   response.End 

%>
 
<%
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
			intMsg = 2

		Case "upd" : 

 

				strSql = ""

				strSql = strSql & " UPDATE MO_HELPER SET "
				strSql = strSql & "		MD_HELPER_NAME ='"& hp_name &"' "
				strSql = strSql & "		,MD_HELPER_JUMIN1 ='"& jumin1 &"' "
				strSql = strSql & "		,MD_HELPER_JUMIN2 ='"& jumin2 &"' "
				strSql = strSql & "		,MD_HELPER_PHONE ='"& phone &"' "
				strSql = strSql & "		,MD_HELPER_HP ='"& hp &"' "
				strSql = strSql & "		,MD_HELPER_LOCAL ='"& class_value_1 &"' "
				strSql = strSql & "		,MD_HELPER_LOCAL_ORIGINAL ='"& title_value_1 &"' "
				strSql = strSql & "		,MD_HELPER_POST ='"& post &"' "
				strSql = strSql & "		,MD_HELPER_ADDR1 ='"& addr_1 &"' "
				strSql = strSql & "		,MD_HELPER_ADDR2 ='"& addr_2 &"' "
				strSql = strSql & "		,MD_HELPER_FLG ='"& hp_type &"' "
				strSql = strSql & "		,MD_HELPER_WORK_FLG ='"& hope_work &"' "
				strSql = strSql & "		,MD_HELPER_BANK ='"& bank &"' "
				strSql = strSql & "		,MD_HELPER_ACCOUNT ='"& account &"' "
				strSql = strSql & "		,MD_HELPER_ACCOUNT_NAME ='"& account_name &"' "
				strSql = strSql & "		,MD_HELPER_HOPE ='"& hp_hope &"' "
				strSql = strSql & "		,MD_HELPER_NEAR ='"& hp_near &"' "
				strSql = strSql & "		,MD_HELPER_EDU ='"& edu_org &"' "
				strSql = strSql & "		,MD_HELPER_DIPLOMA_NO ='"& dip_no &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE ='"& license1 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_NO ='"& license_no1 &"' "
				strSql = strSql & "		,MD_HELPER_RELIGION ='"& hp_riligion &"' "
				strSql = strSql & "		,MD_HELPER_INSURANCE_FLG ='"& INSURANCE_FLG &"' "
				strSql = strSql & "		,MD_HELPER_INSURANCE_NO ='"& INSURANCE_NO &"' "
				strSql = strSql & "		,MD_HELPER_INSURANCE_START ='"& i_start_ymd &"' "
				strSql = strSql & "		,MD_HELPER_INSURANCE_END ='"& i_end_ymd &"' "
				strSql = strSql & "		,MD_HELPER_INSURANCE_NOW_FLG ='"& INSURANCE_NOW &"' "
				strSql = strSql & "		,MD_HELPER_PICTURE ='"& filePath &"' "
				strSql = strSql & "		,MD_HELPER_QUALIFICTION ='"& QUALIFICTION &"' "
				strSql = strSql & "		,MD_HELPER_QnA ='"& QnA &"' "
 
				strSql = strSql & "		,MD_HELPER_LICENSE_1 ='"& license2 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_2 ='"& license3 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_3 ='"& license4 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_4 ='"& license5 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_5 ='"& license6 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_NO_1 ='"& license_no1 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_NO_2 ='"& license_no2 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_NO_3 ='"& license_no3 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_NO_4 ='"& license_no4 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_NO_5 ='"& license_no5 &"' "
				strSql = strSql & "		,MD_HELPER_HEALTH ='"& health_flg &"' "
 
				strSql = strSql & "	WHERE MD_HELPER_SEQ='"& hp_seq &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
	 
		
		Case "del" : 
 
				strSql = ""
				strSql = strSql & " delete from MO_HELPER  "
				strSql = strSql & "	WHERE MD_HELPER_SEQ ='"& hp_seq &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 4
 
	End Select 
%>
<script type="text/javascript">
	function Init(e) {
		switch(e) {
			case(1) :
				alert('�̿����� ������ �ּ���');
			break;
			case(2) :
				alert('���������� ��ϵǾ����ϴ�.');
				parent.location.href = "./helper_list.asp"
			break;
			case(3) :
				alert('���� ��ϵǾ����ϴ�.');
				parent.location.href = "./helper_list.asp"
			break;
			case(4) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "./helper_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>