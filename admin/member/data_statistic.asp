<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : ����Ȯ��
'�� �� �� : member_reser_list.asp
'�ۼ����� : 2014/04/12
'�� �� �� : �̼���
'-----------------------------------------------------------------------
'��������   ������  ��������
'=======================================================================
'
'======================================================================= 
%>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<HTML>
<HEAD>
	<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<script type="text/javascript" src="/common/js/Nwagon.js"></script>
	<script type="text/javascript" src="/common/js/Nwagon_no_vml.js"></script>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<link rel="stylesheet" type="text/css" href="/admin/common/css/style.css">
	<link type="text/css" rel="stylesheet" href="/admin/common/css/mega_admin2.css" />
	<link type="text/css" rel="stylesheet" href="/admin/common/css/Nwagon.css" />
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
	 <script type="text/javascript"
          src="https://www.google.com/jsapi?autoload={
            'modules':[{
              'name':'visualization',
              'version':'1',
              'packages':['corechart']
            }]
          }"></script>
</head>
<%
'---------------------------------------------------------

	page_type = fncRequest("pagetype")
'	Request
	Dim page_size : page_size = 10 
	page = fncRequest("page")
	If page = "" Then page = 1

	startNum = (page-1) * page_size
	endNum = startNum + page_size

	smode	= fncRequest("smode")
	sword	= fncRequest("sword")

	strDftUrl = "smode=" & smode
	strDftUrl = strDftUrl & "&sword=" & sword
'---------------------------------------------------------

	startNum = (page-1) * page_size
	endNum = startNum + page_size

'-----------------------------------------------------------------------------------

	Dim NowDate, NowYear, NowMonth, NowDay, NowHour, NowMinute, NowSecond

	'���糯¥
	NowDate = Date()    '2011-07-08

	'���� ��
	NowYear = Year(Date())    '2011

	'���� ��
	NowMonth = Month(Date())    '7
	NowMonth_2 = Month(Date())    '7
	month_1 = month(now) 


	'���� ��
	NowDay = Day(Date())    '8


	startY = fncRequest("startY")   
	startM = fncRequest("startM")   
	startD = fncRequest("startD")   

	endY = fncRequest("endY")   
	endM = fncRequest("endM")   
	endD = fncRequest("endD")  

	s_yyyy = fncRequest("startY")   
	s_mmmm = fncRequest("startM")   
	s_dddd = fncRequest("startD")   

	e_yyyy = fncRequest("endY")   
	e_mmmm = fncRequest("endM")   
	e_dddd = fncRequest("endD")  




	If NowYear <> "" And NowMonth <> ""   Then 
	StartYM = NowYear & fncSetNumber(NowMonth)  
	End If 
 
 
	If startY <> "" And startM <> "" And startD <> "" Then 
	StartYMD = startY & fncSetNumber(startM) & fncSetNumber(startD)
	End If 

	If endY <> "" And endM <> "" And endD <> "" Then 
	endYMD = endY & fncSetNumber(endM) & fncSetNumber(endD)
	End If 


	'::::::::::::::::::::::::::: �̹��� , ���� ���ϴ� ����

	strSql = ""
	strSql = strSql & " declare @as_ym varchar(6)   "
	strSql = strSql & " set @as_ym =  '"& StartYM &"' "
	strSql = strSql & " declare @stdt datetime, @endt datetime   "
	strSql = strSql & " declare @lstdt datetime, @lendt datetime   "
	strSql = strSql & " declare @rstdt datetime, @rendt datetime   "
	strSql = strSql & " select @stdt =convert( datetime, @as_ym + '01')   "
	strSql = strSql & " select @endt =convert( datetime, dateadd(day,-1,dateadd(month, 1, @as_ym + '01' )))   "
	strSql = strSql & " select @stdt, @endt   "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		month_first = Rs1(0) '�̹��� 1��
		month_end = Rs1(1)   '�̹��� ����
	End If   

	strSql = ""
	strSql = strSql & " declare @as_ym varchar(6)   "
	strSql = strSql & " set @as_ym =  '"& StartYM &"' "
	strSql = strSql & " declare @stdt datetime, @endt datetime   "
	strSql = strSql & " declare @lstdt datetime, @lendt datetime   "
	strSql = strSql & " declare @rstdt datetime, @rendt datetime   "
	strSql = strSql & " select @lendt =convert( datetime, dateadd(day,-1,'"& month_first &"'))   "
	strSql = strSql & " select @lstdt =convert( datetime, convert(char(6),@lendt,112 )+'01')  "
	strSql = strSql & " select @lstdt, @lendt   "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		month_before = Rs1(0)      '���� 1��
		month_before_end = Rs1(1) ' ���� ����
	End If   

arrNow_month = Split(month_first,"-")
arrNow_month_end = Split(month_end,"-")
now_YMD = arrNow_month(0) & arrNow_month(1) & arrNow_month(2)
now_end_YMD = arrNow_month_end(0) & arrNow_month_end(1) & arrNow_month_end(2)

arrBefore_month = Split(month_before,"-")
arrBefore_month_end = Split(month_before_end,"-")
Before_YMD = arrBefore_month(0) & arrBefore_month(1) & arrBefore_month(2)
Before_end_YMD = arrBefore_month_end(0) & arrBefore_month_end(1) & arrBefore_month_end(2)

%>
<script>
//alert("<%=now_YMD%>");alert("<%=now_end_YMD%>");alert("<%=Before_YMD%>");alert("<%=Before_end_YMD%>");
</script>

<%
'--------------------------------------------------------------------------------------------------------------
	'��ϻ�ǰ ����Ʈ
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

  '---------------------------------------------------------------------

	strTable = "   from  MO_RESERVATION     "
	strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MR_MEM_ID = MD_MEM_ID "

	
	strWhere = " WHERE MR_CNLKBN='N' order by MR_PAY_DT desc  "
	
	'strWhere = " WHERE MR_CNLKBN='N' and  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and  MR_SERVICE  like '%������%'  order by MR_PAY_DT desc  "

	If grpcd <> "" And grpcd <> "1" Then strWhere = strWhere & " AND MD_LOCAL = '"& grpcd &"' "
	If sword <> "" Then 
		Select Case smode
			Case "1" : strWhere = strWhere & "  AND MR_MEM_ID='"& sword &"' "
			Case "2" : strWhere = strWhere & "  AND MR_MEM_NM='"& sword &"' "
		End Select 
	End If 



 
'----------------------------------------------------------------------------------------------------------------------------'
'���� ��������-----------------------------------------------------------------------------------------------------------------------'
' type - 1 �����, type - 2 ����, type - 3 ���֡������,  
	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '������' and MO_DATA_TERM = '1��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		basic_1week_price = Rs1(0)
	End If   
	
	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '������' and MO_DATA_TERM = '2��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		basic_2week_price = Rs1(0)
	End If   

	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '������' and MO_DATA_TERM = '3��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		basic_3week_price = Rs1(0)
	End If   

	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '������' and MO_DATA_TERM = '4��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		basic_4week_price = Rs1(0)
	End If   
'----------------------------------------------------------------------------------------------------------------

	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '�����̾�' and MO_DATA_TERM = '1��' and MO_DATA_CATEGORY='�����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		pre_1_week_type_1_price = Rs1(0)
	End If   

	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '�����̾�' and MO_DATA_TERM = '2��' and MO_DATA_CATEGORY='�����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		pre_2_week_type_1_price = Rs1(0)
	End If  

	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '�����̾�' and MO_DATA_TERM = '3��' and MO_DATA_CATEGORY='�����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		pre_3_week_type_1_price = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '�����̾�' and MO_DATA_TERM = '4��' and MO_DATA_CATEGORY='�����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		pre_4_week_type_1_price = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '�����̾�' and MO_DATA_TERM = '1��' and MO_DATA_CATEGORY='����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		pre_1_week_type_2_price = Rs1(0)
	End If   

	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '�����̾�' and MO_DATA_TERM = '2��' and MO_DATA_CATEGORY='����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		pre_2_week_type_2_price = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '�����̾�' and MO_DATA_TERM = '3��' and MO_DATA_CATEGORY='����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		pre_3_week_type_2_price = Rs1(0)
	End If   

	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '�����̾�' and MO_DATA_TERM = '4��' and MO_DATA_CATEGORY='����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		pre_4_week_type_2_price = Rs1(0)
	End If   

