<%
'======================================================================
'�� �� �� : mothernbaby - ������
'����� : �⺻ ��� ����
'�� �� �� : VarDef.asp
'�ۼ����� : 2014/04/12
'�� �� �� : �̼���
'-----------------------------------------------------------------------
'��������   ������  ��������
'=======================================================================
'
'=======================================================================
'Response.Expires = -1
%>
<%
	If request.ServerVariables("HTTP_HOST") = "localhost" Then 
		url_main		= "http://localhost/"
		img_main		= "http://localhost/image"
	Else 
		url_main		= "http://mothernbaby.co.kr/"
		img_main		= "http://mothernbaby.co.kr/image"
	End If 

	url_admin		= url_main & "/admin"			' admin
	url_common		= url_main & "/common"			' ���� ����


	' �ƢƢ� �̹��� ��� : �ۼ� �԰� - img_{������} �ƢƢ�
	img_admin		= img_main & "/admin"			' �������̹���
	img_board		= img_main & "/board"			' �Խ���
%>
