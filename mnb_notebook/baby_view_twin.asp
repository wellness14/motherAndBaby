<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
 

<%

	uId			= Trim(fncRequestCookie("uid"))				'회원	아이디

	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"

	Dim mode : mode = "ins"

	intIDX = fncRequest("idx")
	hp_seq = fncRequest("hp_seq")
 	helper_id = uId 'fncRequest("helper_id")

	mo_helper_seq = fncRequest("mo_helper_seq1")

    If intIDX <> "" Then
		strTable = " FROM MO_RESERVATION WITH(NOLOCK) "
 
		strWhere = " WHERE MR_CNLKBN='N' AND MR_IDX = '"& intIDX &"' "
 


		strSql = ""
		strSql = strSql & "	SELECT * "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
			mode = "upd"
			 
			mr_idx		= Rs(0)
			mem_id		= Rs(1)
			mem_nm		= Rs(2)
			birth		= Rs(3)
			phone		= Rs(4)
			hp			= Rs(5)
			post		= Rs(6)
			addr_1		= Rs(7)
			addr_2		= Rs(8)
			service		= Rs(9)
			period		= Rs(10)
			service_type= Rs(11) 
			childbirth	= Rs(12)
			serviceSdt	= Rs(13)
			serviceEdt	= Rs(14)
			clinic		= Rs(15)
			exper		= Rs(16)
			unique		= Rs(17)
			family		= Rs(18)
			payment		= Rs(19)
			payType		= Rs(20)
			payState	= Rs(21)
			payEdt		= Rs(22)
			content		= Rs(23)
			serviceSdt_1= Rs(26)
			serviceEdt_1= Rs(27)
			serviceSdt_2= Rs(28)
			serviceEdt_2= Rs(29)
			serviceSdt_3= Rs(30)
			serviceEdt_3= Rs(31)
			pay_name    = Rs(32)
			cancel_yn   = Rs(33)
			cancel_reason= Rs(34)
			s_happy_call= Rs(35)
			e_happy_call= Rs(36)
			
			product_1					= Rs(37) '유축기 
			product_2					= Rs(38) '유축기 소모품
			product_CHOICE_WEEK			= Rs(39) '기간
			product_CHOICE_PRICE		= Rs(40) '가격
			product_OUT_DAY				= Rs(41) '조사기
			product_MASSAGE_BEFORE		= Rs(42) ' 마사지 산전
			product_MASSAGE_AFTER		= Rs(43) ' 산후
			product_MASSAGE_ADD			= Rs(44) ' 추가
			product_VISIT_NURSE_BEFORE	= Rs(45) ' 방문간호사 산전
			product_VISIT_NURSE_AFTER	= Rs(46) ' 산후
			product_SODOK_SERVICE		= Rs(47) ' 소독서비스
			product_GIFT_CHOICE			= Rs(48) ' 출산선물선택
			product_GIFT_CHOICE_SEND	= Rs(49) ' 택배일
			product_GIFT_CHOICE_BABY	= Rs(50) ' 폴스베이비
			product_GIFT_BOX_SEND		= Rs(51) ' 출산선물박스 택배일
			product_CONTENT2			= Rs(52) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			 


			arr_res_List = Rs.GetRows()

		End If 
		Call RSClose(Rs)

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

	<style type="text/css">
		.pop-layer {display:none; position: absolute; top: 50%; left: 50%; width: 360px; height:auto;  background-color:#fff; border: 5px solid #36c5a5; z-index: 10;}
		.pop-layer .pop-container {padding: 20px 25px;}
		.pop-layer p.ctxt {color: #666; line-height: 25px;}
		.pop-layer .btn-r {width: 100%; margin:10px 0 20px; padding-top: 10px; border-top: 1px solid #DDD; text-align:right;}

		a.cbtn {display:inline-block; height:25px; padding:0 14px 0; border:1px solid #36c5a5; background-color:#36c5a5; font-size:13px; color:#fff; line-height:25px;}	
		a.cbtn:hover {border: 1px solid #091940; background-color:#1f326a; color:#fff;}
	</style>

	<script type="text/javascript">
	
	function layer_open(el){

		var temp = $('#' + el);		//레이어의 id를 temp변수에 저장
		var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

		if(bg){
			$('.layer').fadeIn();
		}else{
			temp.fadeIn();	//bg 클래스가 없으면 일반레이어로 실행한다.
		}

		// 화면의 중앙에 레이어를 띄운다.
//alert(temp.outerHeight());
		if (100 < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
		else temp.css('top', '0px');
		if (100 < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
		else temp.css('left', '0px');

		temp.find('a.cbtn').click(function(e){
			if(bg){
				$('.layer').fadeOut();
			}else{
				temp.fadeOut();		//'닫기'버튼을 클릭하면 레이어가 사라진다.
			}
			e.preventDefault();
		});

		$('.layer .bg').click(function(e){
			$('.layer').fadeOut();
			e.preventDefault();
		});

	}
	
 
		  		$(document).ready(function() {	 

					jQuery(".baby_btn").click(function() {
					 
						if ($.trim(jQuery("#baby_name").val()) == "") {
								alert("신생아 이름을 입력하세요");
								$('#baby_name').focus();
								return false;
						 
						}
					});

					jQuery(".baby_twin").click(function() {
					 
						if ($.trim(jQuery("#baby_name").val()) == "") {
								alert("신생아 이름을 입력하세요");
								$('#baby_name').focus();
								return false;
						 
						}

						window.open("http://mothernbaby.co.kr/mnb_notebook/baby_sql.asp?idx="+jQuery("#idx").val()+"&baby_name="+jQuery("#baby_name").val(), "_self","");

					});
				});

 

 

</script>

  </head>

  <body>

  <!-- #include virtual = "/mnb_notebook/nav.asp"-->



    <div class="container">

		<div class="content">
				<div class="title_align_left">
					 기본정보
				</div>
			<form id="babyForm" name="babyForm" method="post" action="baby_sql.asp">
			<input type="hidden" name="idx" id="idx" value="<%=intIDX%>"/>
			<input type="hidden" name="hp_seq" id="hp_seq" value="<%=hp_seq%>"/>
			<input type="hidden" name="helper_id" id="helper_id" value="<%=helper_id%>"/>
			<input type="hidden" name="mode" id="mode" value="<%=mode%>"/>
				<table class="table table-bordered tb">
					<tbody>
						<tr>
							<td class="td1">ID/이름</td>
							<td class="td2">[<%=mem_id%>] / [<%=mem_nm%>]</td>
						</tr>
						<tr>
							<td class="td1">생년월일</td>
							<td class="td2"><%=Left(birth,4)%>년<%=Mid(birth,5,2)%>월<%=Right(birth,2)%>일</td>
						</tr>
						<tr>
							<td class="td1">연락처</td>
							<td class="td2">[<%=phone%>]  [<%=hp%>]</td>
						</tr>
						<tr>
							<td class="td1">주소</td>
							<td class="td2"><%=addr_1%> <%=addr_2%></td>
						</tr>
						<tr>
							<td class="td1">신생아 이름</td>
							<td class="td2"><input type="text" id="baby_name" name="baby_name" placeholder="이름을 입력하세요" value=""/></td>
						</tr>
					</tbody>
				</table>
			
			<div style="center">
				 <span style="margin-left:80px;"></span><img src="/mnb_notebook/img/10_list_05.png" class="baby_twin" style="cursor:pointer;"/> 	
				 <input type="image" src="/mnb_notebook/img/11_newinfo_07_on.png" class="baby_btn" align="right"/>  
			</div>
		
			<div class="title">
				<img src="/mnb_notebook/img/10_list_02.png" style="width:100%;"/> 
			</div>
			</form>
 
			<div class="title">
			</div>
			
		</div>

    </div><!-- /.container -->

  </body>
</html>