'-----------------------------------------------------------------------------------------------------------------------------

	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = 'VIP' and MO_DATA_TERM = '2��' and MO_DATA_CATEGORY='�����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		vip_2_week_type_1_price = Rs1(0)
	End If  
	
	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = 'VIP' and MO_DATA_TERM = '3��' and MO_DATA_CATEGORY='�����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		vip_3_week_type_1_price = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = 'VIP' and MO_DATA_TERM = '4��' and MO_DATA_CATEGORY='�����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		vip_4_week_type_1_price = Rs1(0)
	End If
 
	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = 'VIP' and MO_DATA_TERM = '2��' and MO_DATA_CATEGORY='����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		vip_2_week_type_2_price = Rs1(0)
	End If
	
	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = 'VIP' and MO_DATA_TERM = '3��' and MO_DATA_CATEGORY='����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		vip_3_week_type_2_price = Rs1(0)
	End If   

	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = 'VIP' and MO_DATA_TERM = '4��' and MO_DATA_CATEGORY='����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		vip_4_week_type_2_price = Rs1(0)
	End If   

'-----------------------------------------------------------------------------------------------------------------------------

	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '�����̺�' and MO_DATA_TERM = '2��' and MO_DATA_CATEGORY='�����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		private_2_week_type_1_price = Rs1(0)
	End If  
	
	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '�����̺�' and MO_DATA_TERM = '3��' and MO_DATA_CATEGORY='�����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		private_3_week_type_1_price = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '�����̺�' and MO_DATA_TERM = '4��' and MO_DATA_CATEGORY='�����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		private_4_week_type_1_price = Rs1(0)
	End If

 
 
	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '�����̺�' and MO_DATA_TERM = '2��' and MO_DATA_CATEGORY='����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		private_2_week_type_2_price = Rs1(0)
	End If
	
	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '�����̺�' and MO_DATA_TERM = '3��' and MO_DATA_CATEGORY='����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		private_3_week_type_2_price = Rs1(0)
	End If   
	

	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '�����̺�' and MO_DATA_TERM = '4��' and MO_DATA_CATEGORY='����' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		private_4_week_type_2_price = Rs1(0)
	End If   

'-----------------------------------------------------------------------------------------------------------------------------


	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '��ŷ��' and MO_DATA_TERM = '4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		wkm_4_week_type_2_price = Rs1(0)
	End If   

	
	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '��ü��' and MO_DATA_TERM = '4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		kg_4_week_type_2_price = Rs1(0)
	End If   

	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '35���̻�' and MO_DATA_TERM = '4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		age_35_4_week_type_2_price = Rs1(0)
	End If   


	strSql = ""
	strSql = strSql & " SELECT   "
	strSql = strSql & " MO_DATA_PRICE from MO_DATA " 
	strSql = strSql & " where MO_DATA_NAME = '������������������' and MO_DATA_TERM = '4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		home_4_week_type_2_price = Rs1(0)
	End If   


' -::::::::::::::::::::::::::::::::::::::::::::::::::::���� ��:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


'2014 �Ǽ� ' ----------------------------------------------------------------------------------------------------------------------

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '20140101' and  MR_PAY_DT  < '20141231' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_basic = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '20140101' and  MR_PAY_DT < '20141231' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_pre = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '20140101' and  MR_PAY_DT  < '20141231' and  MR_SERVICE  like '%VIP%'and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_vip = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '20140101' and  MR_PAY_DT  < '20141231' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_private = Rs1(0)
	End If
	
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '20140101' and  MR_PAY_DT < '20141231' and  MR_SERVICE  like '%�ٵ����ɾ�%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_da = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '20140101' and  MR_PAY_DT  < '20141231' and  MR_SERVICE  like '%��ŷ��%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_wor = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '20140101' and  MR_PAY_DT  < '20141231' and  MR_SERVICE  like '%��ü��%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_kg = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '20140101' and  MR_PAY_DT < '20141231' and  MR_SERVICE  like '%35���̻�%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_35 = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &" where MR_PAY_DT > '20140101' and  MR_PAY_DT < '20141231' and MR_SERVICE like '%������������ ����%' and MR_PAY_STATE='�����Ϸ�' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_home = Rs1(0)
	End If


	'2014��:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::--------------------------------------
	'2015 �Ǽ� ' :::::::::::::::::::::::::::::-----------------------------------------------------------------------------------------
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231'   and MR_PAY_STATE='�����Ϸ�' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		total_int_basic_2015 = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_basic_2015 = Rs1(0)
	End If 
	
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�'  and MR_PERIOD='1��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_basic_2015_1w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�'  and MR_PERIOD='2��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_basic_2015_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�'  and MR_PERIOD='3��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_basic_2015_3w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�'  and MR_PERIOD='4��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_basic_2015_4w = Rs1(0)
	End If 


	
	'-------------------------------------------------------------------------------------------------------------------------------------
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '20150101' and  MR_PAY_DT < '20151231' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_pre_2015 = Rs1(0)
	End If 
 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '20150101' and  MR_PAY_DT < '20151231' and  MR_SERVICE like '%�����̾�%'  and MR_PAY_STATE='�����Ϸ�'	and MR_TYPE like '%�����%'  and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_pre_2015_type_1_4w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '20150101' and  MR_PAY_DT < '20151231' and  MR_SERVICE like '%�����̾�%'  and MR_PAY_STATE='�����Ϸ�'	and MR_TYPE like '%�����%'  and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_pre_2015_type_1_3w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '20150101' and  MR_PAY_DT < '20151231' and  MR_SERVICE like '%�����̾�%'  and MR_PAY_STATE='�����Ϸ�'	and MR_TYPE like '%�����%'  and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_pre_2015_type_1_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '20150101' and  MR_PAY_DT < '20151231' and  MR_SERVICE like '%�����̾�%'  and MR_PAY_STATE='�����Ϸ�'	and MR_TYPE like '%�����%'  and MR_PERIOD='1��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_pre_2015_type_1_1w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '20150101' and  MR_PAY_DT < '20151231' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����'  and MR_PERIOD='1��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_pre_2015_type_2_1w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '20150101' and  MR_PAY_DT < '20151231' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����'  and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_pre_2015_type_2_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '20150101' and  MR_PAY_DT < '20151231' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����'  and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_pre_2015_type_2_3w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '20150101' and  MR_PAY_DT < '20151231' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����'  and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_pre_2015_type_2_4w = Rs1(0)
	End If 

'------------------------------------------------------------------------------------------------------------------------------------------

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and  MR_SERVICE  like '%VIP%' and MR_PAY_STATE= '�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_vip_2015 = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and  MR_SERVICE  like '%VIP%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE like '%�����%' and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_vip_2015_type_1_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and  MR_SERVICE  like '%VIP%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE like '%�����%' and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_vip_2015_type_1_3w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and  MR_SERVICE  like '%VIP%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE like '%�����%' and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_vip_2015_type_1_4w = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and  MR_SERVICE  like '%VIP%'and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����' and MR_PERIOD='2��'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_vip_2015_type_2_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and  MR_SERVICE  like '%VIP%'and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����' and MR_PERIOD= '3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_vip_2015_type_2_3w = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and  MR_SERVICE  like '%VIP%'and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����' and MR_PERIOD = '4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_vip_2015_type_2_4w = Rs1(0)
	End If 

