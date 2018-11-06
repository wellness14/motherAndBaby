<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
 
 
<%
	uId			= Trim(fncRequestCookie("uid"))				'회원	아이디

	If uId = "" Then 
		Response.Redirect "http://mothernbaby.co.kr/mnb_notebook/login.asp"
	End If 

Response.CharSet="utf-8"
Session.codepage="65001"
Response.codepage="65001"
Response.ContentType="text/html;charset=utf-8"
 
 	search				= Trim(fncRequest("search"))	


If search <> "" Then 

	strSql = ""
	strSql = strSql & "		;SELECT "
	strSql = strSql & "			* "
	strTable = "			   from MO_HELPER_SERVICE  "
	strTable = strTable & "    full outer  join	   mo_baby			on MO_HELPER_SERVICE.mr_idx = mo_baby.mr_idx "
	strTable = strTable & "    full outer  join    MO_RESERVATION   on MO_RESERVATION.mr_idx = MO_HELPER_SERVICE.mr_idx "
	strTable = strTable & "    full outer  join    mo_helper		on MO_HELPER_SERVICE.MD_HELPER_SEQ = mo_helper.MD_HELPER_SEQ "

	strWhere = "  where MO_HELPER_SERVICE.MD_HELPER_SEQ is not null and MD_HELPER_ID='"& uId &"' and ( MO_RESERVATION.mr_mem_nm like '%"& search &"%' or MO_RESERVATION.mr_mem_id like '%"& search &"%' or  mo_baby.mo_baby_name like '%"& search &"%'	 or  MO_RESERVATION.mr_hp like '%"& search &"%' ) "

Else 


	strSql = ""
	strSql = strSql & "		;SELECT "
	strSql = strSql & "			* "
	strTable = "			   from MO_HELPER_SERVICE  "
	strTable = strTable & "    full outer  join	   mo_baby			on MO_HELPER_SERVICE.mr_idx = mo_baby.mr_idx "
	strTable = strTable & "    full outer  join    MO_RESERVATION   on MO_RESERVATION.mr_idx = MO_HELPER_SERVICE.mr_idx "
	strTable = strTable & "    full outer  join    mo_helper		on MO_HELPER_SERVICE.MD_HELPER_SEQ = mo_helper.MD_HELPER_SEQ "

	strWhere = "  where MO_HELPER_SERVICE.MD_HELPER_SEQ is not null and MD_HELPER_ID='"& uId &"' "

 

End if

	strSql = strSql & strTable
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		arrList = Rs.GetRows()
	End If 
	Call DBClose(Rs) : DBClose(Rs1)


	Dim NowDate, NowYear, NowMonth, NowDay, NowHour, NowMinute, NowSecond

	'현재날짜
	NowDate = Date()    '2011-07-08

	'현재 년
	NowYear = Year(Date())    '2011

	'현재 월
	NowMonth = Month(Date())    '7
	NowMonth_2 = Month(Date())    '7
	month_1 = month(now) 


	'현재 일
	NowDay = Day(Date())    '8
 

	If NowYear <> "" And NowMonth <> ""   Then 
	nowymd = NowYear & fncSetNumber(NowMonth)  & fncSetNumber(NowDay)
	End If 
  
%>
 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Mother n Baby 산모도우미 수첩</title>

    <!-- Bootstrap core CSS -->
    <link href="/mnb_notebook/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/mnb_notebook/css/style.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/mnb_notebook/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="/mnb_notebook/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/mnb_notebook/js/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript" language="utf-8">

		var modal_serach = "";

		$(document).ready(function() {
			$("#over_chk_btn1").click(function(){
				modal_serach = $("#modal-serach").val();

				if(modal_serach != ""){
					window.open("http://mothernbaby.co.kr/mnb_notebook/service_list.asp?search="+modal_serach, "_self","");
				}
			});

		});

	</script>
  </head>

  <body>
 
<!-- #include virtual = "/mnb_notebook/nav.asp"-->

    <div class="container">

		<div class="content">
			<!--div class="align_right">
				<img src="/mnb_notebook/img/04_infomation_03.png" style="cursor:pointer;"/> 
			</div-->

			<table class="table table-condensed tb">
					<colgroup>
						<col width="35%" />
						<col width="30%" />
						<col width="35%" />
					</colgroup>
					<thead>
					<tr>
						<th> 시작일 </th>
						<th> 산모(고객명) </th>
						<th> Status </th>
					</tr>
					</thead>
					<tbody>
<%
 
	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)	
			hp_seq		= arrList(0,num)
			idx			= arrList(1,num)
			s_date		= arrList(22,num)
		 
			e_date		= arrList(23,num)
			pay		    = arrList(26,num)
			baby1_seq	= arrList(5,num)

			id			=	arrList(7,num)
			name		=  arrList(11,num)
			birth		=  arrList(12,num)
			phone			=  arrList(13,num)
			hp			=  arrList(14,num)
			address1	=  arrList(16,num)
			address2	=  arrList(17,num)
			baby_name	=  arrList(8,num)

 
%>
						<tr class="warning">
							<td><a href="service_view.asp?hp_seq=<%=hp_seq%>&idx=<%=idx%>&baby1_seq=<%=baby1_seq%>&id=<%=id%>&name=<%=name%>&birth=<%=birth%>&address1=<%=address1%>&address2=<%=address2%>&baby_name=<%=baby_name%>&hp=<%=hp%>&phone=<%=phone%>"><%=Left(s_date,4)%>.<%=Mid(s_date,5,2)%>.<%=Right(s_date,2)%></a></td>
							<td><a href="service_view.asp?hp_seq=<%=hp_seq%>&idx=<%=idx%>&baby1_seq=<%=baby1_seq%>&id=<%=id%>&name=<%=name%>&birth=<%=birth%>&address1=<%=address1%>&address2=<%=address2%>&baby_name=<%=baby_name%>&hp=<%=hp%>&phone=<%=phone%>"><%=name%></a></td>
							<td><% If pay = "결제완료" And s_date <=  nowymd   And e_date >= nowymd then%> 진행중 
								<% elseIf pay = "결제완료" And  e_date < nowymd then%> 완료  
								<% elseIf pay = "" Then %> 대기중 <%else%>대기중<% End if%>
							</td>
						</tr>
					</tbody>
<%
		Next 
	Else
%>
			<tr>
				<td colspan="10" style="text-align:center;">등록된 정보가 없습니다.</td>
			</tr>
<%
	End If
%>
				</table>

		<div class="title">
			<img src="/mnb_notebook/img/04_infomation_05.png" /> 
		</div>

		</div>

    </div><!-- /.container -->

<!-- #include virtual = "/mnb_notebook/modal.asp"-->

  </body>
</html>
