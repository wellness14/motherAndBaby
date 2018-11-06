<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	
	Dim id, password
			
	'- GET PARA----------------------------------------------------------------------------------------
	id = Request("id")
	password = Request("password")
	'----------------------------------------------------------------------------------------------------
	
	sQuery = "select top 1 * from tb_Auth_Admininfo where Uid = '"&id&"' and useYN = 'Y' "
	'Response.write sQuery
	'Response.End 

	Set oRS = oDb.Execute(sQuery)
						
						if oRs.eof then
							   
							   Response.Write "<script language='JavaScript'> " &_
							   "alert('일치하는 아이디가 없습니다.'); " &_
							   "location.href='login.asp';" &_
							   "</script>" 
							
						else
							  
							  sQuery = "select top 1 npwd=pwdcompare('"&password&"',uPasswd), * from tb_Auth_Admininfo where Uid = '"&id&"'"
                              Set RS = oDb.Execute(sQuery)
							  
							  
							  if Rs("npwd") = 0 then 
							   
							   Response.Write "<script language='JavaScript'> " &_
							   "alert('패스워드가 동일하지 않습니다.'); " &_
							   "location.href='login.asp';" &_
							   "</script>" 
							   
							  elseif Rs("npwd") = 1 then
							  
								sQuery = "INSERT INTO tb_Auth_Visitlog (Useq, RegDate) Values ('"&Rs("Useq")&"',getdate())"
								oDb.Execute(sQuery)

                                sQuery = "update  tb_Auth_Admininfo set VisitDate = getdate() where Uid = '"&id&"'"
								oDb.Execute(sQuery)



								  Response.Cookies("partner").Domain 		= "mothernbaby.co.kr"
								  Response.Cookies("partner")("CID") 		= Rs("Uid")
                                  Response.Cookies("partner")("sCode")		= Rs("shopCode")
								  Response.Cookies("partner")("cName")		= Rs("Uname")
                                  Response.Cookies("partner")("authlevel")  = Rs("AuthFlag")

							  	  
								  Response.Write "<script language='JavaScript'> " &_
							      "location.href='main.asp';" &_
							      "</script>"
                                
								
							  end if
							
						end if
			
		
		
	call sDbClose()
	
	'insert into tb_auth_admininfo (Uid, Uemail, Upasswd, Uname, Uhphone, RegDate, VisitDate, UseYN, AuthFlag, ShopCode) 
    'values ('supermaster', 'seung.hwa2010@gmail.com', pwdencrypt('1111'),'슈퍼관리자','07048230701', GETDATE(),GETDATE(), 'Y', 'S','00000')

%>