'-------------------------------------------------------------------------------------------------------------------------------------------
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE='�����Ϸ�' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_private_2015 = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE='�����Ϸ�'  and MR_TYPE like '%�����%' and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_private_2015_type_1_2w = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE='�����Ϸ�'  and MR_TYPE like '%�����%' and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_private_2015_type_1_3w = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE='�����Ϸ�'  and MR_TYPE like '%�����%' and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_private_2015_type_1_4w = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE= '�����Ϸ�'  and MR_TYPE = '����'  and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_private_2015_type_2_2w = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE= '�����Ϸ�'  and MR_TYPE = '����'  and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_private_2015_type_2_3w = Rs1(0)
	End If


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE= '�����Ϸ�'  and MR_TYPE = '����'  and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_private_2015_type_2_4w = Rs1(0)
	End If






	'-------------------------------------------------------------------------------------------------------------------------------
	
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '20150101' and  MR_PAY_DT < '20151231' and  MR_SERVICE  like '%�ٵ���%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_da_2015 = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '20150101' and  MR_PAY_DT  < '20151231' and  MR_SERVICE  like '%��ŷ��%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_wor_2015 = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '20150101' and  MR_PAY_DT  < '20151231' and  MR_SERVICE  like '%��ü��%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_kg_2015 = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '20150101' and  MR_PAY_DT < '20151231' and  MR_SERVICE  like '%35���̻�%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_35_2015 = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &" where MR_PAY_DT > '20150101' and  MR_PAY_DT < '20151231' and MR_SERVICE like '%������������ ����%' and MR_PAY_STATE='�����Ϸ�' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_home_2015 = Rs1(0)
	End If

	'2015�� -------------------------------------------------------------------------------------------------------------------------

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' �˻� ���� ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

'2015 �Ǽ� ' ------------------------------------------------------------------------------------------------------------------------
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"'   and MR_PAY_STATE='�����Ϸ�' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_total_int_basic_2015 = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_basic_2015 = Rs1(0)
	End If 
	
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�'  and MR_PERIOD='1��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_basic_2015_1w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�'  and MR_PERIOD='2��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_basic_2015_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�'  and MR_PERIOD='3��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_basic_2015_3w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�'  and MR_PERIOD='4��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_basic_2015_4w = Rs1(0)
	End If 


	
	'-------------------------------------------------------------------------------------------------------------------------------------
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '"& StartYMD &"' and  MR_PAY_DT < '"& endYMD &"' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_pre_2015 = Rs1(0)
	End If 
 
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& StartYMD &"' and  MR_PAY_DT < '"& endYMD &"' and  MR_SERVICE like '%�����̾�%'  and MR_PAY_STATE='�����Ϸ�'	and MR_TYPE like '%�����%'  and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_pre_2015_type_1_4w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& StartYMD &"' and  MR_PAY_DT < '"& endYMD &"' and  MR_SERVICE like '%�����̾�%'  and MR_PAY_STATE='�����Ϸ�'	and MR_TYPE like '%�����%'  and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_pre_2015_type_1_3w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& StartYMD &"' and  MR_PAY_DT < '"& endYMD &"' and  MR_SERVICE like '%�����̾�%'  and MR_PAY_STATE='�����Ϸ�'	and MR_TYPE like '%�����%'  and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_pre_2015_type_1_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& StartYMD &"' and  MR_PAY_DT < '"& endYMD &"' and  MR_SERVICE like '%�����̾�%'  and MR_PAY_STATE='�����Ϸ�'	and MR_TYPE like '%�����%'  and MR_PERIOD='1��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_pre_2015_type_1_1w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '"& StartYMD &"' and  MR_PAY_DT < '"& endYMD &"' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����'  and MR_PERIOD='1��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_pre_2015_type_2_1w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '"& StartYMD &"' and  MR_PAY_DT < '"& endYMD &"' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����'  and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_pre_2015_type_2_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '"& StartYMD &"' and  MR_PAY_DT < '"& endYMD &"' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����'  and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_pre_2015_type_2_3w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '"& StartYMD &"' and  MR_PAY_DT < '"& endYMD &"' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����'  and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_pre_2015_type_2_4w = Rs1(0)
	End If 

'------------------------------------------------------------------------------------------------------------------------------------------

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and  MR_SERVICE  like '%VIP%' and MR_PAY_STATE= '�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_vip_2015 = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and  MR_SERVICE  like '%VIP%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE like '%�����%' and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_vip_2015_type_1_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and  MR_SERVICE  like '%VIP%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE like '%�����%' and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_vip_2015_type_1_3w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and  MR_SERVICE  like '%VIP%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE like '%�����%' and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_vip_2015_type_1_4w = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and  MR_SERVICE  like '%VIP%'and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����' and MR_PERIOD='2��'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_vip_2015_type_2_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and  MR_SERVICE  like '%VIP%'and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����' and MR_PERIOD= '3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_vip_2015_type_2_3w = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and  MR_SERVICE  like '%VIP%'and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����' and MR_PERIOD = '4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_vip_2015_type_2_4w = Rs1(0)
	End If 

'-------------------------------------------------------------------------------------------------------------------------------------------
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE='�����Ϸ�' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		int_private_2015 = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE='�����Ϸ�'  and MR_TYPE like '%�����%' and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_private_2015_type_1_2w = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE='�����Ϸ�'  and MR_TYPE like '%�����%' and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_private_2015_type_1_3w = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE='�����Ϸ�'  and MR_TYPE like '%�����%' and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_private_2015_type_1_4w = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE= '�����Ϸ�'  and MR_TYPE = '����'  and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_private_2015_type_2_2w = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE= '�����Ϸ�'  and MR_TYPE = '����'  and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_private_2015_type_2_3w = Rs1(0)
	End If


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE= '�����Ϸ�'  and MR_TYPE = '����'  and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_private_2015_type_2_4w = Rs1(0)
	End If


	'-------------------------------------------------------------------------------------------------------------------------------
	
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& StartYMD &"' and  MR_PAY_DT < '"& endYMD &"' and  MR_SERVICE  like '%�ٵ���%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_da_2015 = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and  MR_SERVICE  like '%��ŷ��%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_wor_2015 = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& StartYMD &"' and  MR_PAY_DT  < '"& endYMD &"' and  MR_SERVICE  like '%��ü��%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_kg_2015 = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& StartYMD &"' and  MR_PAY_DT < '"& endYMD &"' and  MR_SERVICE  like '%35���̻�%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_35_2015 = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &" where MR_PAY_DT > '"& StartYMD &"' and  MR_PAY_DT < '"& endYMD &"' and MR_SERVICE like '%������������ ����%' and MR_PAY_STATE='�����Ϸ�' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		search_int_home_2015 = Rs1(0)
	End If

	'�� �� �� -----------------------------------------------------------------------------------------------------------------------



':::::::::::::::::;	:::::::::::::::::::::::::::::::::::::::::::: �̹��� :::::::::::::::::::::::::::::::::::::::::::::::::::::::
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

'�̹��� �Ǽ� ' ------------------------------------------------------------------------------------------------------------------------
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"'   and MR_PAY_STATE='�����Ϸ�' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_total_int_basic_2015 = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_basic_2015 = Rs1(0)
	End If 
	
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�'  and MR_PERIOD='1��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_basic_2015_1w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�'  and MR_PERIOD='2��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_basic_2015_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�'  and MR_PERIOD='3��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_basic_2015_3w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�'  and MR_PERIOD='4��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_basic_2015_4w = Rs1(0)
	End If 


	
	'-------------------------------------------------------------------------------------------------------------------------------------
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '"& now_YMD &"' and  MR_PAY_DT < '"& now_end_YMD &"' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_pre_2015 = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& now_YMD &"' and  MR_PAY_DT < '"& now_end_YMD &"' and  MR_SERVICE like '%�����̾�%'  and MR_PAY_STATE='�����Ϸ�'	and MR_TYPE like '%�����%'  and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_pre_2015_type_1_4w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& now_YMD &"' and  MR_PAY_DT < '"& now_end_YMD &"' and  MR_SERVICE like '%�����̾�%'  and MR_PAY_STATE='�����Ϸ�'	and MR_TYPE like '%�����%'  and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_pre_2015_type_1_3w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& now_YMD &"' and  MR_PAY_DT < '"& now_end_YMD &"' and  MR_SERVICE like '%�����̾�%'  and MR_PAY_STATE='�����Ϸ�'	and MR_TYPE like '%�����%'  and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_pre_2015_type_1_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& now_YMD &"' and  MR_PAY_DT < '"& now_end_YMD &"' and  MR_SERVICE like '%�����̾�%'  and MR_PAY_STATE='�����Ϸ�'	and MR_TYPE like '%�����%'  and MR_PERIOD='1��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_pre_2015_type_1_1w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '"& now_YMD &"' and  MR_PAY_DT < '"& now_end_YMD &"' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����'  and MR_PERIOD='1��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_pre_2015_type_2_1w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '"& now_YMD &"' and  MR_PAY_DT < '"& now_end_YMD &"' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����'  and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_pre_2015_type_2_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '"& now_YMD &"' and  MR_PAY_DT < '"& now_end_YMD &"' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����'  and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_pre_2015_type_2_3w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '"& now_YMD &"' and  MR_PAY_DT < '"& now_end_YMD &"' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����'  and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_pre_2015_type_2_4w = Rs1(0)
	End If 

