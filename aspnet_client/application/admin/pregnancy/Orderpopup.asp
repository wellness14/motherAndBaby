<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")


Dim period
period  = Request("period")

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>컨텐츠 순서변경</title>
<link href="/application/css/css.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<style>
  #sortable { list-style-type: none; margin: 0; padding: 0; width: 100%; }
  #sortable li { margin: 0 5px 5px 5px; padding: 5px; font-size: 1.2em; height: 1.5em; }
  html>body #sortable li { height: 1.5em; line-height: 1.2em; }
  .ui-state-highlight { height: 1.5em; line-height: 1.2em; }
</style>
</head>

<script language="javascript">
	
	$(document).ready(function(){
		$('#sortable').sortable({
			update: function(event, ui) {
				var fruitOrder = $(this).sortable('toArray').toString();
				$.get('update-sort.cfm', {fruitOrder:fruitOrder});
			}
		});

	getSortOrder = function(){
		var fruitOrder = $("#sortable").sortable('toArray').toString();
		$("#checkOrderNum").val(fruitOrder);

		thisForm = document.write_form;
		thisForm.action = "./goods_process_db.asp";
		thisForm.target = "_self";
		thisForm.submit();



		};
	});


  $(function() {

    $( "#sortable" ).sortable({
      placeholder: "ui-state-highlight"
    });
    $( "#sortable" ).disableSelection();
  });

  </script>
<body>
  <div id="popup">

    <div id="popupTop">
    	<ul>
        	<li><img src="/application/image/publisher/sub_menu_cs.jpg"/></li>
        </ul>
    </div>
    <div id="popupTable">

	<form method="post" id="write_form" name="write_form">
    <input type="hidden" name="period" value="<%=period%>"/>
	<input type="hidden" name="sMode" value="orderNum"/> 
    </div>
	<div id="list" style="height:470px;overflow-Y:scroll;">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
	<th>품목 유형 - [갯수] : <font color="red">마우스로 드래그하여, 순서를 정렬한 후에, 저장을 눌러주세요.</font></th>
	</tr>
	<tr>
	  <td height="10"></td>
    </tr>
	</table>
         <input type="hidden" name="checkOrderNum" id="checkOrderNum"/>	
		<ul id="sortable"> 
		<%
			sQuery = "select * from tb_pregnancyCheckList where period = '"&period&"' order by orderNum asc"

			Set oRs = Server.CreateObject("ADODB.Recordset") 
			oRs.Open sQuery,oDb,1

			Dim intCount
			intCount = oRs.recordcount



			Dim i, menuName
			i = 0
			Do While Not ( oRs.eof or oRs.bof ) 

					
		%>
					<li id="<%=oRs("cNum")%>" class="ui-state-default">▶<%=oRs("gTitle")%>-[<%=oRs("gNumber")%>]</li>
		 <% 
			   i = i + 1
			   oRs.MoveNext
			   Loop

			   oRs.close
			   Set oRs = Nothing
		%>                           
                </ul>
		  
      </div>
	  <div>
	  <table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
						<td align="center" bgcolor="#9700DD" height="30">
							<input type="button" value="저장" onclick="javascript:getSortOrder();" class="imgbutton" onMouseover="this.className='imgbutton_over'" onMouseOut="this.className='imgbutton'" onfocus="this.blur();">
							<input type="button" value="닫기" onclick="javascript:self.close();" class="imgbutton" onMouseover="this.className='imgbutton_over'" onMouseOut="this.className='imgbutton'" onfocus="this.blur();">
						</td>
			</tr>
       </table>
      </div>
   	</form>  	 
  </div> 	
</body>
</html>

<% 	call sDbClose() %>

