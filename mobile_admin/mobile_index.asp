<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%	uId		= fncRequestCookie("userid")
	grpcd	= fncRequestCookie("usergrpcd")
	If Trim(uId) <> "" Then
		response.redirect "/mobile_admin/member/mobile_member_list.asp"
		response.end
	End If 
	%>
<!DOCTYPE HTML>
<html lang="ko">
    <head>
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="86400">
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
        <meta http-equiv="Content-Language" content="euc-kr" />
        <meta http-equiv="imagetoolbar" content="no" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0 ,user-scalable=no , target-densitydpi=medium-dpi" />
        <link rel="stylesheet" type="text/css" href="/admin/common/css/m_admin_main.css" />	
        <title> :: MothernBaby  Back Office :: </title>
<script>

 var mobilecheck = function () {
     var check = false;
     (function(a,b){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4)))check = true})(navigator.userAgent||navigator.vendor||window.opera);
     return check;
     }
     if(mobilecheck()){
         // location.href='m.index.asp';
          //����Ϸ� ���ӽ� �̵� ���
		 

		 //	var w = screen.availWidth;
		//	var h = screen.avialHeight;
		//	alert(screen.height); 360, 640
		//	alert("���� �����Ͻ� ��� ȭ���� �ʺ�� " + w + "px�̸�, ���̴�" + h + "px�Դϴ�.");

     }else{
        // location.href='/pc/';
          //PC�� ���ӽ� �̵� ���
		//alert('pc');
     }



</script>
        
</head>
<!--img src="/image/mobile_admin/M&B_menu_icon_48x.png" align="left"/-->
<body  onload="login_form.adminID.focus();" >
	<div id="wrap" >
		<h3> ::: MothernBaby  Back Office ::: </h3>
		<div id="content">
			<div id="login-form">
				<fieldset class="type">
					<legend>admin type</legend>
				</fieldset>
				<fieldset>
					<form id="login_form" name="login_form" method="post">
						<legend>login</legend>
						<p class="id">
							<label>ID</label>
							<input type="text" name="adminID" id="adminID" class="inputtxt" autocomplete="off" style="ime-mode:inactive;"/>
						</p>
						<p class="pw">
							<label>PW</label>
							<input type="password" name="adminPWD" id="adminPWD" onkeydown="Entercheck();" class="inputtxt" autocomplete="off" />
						</p>
					</form>
					<p class="button" style="height:46px;">
						<input type="image" src="<%=img_admin%>/bt_login.gif" alt="Login" class="confirm" >
					</p>
				</fieldset>
				<div class="mess" id="divValidationMessage"></div>
			</div>
		</div>              
		<div id="copyright">
			Copyright &#169; 2014 MothernBaby Co., Ltd All Rights Reserved.
		</div>
	</div> 
</body>

<script type="text/javascript" src="/common/js/jquery/jquery-latest.js"></script>
<script type="text/javascript">
<!--
	var frm = jQuery("#login_form");

	jQuery(".confirm").click(function(){
		frm.submit();
	});

	frm.submit(function(){
		val = jQuery("#adminID").val();
		if(val.length < 1){
			alert("���̵� �Է��ϼ���.");
			return false;
		}
	
		val = jQuery("#adminPWD").val();
		if(val.length < 1){
			alert("�н����带 �Է��ϼ���.");
			return false;
		}
	}).attr({
	//	'target' : 'ifrm',
		'method' : 'post',
		'action' : 'user_check.asp'
	});

	function Entercheck(){
		if(event.keyCode == 13){
			frm.submit();
			return;
		}
	}
-->
</script>
</html>