'------------------------------------------------------------------------------------------------------------------------------------------

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and  MR_SERVICE  like '%VIP%' and MR_PAY_STATE= '�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_vip_2015 = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and  MR_SERVICE  like '%VIP%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE like '%�����%' and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_vip_2015_type_1_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and  MR_SERVICE  like '%VIP%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE like '%�����%' and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_vip_2015_type_1_3w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and  MR_SERVICE  like '%VIP%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE like '%�����%' and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_vip_2015_type_1_4w = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and  MR_SERVICE  like '%VIP%'and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����' and MR_PERIOD='2��'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_vip_2015_type_2_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and  MR_SERVICE  like '%VIP%'and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����' and MR_PERIOD= '3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_vip_2015_type_2_3w = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and  MR_SERVICE  like '%VIP%'and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����' and MR_PERIOD = '4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_vip_2015_type_2_4w = Rs1(0)
	End If 

'-------------------------------------------------------------------------------------------------------------------------------------------
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE='�����Ϸ�' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_private_2015 = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE='�����Ϸ�'  and MR_TYPE like '%�����%' and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_private_2015_type_1_2w = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE='�����Ϸ�'  and MR_TYPE like '%�����%' and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_private_2015_type_1_3w = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE='�����Ϸ�'  and MR_TYPE like '%�����%' and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_private_2015_type_1_4w = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE= '�����Ϸ�'  and MR_TYPE = '����'  and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_private_2015_type_2_2w = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE= '�����Ϸ�'  and MR_TYPE = '����'  and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_private_2015_type_2_3w = Rs1(0)
	End If


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE= '�����Ϸ�'  and MR_TYPE = '����'  and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_private_2015_type_2_4w = Rs1(0)
	End If


	'-------------------------------------------------------------------------------------------------------------------------------
	
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& now_YMD &"' and  MR_PAY_DT < '"& now_end_YMD &"' and  MR_SERVICE  like '%�ٵ���%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_da_2015 = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and  MR_SERVICE  like '%��ŷ��%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_wor_2015 = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& now_YMD &"' and  MR_PAY_DT  < '"& now_end_YMD &"' and  MR_SERVICE  like '%��ü��%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_kg_2015 = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& now_YMD &"' and  MR_PAY_DT < '"& now_end_YMD &"' and  MR_SERVICE  like '%35���̻�%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_35_2015 = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &" where MR_PAY_DT > '"& now_YMD &"' and  MR_PAY_DT < '"& now_end_YMD &"' and MR_SERVICE like '%������������ ����%' and MR_PAY_STATE='�����Ϸ�' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		thismonth_int_home_2015 = Rs1(0)
	End If

	'�̹��� �� -----------------------------------------------------------------------------------------------------------------------




