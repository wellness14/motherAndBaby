<!DOCTYPE HTML>
<html lang="ko">
<head>

 <meta charset="utf-8">
  <title>total_admin_index</title>


  
<style type="text/css">

@import url('http://fonts.googleapis.com/earlyaccess/nanumgothic.css');
	table, div, p {font-family:'Nanum Gothic';}
	body {
		font-family:'Nanum Gothic';
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;


}
#main_bg{ background: #ffffff; /*  // 구닥다리 브라우저를 위한 단색지정*/

background: -moz-linear-gradient(top, #bac2c2 0%,  #dce5e5 100%); /* // FF3.6*/

background:-webkit-gradient(linear, left top, left bottom, color-stop(0%,#bac2c2), color-stop(100%, #dce5e5);  /*// 크롬, 사파리4*/

background:-webkit-linear-gradient(top, #bac2c2 0%,  #dce5e5 100%);  /*// 크롬10 이상, 사파리 5.1이상*/

background:-o-linear-gradient(top, #bac2c2 0%,  #dce5e5 100%);  /*// 오페라 11.10 이상*/

background:-ms-linear-gradient(top, #bac2c2 0%,  #dce5e5100%);  /*// 익스10 이상*/

background:linear-gradient(to bottom, #bac2c2 0%,  #dce5e5 100%); /*// W3C 표준*/

filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#bac2c2',endColorstr=' #dce5e5',GradientType=0); /* // 익스 6~9*/
); no-repeat;

background-size:cover; 
width:100px;
 

}


label.absolute { 
    position: absolute; 
    color:#999; 
    display: none; 
    cursor: text
}

input { padding:5px 1px 5px 5px; border-top:1px solid #b5b5b5; border-right:1px solid #ddd; border-bottom:1px solid #ddd; border-left:1px solid #b5b5b5; }

input.focusbox { 
    border:1px solid #23adb2;
}
input:focus { 
    outline: #23adb2 solid thin 
	}
#admin_id{
position:relative;
top:220px;
left:160px;

}


</Style>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
 google.load("jquery", "1.7.1");
</script>


</head>

<body id="main_bg" >

<div id="admin_id">


<input type="text"  name="admin_name" id="admin_id"   placeholder="ID를 입력하세요." value="" style="width:120px;" />



</div>


<script>
jQuery(function () {
    if (!("placeholder" in document.createElement("input"))) { 
        jQuery(":input[placeholder]").each(function () {
            var $this = jQuery(this);
            var pos = $this.offset();
            if (!this.id) this.id = "jQueryVirtual_" + this.name;
            if (this.id) {
                if (jQuery.browser.version  < 8) {
                    $this.after("<label for='" + this.id + 
                         "' id='jQueryVirtual_label_" + this.id + 
                         "' class='absolute'>" + $this.attr("placeholder") + 
                         "</label>");
                    $("#jQueryVirtual_label_" + this.id).
                         css({"left":(pos.left+5), "margin-top":3, 
                         "width":$this.width()});
                }
                else {
                    $this.after("<label for='" + this.id + 
                     "' id='jQueryVirtual_label_" + this.id + 
                     "' style='left:" + (pos.left+5) + 
                     "px;margin-top:2px' class='absolute'>" + 
                     $this.attr("placeholder") + "</label>");
                }
            }
        }).focus(function () {
            var $this = jQuery(this);
            $this.addClass("focusbox");
            jQuery("#jQueryVirtual_label_" + $this.attr("id")).hide();
        }).blur(function () {
            var $this = jQuery(this);
            $this.removeClass("focusbox");
            if(!jQuery.trim($this.val())) 
                 jQuery("#jQueryVirtual_label_" + $this.attr("id")).show();
            else jQuery("#jQueryVirtual_label_" + $this.attr("id")).hide();
        }).trigger("blur");
    }
}); 
</script>
</body>
