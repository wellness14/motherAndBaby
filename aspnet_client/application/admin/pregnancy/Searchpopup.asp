<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")


Dim period, iType, menuTitle,periodTitle
period  = Request("period")
iType  = Request("iType")

If iType = "import" Then menuTitle = "가져오기"
If iType = "export" Then menuTitle = "내보내기"


If period  = "1" Then periodTitle = "임신초기(1~3개월)"
If period  = "2" Then periodTitle = "임신중기(4~7개월)"
If period  = "3" Then periodTitle = "임신후기(8~10개월)"
If period  = "4" Then periodTitle = "산욕기(출산후 6~8주)"




%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>컨텐츠 <%=menuTitle%></title>
<link href="/application/css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <div id="popup">

    <div id="popupTop">
    	<ul>
        	<li><img src="/application/image/publisher/sub_menu_cs.jpg"/></li>
        </ul>
    </div>
    <div id="popupTable">

	<form method="post" id="form1" name="form1">
    <input type="hidden" name="period" value="<%=period%>"/>
	<input type="hidden" name="sMode" value="<%=iType%>"/> 
    </div>
	<div id="list" style="height:470px;overflow-Y:scroll;">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<% If iType = "import" then%>
	<tr>
	<th><font color="red">비등록그룹에 등록된 품목입니다. 선택 후에, 저장하시면, <%=periodTitle%> 그룹으로 이동합니다.</font></th>
	</tr>
	<%ElseIf iType = "export" Then %>
    <tr>
	<th><font color="red"><%=periodTitle%>그룹의 품목입니다. 선택 후에, 저장하시면, 비등록 그룹으로 이동합니다.</font></th>
	</tr>
	<% End If %>
	<tr>
	  <td height="10"></td>
    </tr>
	</table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" id="menuTable">
                	
		<%
			If iType = "import" Then 
			sQuery = "select * from tb_pregnancyCheckList where period = '0' order by orderNum asc"
			ElseIf iType = "export" Then 
            sQuery = "select * from tb_pregnancyCheckList where period = '"&period&"' order by orderNum asc"
			End If 

			Set oRS = oDb.Execute(sQuery)


			Dim i
			i = 1
			Do While Not ( oRs.eof or oRs.bof ) 

					


		%>
							<tr onmouseover="this.style.background='#E9E8E8'" onmouseout="this.style.background='#ffffff'" style="padding-left:5px;">
								<td width="3%"><input type="checkbox" name="cNum" value="<%=oRs("cNum")%>"></td>
								<td align="left">[<%=oRs("gTitle")%>]&nbsp;<%=oRs("gNumber")%></td>   
								<td width="20%"><%=oRs("regDate")%></td>   
							</tr> 
		<% 
			   i = i + 1
			   oRs.MoveNext
			   Loop

			   oRs.close
			   Set oRs = Nothing
		%>
                           
                </table>
		
		
		
		  
      </div>
	  <div>
	  <table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
						<td align="center" bgcolor="#9700DD" height="30">
							<input type="button" value="<%=menuTitle%>" onclick="javascript:save();" class="imgbutton" onMouseover="this.className='imgbutton_over'" onMouseOut="this.className='imgbutton'" onfocus="this.blur();">
							<input type="button" value="닫기" onclick="javascript:self.close();" class="imgbutton" onMouseover="this.className='imgbutton_over'" onMouseOut="this.className='imgbutton'" onfocus="this.blur();">
						</td>
			</tr>
       </table>
      </div>
   	</form>  	 
  </div> 	
</body>
</html>
<script language="javascript">
function save(){
    var f = document.form1
	f.action = "goods_process_db.asp";
	f.submit();
}
</script>

<% 	call sDbClose() %>