''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''::::::::::::::::: ���� ::::::::::::::::::::'''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
' �Ǽ� ' ------------------------------------------------------------------------------------------------------------------------
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"'   and MR_PAY_STATE='�����Ϸ�' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_total_int_basic_2015 = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_basic_2015 = Rs1(0)
	End If 
	
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�'  and MR_PERIOD='1��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_basic_2015_1w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�'  and MR_PERIOD='2��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_basic_2015_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�'  and MR_PERIOD='3��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_basic_2015_3w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and MR_SERVICE like '%������%' and MR_PAY_STATE='�����Ϸ�'  and MR_PERIOD='4��'  "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_basic_2015_4w = Rs1(0)
	End If  
	'-------------------------------------------------------------------------------------------------------------------------------------
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_pre_2015 = Rs1(0)
	End If  

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE like '%�����̾�%'  and MR_PAY_STATE='�����Ϸ�'	and MR_TYPE like '%�����%'  and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_pre_2015_type_1_4w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE like '%�����̾�%'  and MR_PAY_STATE='�����Ϸ�'	and MR_TYPE like '%�����%'  and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_pre_2015_type_1_3w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE like '%�����̾�%'  and MR_PAY_STATE='�����Ϸ�'	and MR_TYPE like '%�����%'  and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_pre_2015_type_1_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE like '%�����̾�%'  and MR_PAY_STATE='�����Ϸ�'	and MR_TYPE like '%�����%'  and MR_PERIOD='1��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_pre_2015_type_1_1w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����'  and MR_PERIOD='1��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_pre_2015_type_2_1w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����'  and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_pre_2015_type_2_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����'  and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_pre_2015_type_2_3w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE like '%�����̾�%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����'  and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_pre_2015_type_2_4w = Rs1(0)
	End If 

'------------------------------------------------------------------------------------------------------------------------------------------

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE  like '%VIP%' and MR_PAY_STATE= '�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_vip_2015 = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE  like '%VIP%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE like '%�����%' and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_vip_2015_type_1_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE  like '%VIP%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE like '%�����%' and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_vip_2015_type_1_3w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE  like '%VIP%' and MR_PAY_STATE='�����Ϸ�' and MR_TYPE like '%�����%' and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_vip_2015_type_1_4w = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE  like '%VIP%'and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����' and MR_PERIOD='2��'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_vip_2015_type_2_2w = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE  like '%VIP%'and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����' and MR_PERIOD= '3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_vip_2015_type_2_3w = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE  like '%VIP%'and MR_PAY_STATE='�����Ϸ�' and MR_TYPE = '����' and MR_PERIOD = '4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_vip_2015_type_2_4w = Rs1(0)
	End If 

'-------------------------------------------------------------------------------------------------------------------------------------------
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE='�����Ϸ�' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_private_2015 = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE='�����Ϸ�'  and MR_TYPE like '%�����%' and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_private_2015_type_1_2w = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE='�����Ϸ�'  and MR_TYPE like '%�����%' and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_private_2015_type_1_3w = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE='�����Ϸ�'  and MR_TYPE like '%�����%' and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_private_2015_type_1_4w = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE= '�����Ϸ�'  and MR_TYPE = '����'  and MR_PERIOD='2��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_private_2015_type_2_2w = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE= '�����Ϸ�'  and MR_TYPE = '����'  and MR_PERIOD='3��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_private_2015_type_2_3w = Rs1(0)
	End If


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT  > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE  like '%�����̺�%' and MR_PAY_STATE= '�����Ϸ�'  and MR_TYPE = '����'  and MR_PERIOD='4��' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_private_2015_type_2_4w = Rs1(0)
	End If


	'-------------------------------------------------------------------------------------------------------------------------------
	
	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE  like '%�ٵ���%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_da_2015 = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &  " where  MR_PAY_DT > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE  like '%��ŷ��%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_wor_2015 = Rs1(0)
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE  like '%��ü��%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_kg_2015 = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql & " where  MR_PAY_DT > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and  MR_SERVICE  like '%35���̻�%' and MR_PAY_STATE='�����Ϸ�'"
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_35_2015 = Rs1(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable   
	strSql = strSql &" where MR_PAY_DT > '"& Before_YMD &"' and  MR_PAY_DT  < '"& Before_end_YMD &"' and MR_SERVICE like '%������������ ����%' and MR_PAY_STATE='�����Ϸ�' "
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		beforemonth_int_home_2015 = Rs1(0)
	End If

	'������ �� -----------------------------------------------------------------------------------------------------------------------



	'2015 �� ���� -----------------------------------------------------------------------------------------------------------------



	'------------------------------------------------------------------------------------------------------------------------------
%>

<%
 
	strSql = ""
	strSql = strSql & " ;SELECT  	"
	strSql = strSql & "   MR_SERVICE "
	strSql = strSql & "  ,MR_PERIOD "
	strSql = strSql & "  ,MR_FAMILY "
	strSql = strSql & "  ,MR_TYPE "
	strSql = strSql & "  ,MR_PAY_STATE "
	strSql = strSql & "  ,MR_PAY_DT "
	strSql = strSql & "  ,SUBSTRING(MR_PERIOD, 1, 1) as MR_PERIOD_INT "
	strSql = strSql & "  ,SUBSTRING(MR_TYPE, 7, 1)  as  MR_TYPE_INT "
 
	strSql = strSql & strTable
	strSql = strSql & strWhere
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		service_week = Rs(6)
		arrList = Rs.GetRows()
		

	End If 
	Call DBClose(Rs) 
 %>
<%
	'-----------------------------------------------------------------------------

 
'	�԰���� ȣ��
	strSql = " select MD_GIFT_SEQ, MD_GIFT_EA from MO_RESERVATION_GIFT_NOW_EA "
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		in_MD_GIFT_SEQ = Rs(0)
		arrProdt_in_ea = Rs(1)
		arrIn = Rs.getRows()
	End If 
	Call RSClose(Rs)


 
'-----------------------------------------------------------------------------
 
'-----------------------------------------------------------------------------
'	��� ���� ȣ��
	strSql = " select MD_GIFT_SEQ, MD_GIFT_OUT_EA from MO_RESERVATION_GIFT_OUT "
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		out_MD_GIFT_SEQ = Rs(0)
		arrProdt_out_ea = Rs(1)
		arrOut = Rs.getRows()
	End If 
	Call RSClose(Rs)

'-----------------------------------------------------------------------------
 

%>

<%
 '2015 �� ��ǰ�� ����
	strSql = ""
	strSql = strSql & " ;SELECT  	"
	strSql = strSql & "   MR_SERVICE "
	strSql = strSql & "  ,MR_PERIOD "
	strSql = strSql & "  ,MR_FAMILY "
	strSql = strSql & "  ,MR_TYPE "
	strSql = strSql & "  ,MR_PAY_STATE "
	strSql = strSql & "  ,MR_PAY_DT "
	strSql = strSql & "  ,SUBSTRING(MR_PERIOD, 1, 1) as MR_PERIOD_INT "
	strSql = strSql & "  ,SUBSTRING(MR_TYPE, 7, 1)  as  MR_TYPE_INT "
 
	strSql = strSql &"  from  MO_RESERVATION            "
	strSql = strSql &"  where  MR_PAY_DT  > '20150101' and  MR_PAY_DT  < '20151231' and  MR_SERVICE  like '%������%'  order by MR_PAY_DT desc "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		service_week = Rs(6)
		arrList_basic = Rs.GetRows()
		

	End If 
	Call DBClose(Rs) 
%> 
 
 
<body>
	<div id="container">
		<div class="linemap">�����غ��̺� > ȸ������ > <strong>���</strong></div>

 
		<div class="write">
			<form id="sFrm" name="sFrm" method="get" action="./data_statistic.asp">
			<input type="hidden" name="brd_id" value="<%=brd_id%>">
			<div class="selection">
				���� : 
					<select name="startY" valid="E|A=�⵵�� ������ �ּ���">
						<option value="">��</option>
					<% For num=Year(Date()) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,s_yyyy)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="startM" valid="E|A=���� ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,s_mmmm)%>><%=num%>��</option>
					<% Next %>
					</select>
					<select name="startD" valid="E|A=���� ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,s_mmmm)%>><%=num%>��</option>
					<% Next %>
					</select>
				&nbsp;&nbsp;���� :
					<select name="endY" valid="E|A=�⵵�� ������ �ּ���">
						<option value="">��</option>
					<% For num=Year(Date()) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,e_yyyy)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="endM" valid="E|A=���� ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,e_mmmm)%>><%=num%>��</option>
					<% Next %>
					</select>
					<select name="endD" valid="E|A=���� ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,e_dddd)%>><%=num%>��</option>
					<% Next %>
					</select>
				<!--
				<select name="smode" class="box">
					<option value="">�˻� ����</option>
					<option value="1" <%=fncSetSelectBox(smode,"1")%>>ȸ��ID</option>
					<option value="2" <%=fncSetSelectBox(smode,"2")%>>ȸ����</option>
				</select>
				-->
				<!--input type="text" name="sword" size="40" maxlength="40" value="<%=sword%>"/-->
				<a onClick="jQuery('#sFrm').submit();" style="cursor:pointer;" class="button">�� ��</a> <span style="margin-left:20px;">
				</span>

				<a onClick="location.href='./data_list.asp';" style="cursor:pointer;" class="button">���񽺸��</a>
				<a onClick="location.href='./data_add_list.asp';" style="cursor:pointer;" class="button">�߰������</a>
				<a onClick="location.href='./data_statistic.asp';" style="cursor:pointer;" class="button">�����Ȳ</a>
				<span style="margin-left:20px;"></span>
				<span style="margin-left:20px;">
					<a onClick="location.href='./data_ins.asp'" style="cursor:pointer;" class="button">���񽺵��</a>
				</span>
				<!--span style="margin-left:20px;">
					<a onClick="location.href='./reservation_gift_out_ins.asp'" style="cursor:pointer;" class="button">�����</a>
				</span-->
				<span style="margin-left:20px;">
					<a onClick="location.href='./data_add_ins.asp'" style="cursor:pointer;" class="button">�߰������</a>
				</span>
			</div>
			</form>
			<br /> 
			<table class="tb_style01">
			<colgroup>
			<col width="3%" />
			 
			<col />
			<col width="20%" />
			<col width="15%" />
			</colgroup>
			<thead>
			<tr>
 
				 
			</tr>
			</thead>
			<tbody>
			<center>

<%

basic_tot_2014 = int_basic * basic_1week_price

basic_1w = int_basic_2015_1w * basic_1week_price
basic_2w = int_basic_2015_2w * basic_2week_price
basic_3w = int_basic_2015_3w * basic_3week_price
basic_4w = int_basic_2015_4w * basic_4week_price

search_basic_1w = search_int_basic_2015_1w * basic_1week_price
search_basic_2w = search_int_basic_2015_2w * basic_2week_price
search_basic_3w = search_int_basic_2015_3w * basic_3week_price
search_basic_4w = search_int_basic_2015_4w * basic_4week_price

basic_tot_2015 = basic_1w + basic_2w + basic_3w + basic_4w
search_basic_tot_2015 = search_basic_1w + search_basic_2w + search_basic_3w + search_basic_4w






premium_tot_2014 = int_pre * pre_1_week_type_1_price

premium_1w = int_pre_2015_type_1_1w * pre_1_week_type_1_price
premium_2w = int_pre_2015_type_1_2w * pre_2_week_type_1_price
premium_3w = int_pre_2015_type_1_3w * pre_3_week_type_1_price
premium_4w = int_pre_2015_type_1_4w * pre_4_week_type_1_price

premium_1w_t2 = int_pre_2015_type_2_1w * pre_1_week_type_2_price
premium_2w_t2 = int_pre_2015_type_2_1w * pre_2_week_type_2_price
premium_3w_t2 = int_pre_2015_type_2_1w * pre_3_week_type_2_price
premium_4w_t2 = int_pre_2015_type_2_1w * pre_4_week_type_2_price


search_premium_1w = search_int_pre_2015_type_1_1w * pre_1_week_type_1_price
search_premium_2w = search_int_pre_2015_type_1_2w * pre_2_week_type_1_price
search_premium_3w = search_int_pre_2015_type_1_3w * pre_3_week_type_1_price
search_premium_4w = search_int_pre_2015_type_1_4w * pre_4_week_type_1_price

search_premium_1w_t2 = search_int_pre_2015_type_2_1w * pre_1_week_type_2_price
search_premium_2w_t2 = search_int_pre_2015_type_2_1w * pre_2_week_type_2_price
search_premium_3w_t2 = search_int_pre_2015_type_2_1w * pre_3_week_type_2_price
search_premium_4w_t2 = search_int_pre_2015_type_2_1w * pre_4_week_type_2_price


premium_tot_2015 = premium_1w + premium_2w + premium_3w + premium_4w + premium_1w_t2 + premium_2w_t2 + premium_3w_t2 + premium_4w_t2
search_premium_tot_2015 = search_premium_1w + search_premium_2w + search_premium_3w + search_premium_4w + search_premium_1w_t2 + search_premium_2w_t2 + search_premium_3w_t2 + search_premium_4w_t2








vip_tot_2014 = int_vip * basic_1week_price

vip_2w = int_vip_2015_type_1_2w * vip_2_week_type_1_price
vip_3w = int_vip_2015_type_1_3w * vip_3_week_type_1_price
vip_4w = int_vip_2015_type_1_4w * vip_4_week_type_1_price

vip_2w_t2 = int_vip_2015_type_2_2w * vip_2_week_type_2_price
vip_3w_t2 = int_vip_2015_type_2_3w * vip_3_week_type_2_price
vip_4w_t2 = int_vip_2015_type_2_4w * vip_4_week_type_2_price


search_vip_2w = search_int_vip_2015_type_1_2w * vip_2_week_type_1_price
search_vip_3w = search_int_vip_2015_type_1_3w * vip_3_week_type_1_price
search_vip_4w = search_int_vip_2015_type_1_4w * vip_4_week_type_1_price

search_vip_2w_t2 = search_int_vip_2015_type_2_2w * vip_2_week_type_2_price
search_vip_3w_t2 = search_int_vip_2015_type_2_3w * vip_3_week_type_2_price
search_vip_4w_t2 = search_int_vip_2015_type_2_4w * vip_4_week_type_2_price

vip_tot_2015 = vip_2w + vip_3w + vip_4w + vip_2w_t2 + vip_3w_t2 + vip_4w_t2
search_vip_tot_2015 = search_vip_2w + search_vip_3w + search_vip_4w + search_vip_2w_t2 + search_vip_3w_t2 + search_vip_4w_t2








private_tot_2014 = int_private * basic_1week_price

private_2w	= int_private_2015_type_1_2w * private_2_week_type_1_price
private_3w	= int_private_2015_type_1_3w * private_3_week_type_1_price
private_4w	= int_private_2015_type_1_4w * private_4_week_type_1_price

private_2w_t2 = int_private_2015_type_2_2w * private_2_week_type_2_price
private_3w_t2 = int_private_2015_type_2_3w * private_3_week_type_2_price
private_4w_t2 = int_private_2015_type_2_4w * private_4_week_type_2_price



search_private_2w	= search_int_private_2015_type_1_2w * private_2_week_type_1_price
search_private_3w	= search_int_private_2015_type_1_3w * private_3_week_type_1_price
search_private_4w	= search_int_private_2015_type_1_4w * private_4_week_type_1_price

search_private_2w_t2 = search_int_private_2015_type_2_2w * private_2_week_type_2_price
search_private_3w_t2 = search_int_private_2015_type_2_3w * private_3_week_type_2_price
search_private_4w_t2 = search_int_private_2015_type_2_4w * private_4_week_type_2_price


private_tot_2015 =  private_2w + private_3w + private_4w + private_2w_t2 + private_3w_t2 + private_4w_t2
search_private_tot_2015 =  search_private_2w + search_private_3w + search_private_4w + search_private_2w_t2 + search_private_3w_t2 + search_private_4w_t2



da_tot_2014 = int_da * 0
da_tot_2015 = int_da_2015 * 0

search_da_tot_2014 = search_int_da * 0
search_da_tot_2015 = search_int_da_2015 * 0



working_tot_2014 = int_wor * wkm_4_week_type_2_price
working_tot_2015 = int_wor_2015 * wkm_4_week_type_2_price

search_working_tot_2014 = search_int_wor * wkm_4_week_type_2_price
search_working_tot_2015 = search_int_wor_2015 * wkm_4_week_type_2_price



kg_tot_2014 = int_kg * kg_4_week_type_2_price
kg_tot_2015 = int_kg_2015 * kg_4_week_type_2_price


search_kg_tot_2014 = search_int_kg * kg_4_week_type_2_price
search_kg_tot_2015 = search_int_kg_2015 * kg_4_week_type_2_price




tot_35_2014 = int_35 * age_35_4_week_type_2_price
tot_35_2015 = int_35_2015 * age_35_4_week_type_2_price

search_tot_35_2014 = search_int_35 * age_35_4_week_type_2_price
search_tot_35_2015 = search_int_35_2015 * age_35_4_week_type_2_price




home_tot_2014 = int_home * home_4_week_type_2_price
home_tot_2015 = int_home_2015 * home_4_week_type_2_price

search_home_tot_2014 = search_int_home * home_4_week_type_2_price
search_home_tot_2015 = search_int_home_2015 * home_4_week_type_2_price




total_2014 = basic_tot_2014 + premium_tot_2014 + vip_tot_2014 + private_tot_2014 + da_tot_2014 + working_tot_2014 + kg_tot_2014 + tot_35_2014 + home_tot_2014

total_2015 = basic_tot_2015 + premium_tot_2015 + vip_tot_2015 + private_tot_2015 + da_tot_2015 + working_tot_2015 + kg_tot_2015 + tot_35_2015 + home_tot_2015


search_total_2015 = search_basic_tot_2015 + search_premium_tot_2015 + search_vip_tot_2015 + search_private_tot_2015 + search_da_tot_2015 + search_working_tot_2015 + search_kg_tot_2015 + search_tot_35_2015 + search_home_tot_2015




'':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: �̹��� ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


this_month_basic_1w = thismonth_int_basic_2015_1w * basic_1week_price
this_month_basic_2w = thismonth_int_basic_2015_2w * basic_2week_price
this_month_basic_3w = thismonth_int_basic_2015_3w * basic_3week_price
this_month_basic_4w = thismonth_int_basic_2015_4w * basic_4week_price

this_month_basic_tot = this_month_basic_1w + this_month_basic_2w + this_month_basic_3w + this_month_basic_4w
  
 
 
this_month_premium_1w = thismonth_int_pre_2015_type_1_1w * pre_1_week_type_1_price
this_month_premium_2w = thismonth_int_pre_2015_type_1_2w * pre_2_week_type_1_price
this_month_premium_3w = thismonth_int_pre_2015_type_1_3w * pre_3_week_type_1_price
this_month_premium_4w = thismonth_int_pre_2015_type_1_4w * pre_4_week_type_1_price

this_month_premium_1w_t2 = thismonth_int_pre_2015_type_2_1w * pre_1_week_type_2_price
this_month_premium_2w_t2 = thismonth_int_pre_2015_type_2_2w * pre_2_week_type_2_price
this_month_premium_3w_t2 = thismonth_int_pre_2015_type_2_3w * pre_3_week_type_2_price
this_month_premium_4w_t2 = thismonth_int_pre_2015_type_2_4w * pre_4_week_type_2_price


this_month_premium_tot_2015 = this_month_premium_1w + this_month_premium_2w + this_month_premium_3w + this_month_premium_4w + this_month_premium_1w_t2 + this_month_premium_2w_t2 + this_month_premium_3w_t2 + this_month_premium_4w_t2
 
 
 

this_month_vip_2w = thismonth_int_vip_2015_type_1_2w * vip_2_week_type_1_price
this_month_vip_3w = thismonth_int_vip_2015_type_1_3w * vip_3_week_type_1_price
this_month_vip_4w = thismonth_int_vip_2015_type_1_4w * vip_4_week_type_1_price

this_month_vip_2w_t2 = thismonth_int_vip_2015_type_2_2w * vip_2_week_type_2_price
this_month_vip_3w_t2 = thismonth_int_vip_2015_type_2_3w * vip_3_week_type_2_price
this_month_vip_4w_t2 = thismonth_int_vip_2015_type_2_4w * vip_4_week_type_2_price

 
this_month_vip_tot_2015 = this_month_vip_2w + this_month_vip_3w + this_month_vip_4w + this_month_vip_2w_t2 + this_month_vip_3w_t2 + this_month_vip_4w_t2


 
this_month_private_2w	= thismonth_int_private_2015_type_1_2w * private_2_week_type_1_price
this_month_private_3w	= thismonth_int_private_2015_type_1_3w * private_3_week_type_1_price
this_month_private_4w	= thismonth_int_private_2015_type_1_4w * private_4_week_type_1_price

this_month_private_2w_t2 = thismonth_int_private_2015_type_2_2w * private_2_week_type_2_price
this_month_private_3w_t2 = thismonth_int_private_2015_type_2_3w * private_3_week_type_2_price
this_month_private_4w_t2 = thismonth_int_private_2015_type_2_4w * private_4_week_type_2_price

 
this_month_private_tot_2015 =  this_month_private_2w + this_month_private_3w + this_month_private_4w + this_month_private_2w_t2 + this_month_private_3w_t2 + this_month_private_4w_t2


 
this_month_da_tot_2015 = thismonth_int_da_2015 * 0
 
this_month_working_tot_2015 = thismonth_int_wor_2015 * wkm_4_week_type_2_price

 
this_month_kg_tot_2015 = thismonth_int_kg_2015 * kg_4_week_type_2_price
 

this_month_tot_35_2015 = thismonth_int_35_2015 * age_35_4_week_type_2_price

 
this_month_home_tot_2015 = thismonth_int_home_2015 * home_4_week_type_2_price


 
 
this_month_total = this_month_basic_tot + this_month_premium_tot_2015 + this_month_vip_tot_2015 + this_month_private_tot_2015 + this_month_da_tot_2015 + this_month_working_tot_2015 + this_month_kg_tot_2015 + this_month_tot_35_2015 + this_month_home_tot_2015


 

'::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  ����  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


before_month_basic_1w = beforemonth_int_basic_2015_1w * basic_1week_price
before_month_basic_2w = beforemonth_int_basic_2015_2w * basic_2week_price
before_month_basic_3w = beforemonth_int_basic_2015_3w * basic_3week_price
before_month_basic_4w = beforemonth_int_basic_2015_4w * basic_4week_price

before_month_basic_tot = before_month_basic_1w + before_month_basic_2w + before_month_basic_3w + before_month_basic_4w
  
 
 
before_month_premium_1w = beforemonth_int_pre_2015_type_1_1w * pre_1_week_type_1_price
before_month_premium_2w = beforemonth_int_pre_2015_type_1_2w * pre_2_week_type_1_price
before_month_premium_3w = beforemonth_int_pre_2015_type_1_3w * pre_3_week_type_1_price
before_month_premium_4w = beforemonth_int_pre_2015_type_1_4w * pre_4_week_type_1_price

before_month_premium_1w_t2 = beforemonth_int_pre_2015_type_2_1w * pre_1_week_type_2_price
before_month_premium_2w_t2 = beforemonth_int_pre_2015_type_2_2w * pre_2_week_type_2_price
before_month_premium_3w_t2 = beforemonth_int_pre_2015_type_2_3w * pre_3_week_type_2_price
before_month_premium_4w_t2 = beforemonth_int_pre_2015_type_2_4w * pre_4_week_type_2_price


before_month_premium_tot_2015 = before_month_premium_1w + before_month_premium_2w + before_month_premium_3w + before_month_premium_4w + before_month_premium_1w_t2 + before_month_premium_2w_t2 + before_month_premium_3w_t2 + before_month_premium_4w_t2
 
 
 

before_month_vip_2w = beforemonth_int_vip_2015_type_1_2w * vip_2_week_type_1_price
before_month_vip_3w = beforemonth_int_vip_2015_type_1_3w * vip_3_week_type_1_price
before_month_vip_4w = beforemonth_int_vip_2015_type_1_4w * vip_4_week_type_1_price

before_month_vip_2w_t2 = beforemonth_int_vip_2015_type_2_2w * vip_2_week_type_2_price
before_month_vip_3w_t2 = beforemonth_int_vip_2015_type_2_3w * vip_3_week_type_2_price
before_month_vip_4w_t2 = beforemonth_int_vip_2015_type_2_4w * vip_4_week_type_2_price

 
before_month_vip_tot_2015 = before_month_vip_2w + before_month_vip_3w + before_month_vip_4w + before_month_vip_2w_t2 + before_month_vip_3w_t2 + before_month_vip_4w_t2


 
before_month_private_2w	= beforemonth_int_private_2015_type_1_2w * private_2_week_type_1_price
before_month_private_3w	= beforemonth_int_private_2015_type_1_3w * private_3_week_type_1_price
before_month_private_4w	= beforemonth_int_private_2015_type_1_4w * private_4_week_type_1_price

before_month_private_2w_t2 = beforemonth_int_private_2015_type_2_2w * private_2_week_type_2_price
before_month_private_3w_t2 = beforemonth_int_private_2015_type_2_3w * private_3_week_type_2_price
before_month_private_4w_t2 = beforemonth_int_private_2015_type_2_4w * private_4_week_type_2_price

 
before_month_private_tot_2015 =  before_month_private_2w + before_month_private_3w + before_month_private_4w + before_month_private_2w_t2 + before_month_private_3w_t2 + before_month_private_4w_t2


 
before_month_da_tot_2015 = beforemonth_int_da_2015 * 0
 
before_month_working_tot_2015 = beforemonth_int_wor_2015 * wkm_4_week_type_2_price

 
before_month_kg_tot_2015 = beforemonth_int_kg_2015 * kg_4_week_type_2_price
 

before_month_tot_35_2015 = beforemonth_int_35_2015 * age_35_4_week_type_2_price

 
before_month_home_tot_2015 = beforemonth_int_home_2015 * home_4_week_type_2_price


 
 
before_month_total = before_month_basic_tot + before_month_premium_tot_2015 + before_month_vip_tot_2015 + before_month_private_tot_2015 + before_month_da_tot_2015 + before_month_working_tot_2015 + before_month_kg_tot_2015 + before_month_tot_35_2015 + before_month_home_tot_2015
 
':::::::::::::::::::::::::::::: ���� ��� �հ�:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


this_before_month_tot = this_month_total + before_month_total

'::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
%>


<%

If StartYMD <> "" then

%>
<script type="text/javascript">


google.load('visualization', '1', {packages: ['corechart', 'bar']});
google.setOnLoadCallback(drawMaterial);

 
function drawMaterial() {
      var data = google.visualization.arrayToDataTable([
        ['�׸�',			  				'2015'] ,
		['�ٵ����ɾ� - <%=search_da_tot_2015%> ',	      '<%=search_da_tot_2015%>'],
		['��ü�� - <%=search_kg_tot_2015%>',			  '<%=search_kg_tot_2015%>'],
		['��ŷ�� - <%=search_working_tot_2015%>',			   '<%=search_working_tot_2015%>'],
	    ['35���̻� - <%=search_tot_35_2015%>',		   '<%=search_tot_35_2015%>'],
		['������������������ - <%=search_home_tot_2015%>',  '<%=search_home_tot_2015%>'],
        ['������ - <%=search_basic_tot_2015%>',			   '<%=search_basic_tot_2015%>'],
        ['VIP - <%=search_vip_tot_2015%>',			 '<%=search_vip_tot_2015%>'],
        ['�����̺� - <%=search_private_tot_2015%>',		  '<%=search_private_tot_2015%>'],
		['�����̾� - <%=search_premium_tot_2015%>',		  '<%=search_premium_tot_2015%>'],
		['�հ� - <%=search_total_2015%>',		  '<%=search_total_2015%>']
      ]);

      var options = {
        chart: {
          title: '�˻��� ����'
        },
        hAxis: {
          title: '�����հ�',
          minValue: 0,
        },
        vAxis: {
          title: '�� ��ǰ�� ����'
        },
        bars: 'horizontal'
      };
      var material = new google.charts.Bar(document.getElementById('chart_div3'));
      material.draw(data, options);
    }

    </script>

<div id="chart_div3" style="width: 900px; height: 500px"></div>

<%

End if

%>
<br><br><br><br><br><br><br><br> 



<script type="text/javascript">


google.load('visualization', '1', {packages: ['corechart', 'bar']});
google.setOnLoadCallback(drawMaterial);

 
function drawMaterial() {
      var data = google.visualization.arrayToDataTable([
        ['�׸�',			  							  '����',			  						     			        '���'] ,
		['�ٵ����ɾ� - <%=search_da_tot_2015%> ',	      '<%=before_month_da_tot_2015%>',				'<%=this_month_da_tot_2015%>'],
		['��ü�� - <%=search_kg_tot_2015%>',			  '<%=before_month_kg_tot_2015%>',				'<%=this_month_kg_tot_2015%>'],
		['��ŷ�� - <%=search_working_tot_2015%>',	      '<%=before_month_working_tot_2015%>',	        '<%=this_month_working_tot_2015%>'],
	    ['35���̻� - <%=search_tot_35_2015%>',			  '<%=before_month_tot_35_2015%>',				'<%=this_month_tot_35_2015%>'],
		['������������������ - <%=search_home_tot_2015%>',  '<%=before_month_home_tot_2015%>',				'<%=this_month_home_tot_2015%>'],
        ['������ - <%=search_basic_tot_2015%>',		  '<%=before_month_basic_tot%>',	            '<%=this_month_basic_tot%>'],
        ['VIP - <%=search_vip_tot_2015%>',			  '<%=before_month_vip_tot_2015%>',				'<%=this_month_vip_tot_2015%>'],
        ['�����̺� - <%=search_private_tot_2015%>',	  '<%=before_month_private_tot_2015%>',	        '<%=this_month_private_tot_2015%>'],
		['�����̾� - <%=search_premium_tot_2015%>',	  '<%=before_month_premium_tot_2015%>',	        '<%=this_month_premium_tot_2015%>'],
		['�հ� - <%=this_before_month_tot%>',			  '<%=before_month_total%>',			        '<%=this_month_total%>']
      ]);

      var options = {
        chart: {
          title: '����, ��� ����'
        },
        hAxis: {
          title: '�����հ�',
          minValue: 0,
        },
        vAxis: {
          title: '�� ��ǰ�� ����'
        },
        bars: 'horizontal'
      };
      var material = new google.charts.Bar(document.getElementById('chart_div4'));
      material.draw(data, options);
    }

    </script>

<div id="chart_div4" style="width: 900px; height: 500px"></div>


<br><br><br><br><br><br><br><br><br><br><br><br><br>

<script type="text/javascript">


google.load('visualization', '1', {packages: ['corechart', 'bar']});
google.setOnLoadCallback(drawMaterial);

 
function drawMaterial() {
      var data = google.visualization.arrayToDataTable([
        ['�׸�',	 				          '������',		         '�����'],
		['�ٵ����ɾ�',		    '<%=da_tot_2015%>'	,	 '<%=da_tot_2015%>'],
		['��ü��',				'<%=da_tot_2015%>'	,    '<%=kg_tot_2015%>'],
		['��ŷ��',			'<%=da_tot_2015%>'	,  '<%=working_tot_2015%>'],
	    ['35���̻�',			'<%=da_tot_2015%>'	,    '<%=tot_35_2015%>'],
		['������������������',	'<%=da_tot_2015%>'	,   '<%=home_tot_2015%>'],
        ['������',			'<%=da_tot_2015%>'	,  '<%=basic_tot_2015%>'],
        ['VIP',				'<%=da_tot_2015%>'	,     '<%=vip_tot_2015%>'],
        ['�����̺�',		'<%=da_tot_2015%>'	, '<%=private_tot_2015%>'],
		['�����̾�',		'<%=da_tot_2015%>'	, '<%=premium_tot_2015%>']
      ]);

      var options = {
        chart: {
          title: '�� ��ǰ�� ����'
        },
        hAxis: {
          title: '�����հ�',
          minValue: 0,
        },
        vAxis: {
          title: '�� ��ǰ�� ����'
        },
        bars: 'horizontal'
      };
      var material = new google.charts.Bar(document.getElementById('chart_div2'));
      material.draw(data, options);
    }

    </script>

<div id="chart_div2" style="width: 900px; height: 500px"></div>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<script type="text/javascript">


google.load('visualization', '1', {packages: ['corechart', 'bar']});
google.setOnLoadCallback(drawMaterial);

 
function drawMaterial() {
      var data = google.visualization.arrayToDataTable([
        ['�׸�',			  				'2015'] ,
		['�ٵ����ɾ� - <%=da_tot_2015%> ',	      '<%=da_tot_2015%>'],
		['��ü�� - <%=kg_tot_2015%>',			  '<%=kg_tot_2015%>'],
		['��ŷ�� - <%=working_tot_2015%>',			   '<%=working_tot_2015%>'],
	    ['35���̻� - <%=tot_35_2015%>',		   '<%=tot_35_2015%>'],
		['������������������ - <%=home_tot_2015%>',  '<%=home_tot_2015%>'],
        ['������ - <%=basic_tot_2015%>',			   '<%=basic_tot_2015%>'],
        ['VIP - <%=vip_tot_2015%>',			 '<%=vip_tot_2015%>'],
        ['�����̺� - <%=private_tot_2015%>',		  '<%=private_tot_2015%>'],
		['�����̾� - <%=premium_tot_2015%>',		  '<%=premium_tot_2015%>']
      ]);

      var options = {
        chart: {
          title: '2015�� �� ��ǰ�� ����'
        },
        hAxis: {
          title: '�����հ�',
          minValue: 0,
        },
        vAxis: {
          title: '�� ��ǰ�� ����'
        },
        bars: 'horizontal'
      };
      var material = new google.charts.Bar(document.getElementById('chart_div'));
      material.draw(data, options);
    }

    </script>
 

 <div id="chart_div" style="width: 900px; height: 500px"></div>

<%

	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)		
			MR_SERVICE			= arrList(0,num)
			MR_PERIOD			= arrList(1,num)
			MR_FAMILY			= arrList(2,num)
			MR_TYPE				= arrList(3,num)
			MR_PAY_STATE		= arrList(4,num)
			MR_PAY_DT			= arrList(5,num)
			MR_PERIOD_INT		= arrList(6,num)
			MR_TYPE_INT			= arrList(7,num)

			int_MR_PERIOD_INT = CInt(MR_PERIOD_INT)

			MR_PERIOD_INT_TOT = MR_PERIOD_INT_TOT + int_MR_PERIOD_INT

			basic_price = MR_PERIOD_INT_TOT * basic_1week_price
%>
<%					
		Next
	Else
%>
 
<%
	End If
%>

<br/><br/> <br/><br/><br/><br/><br/><br/><br/><br/>


<script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
         ['Month', '����'],
         ['2015',  <%=total_2015%>],
         ['2014',  <%=total_2014%>]
      ]);

    var options = {
      title : '��ü����',
      vAxis: {title: '�ݾ�'},
      hAxis: {title: '�⵵'},
      seriesType: 'bars',
      series: {1: {type: 'line'}}
    };

    var chart = new google.visualization.ComboChart(document.getElementById('chart_div1'));
    chart.draw(data, options);
  }
    </script>



 
 <div id="chart_div1" style="width: 900px; height: 500px"></div>

 


 





</center>
	 	</tbody>
			</table>
			<!--div id="paging_wrap"></div-->
		</div>
	</div>
</body>
 
 
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js"></script>
<script type="text/javascript" src="/common/js/jquery/jquery.pager.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function(){
		jQuery('#paging_wrap').setAdminPager('<%=page%>','<%=strPathInfo%>?<%=strDftUrl%>','<%=intTotalCnt%>', { nppg : '<%=page_size%>'});
	});
</script>
</html>