<%
'----------------------------------------------------------------------------------------
' 서비스명 : jQuery 달력
'----------------------------------------------------------------------------------------
%>
<link type="text/css" rel="stylesheet" href="/common/css/jquery/themes/redmond/ui.all.css" />
<script type="text/javascript" src="/common/js/jquery/ui/ui.core.js"></script>
<script type="text/javascript" src="/common/js/jquery/ui/ui.datepicker.js"></script>
<script type="text/javascript">
<!--
	jQuery.datepicker.setDefaults({
		monthNames: ['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear: true,
		dateFormat: 'yy-mm-dd'
	});

	jQuery(document).ready(function(){
		// S : 오픈일 설정
//		jQuery("#dbTT_OPEN_DT").datepicker({
//			defaultDate: new Date(<%=Year(date())%>, <%=Month(date())%> - 1, <%=Day(date())%>),
//			showOn: 'focus',
//			showAnim: 'fadeIn'
//		});
		
		// S : 종료일 설정
//		jQuery("#dbTT_END_DT").datepicker({
//			defaultDate: new Date(<%=Year(date())%>, <%=Month(date())%> - 1, <%=Day(date())%>),
//			showOn: 'focus',
//			showAnim: 'fadeIn'
//		});
	});
//-->
</script>