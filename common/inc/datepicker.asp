<%
'----------------------------------------------------------------------------------------
' ���񽺸� : jQuery �޷�
'----------------------------------------------------------------------------------------
%>
<link type="text/css" rel="stylesheet" href="/common/css/jquery/themes/redmond/ui.all.css" />
<script type="text/javascript" src="/common/js/jquery/ui/ui.core.js"></script>
<script type="text/javascript" src="/common/js/jquery/ui/ui.datepicker.js"></script>
<script type="text/javascript">
<!--
	jQuery.datepicker.setDefaults({
		monthNames: ['�� 1��','�� 2��','�� 3��','�� 4��','�� 5��','�� 6��','�� 7��','�� 8��','�� 9��','�� 10��','�� 11��','�� 12��'],
		dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'],
		showMonthAfterYear: true,
		dateFormat: 'yy-mm-dd'
	});

	jQuery(document).ready(function(){
		// S : ������ ����
//		jQuery("#dbTT_OPEN_DT").datepicker({
//			defaultDate: new Date(<%=Year(date())%>, <%=Month(date())%> - 1, <%=Day(date())%>),
//			showOn: 'focus',
//			showAnim: 'fadeIn'
//		});
		
		// S : ������ ����
//		jQuery("#dbTT_END_DT").datepicker({
//			defaultDate: new Date(<%=Year(date())%>, <%=Month(date())%> - 1, <%=Day(date())%>),
//			showOn: 'focus',
//			showAnim: 'fadeIn'
//		});
	});
//-->
</script>