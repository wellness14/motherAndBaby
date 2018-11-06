<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<title>���� ÷���ϱ� :: SmartEditor2</title>
<style type="text/css">
/* NHN Web Standard 1Team JJS 120106 */ 
/* Common */
body,p,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,table,th,td,form,fieldset,legend,input,textarea,button,select{margin:0;padding:0}
body,input,textarea,select,button,table{font-family:'����',Dotum,Helvetica,sans-serif;font-size:12px}
img,fieldset{border:0}
ul,ol{list-style:none}
em,address{font-style:normal}
a{text-decoration:none}
a:hover,a:active,a:focus{text-decoration:underline}

/* Contents */
.blind{visibility:hidden;position:absolute;line-height:0}
#pop_wrap{width:383px}
#pop_header{height:26px;padding:14px 0 0 20px;border-bottom:1px solid #ededeb;background:#f4f4f3}
.pop_container{padding:11px 20px 0}
#pop_footer{margin:21px 20px 0;padding:10px 0 16px;border-top:1px solid #e5e5e5;text-align:center}
h1{color:#333;font-size:14px;letter-spacing:-1px}
.btn_area{word-spacing:2px}
.pop_container .drag_area{overflow:hidden;overflow-y:auto;position:relative;width:341px;height:129px;margin-top:4px;border:1px solid #eceff2}
.pop_container .drag_area .bg{display:block;position:absolute;top:0;left:0;width:341px;height:129px;background:#fdfdfd url(/common/SmartEditor2/img/photoQuickPopup/bg_drag_image.png) 0 0 no-repeat}
.pop_container .nobg{background:none}
.pop_container .bar{color:#e0e0e0}
.pop_container .lst_type li{overflow:hidden;position:relative;padding:7px 0 6px 8px;border-bottom:1px solid #f4f4f4;vertical-align:top}
.pop_container :root .lst_type li{padding:6px 0 5px 8px}
.pop_container .lst_type li span{float:left;color:#222}
.pop_container .lst_type li em{float:right;margin-top:1px;padding-right:22px;color:#a1a1a1;font-size:11px}
.pop_container .lst_type li a{position:absolute;top:6px;right:5px}
.pop_container .dsc{margin-top:6px;color:#666;line-height:18px}
.pop_container .dsc_v1{margin-top:12px}
.pop_container .dsc em{color:#13b72a}
.pop_container2{padding:46px 60px 20px}
.pop_container2 .dsc{margin-top:6px;color:#666;line-height:18px}
.pop_container2 .dsc strong{color:#13b72a}
.upload{margin:0 4px 0 0;_margin:0;padding:6px 0 4px 6px;border:solid 1px #d5d5d5;color:#a1a1a1;font-size:12px;border-right-color:#efefef;border-bottom-color:#efefef;length:300px;}
:root  .upload{padding:6px 0 2px 6px;}
</style>
</head>
<body>
<div id="pop_wrap">
	<!-- header -->
    <div id="pop_header">
        <h1>���� ÷���ϱ�</h1>
    </div>
    <!-- //header -->
    <!-- container -->
	
    <!-- [D] HTML5�� ��� pop_container Ŭ������ ���� HTML ����
	    	 �׹��� ��� pop_container2 Ŭ������ ���� HTML ����      -->
	<div id="pop_container2" class="pop_container2">
    	<!-- content -->
		<form id="editor_upimage" name="editor_upimage" action="/common/inc/Edit_Uploader.asp" method="post" enctype="multipart/form-data"> <!-- �����Ѱ� onsubmit ������ -->
	    <input type="hidden" name="callHost" value="<%=fncRequestVariables("HTTP_HOST")%>">
        <div id="pop_content2">
			<input type="file" class="upload" id="uploadInputBox" name="uploadInputBox">	<!-- �����Ѱ� name���� ���� -->
            <p class="dsc" id="info"><strong>2MB</strong>������ �̹��� ���ϸ� ����� �� �ֽ��ϴ�.<br>(JPG, GIF, BMP)</p>
        </div>
		</form>
        <!-- //content -->
    </div>
    <div id="pop_container" class="pop_container" style="display:none;">
    	<!-- content -->
        <div id="pop_content">
	        <p class="dsc"><em id="imageCountTxt">0��</em>/10�� <span class="bar">|</span> <em id="totalSizeTxt">0MB</em>/50MB</p>
        	<!-- [D] ÷�� �̹��� ���ο� ���� Class ��ȭ 
            	 ÷�� �̹����� �ִ� ��� : em�� "bg" Ŭ���� ���� //÷�� �̹����� ���� ��� : em�� "nobg" Ŭ���� ����   -->
				 
            <div class="drag_area" id="drag_area">
				<ul class="lst_type" >
				</ul>
            	<em class="blind">���콺�� �巡���ؼ� �̹����� �߰����ּ���.</em><span id="guide_text" class="bg"></span>
            </div>
			<div style="display:none;" id="divImageList"></div>
            <p class="dsc dsc_v1"><em>�� ��� 10MB, 1ȸ�� 50MB����, 10��</em>�� �̹��� ������<br>����� �� �ֽ��ϴ�. (JPG, GIF, PNG, BMP)</p>
        </div>
        <!-- //content -->
    </div>

    <!-- //container -->
    <!-- footer -->
    <div id="pop_footer">
	    <div class="btn_area">
            <a href="#"><img src="/common/SmartEditor2/img/photoQuickPopup/btn_confirm.png" width="49" height="28" alt="Ȯ��" id="btn_confirm"></a>
            <a href="#"><img src="/common/SmartEditor2/img/photoQuickPopup/btn_cancel.png" width="48" height="28" alt="���" id="btn_cancel"></a>
        </div>
    </div>
    <!-- //footer -->
</div>
<script type ="text/javascript">
    var fileUrl = '/common/inc/Edit_Uploader.asp'; //���ϼ��� ��θ�
</script>    
<script type="text/javascript" src="/common/SmartEditor2/quick_photo_uploader/popup/jindo.min.js"></script>
<script type="text/javascript" src="/common/SmartEditor2/quick_photo_uploader/popup/jindo_fileUpload.js"></script>
<script type="text/javascript" src="/common/SmartEditor2/quick_photo_uploader/popup/QuickPhotoPopup.js"></script>
</body>
</html>