<%@ Language=VBScript %>
<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : ������ �޴� ����
'�� �� �� : menu_del.asp
'�ۼ����� : 2013/07/31
'�� �� �� : �̼���
'-----------------------------------------------------------------------
'��������   ������  ��������
'=======================================================================
'
'=======================================================================
Response.Expires = -1
Response.ChaRset = "euc-kr"
'<!-- ���� ��Ŭ��� ������ ���� -->    
%>
<!-- #include virtual = "/common/asp/vardef.asp" -->
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<%
    sourceId = unescape(request("sourceId"))
    
	'�޴�����.
	strSql = " UPDATE MO_MENU_INFO SET MI_DSPL_TYPE = 'N', MI_UPD_DT=GETDATE() WHERE MI_MENU_CODE='"& sourceId &"' "
	call DBExec(strSql, "main")    
%>
{"success":"true"}