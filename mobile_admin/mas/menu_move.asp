<%@ Language=VBScript %>
<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 관리자 메뉴 관리
'파 일 명 : menu_move.asp
'작성일자 : 2013/07/31
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================
'
'=======================================================================
Response.Expires = -1
Response.ChaRset = "euc-kr"
'<!-- 공통 인클루드 페이지 시작 -->    
%>
<!-- #include virtual = "/common/asp/vardef.asp" -->
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<%
    point		= request("point")
    targetId	= request("targetId") 
    sourceId	= request("sourceId")

    if point = "append" then	'하위 메뉴 추가
        '제일 마지막 메뉴로 추가
        strSql = " SELECT isnull(max(mi_menu_rank),1) from MO_MENU_INFO where mi_root_menu = "&targetId 
        Call RSExec(Rs,0,3,strSql,"main")
        If Not Rs.BOF AND Not Rs.EOF Then
            menu_rank = Rs(0)
        End If 
        RSClose(Rs)
   
        strSql = "UPDATE MO_MENU_INFO set mi_root_menu = "&targetId&", mi_menu_rank = "&menu_rank&" where mi_menu_code = '"&sourceId&"' "
    Else
       '해당 타겟의 mi_root_menu 구함.
        strSql = " SELECT mi_root_menu,mi_menu_rank from MO_MENU_INFO where mi_menu_code = "&targetId
        call RSExec(Rs,0,3,strSql,"main")
        If Not Rs.BOF AND Not Rs.EOF Then
            target_root_menu = Rs(0)
            target_menu_rank = Rs(1)
        End If 
        RSClose(Rs)
         
        If point = "below" Then 
            menu_rank = target_menu_rank
        Else     
            menu_rank = target_menu_rank
        End If 

        '메뉴 정렬 번호 설정.
        strSql = "SELECT mi_menu_code from MO_MENU_INFO where mi_root_menu = "&target_root_menu&" and mi_menu_code <> '"&sourceId&"' order by mi_menu_rank "
        call RsExec(Rs,0,3,strSql,"main")
       
        rank = 1
        strSql = "" 
        If Not Rs.BOF AND Not Rs.EOF Then
            Do until Rs.eof
                menu_code = Rs(0)
                
                if cint(rank) = cint(menu_rank) then 
                    rank = rank + 1
                    strSql = strSql & "UPDATE MO_MENU_INFO set mi_root_menu = "&target_root_menu&" , mi_menu_rank = "&rank&" where mi_menu_code = '"&menu_code&"'; "
                else
                    strSql = strSql & "UPDATE MO_MENU_INFO set mi_root_menu = "&target_root_menu&" , mi_menu_rank = "&rank&" where mi_menu_code = '"&menu_code&"'; "
                end if
                
                rank = rank + 1
            Rs.MoveNext
		    Loop	
        End If
       
        If menu_rank > Rs.recordCount + 1 then menu_rank = Rs.recordCount + 1
        strSql = strSql & "UPDATE MO_MENU_INFO set mi_root_menu = "&target_root_menu&" , mi_menu_rank = "&menu_rank&" where mi_menu_code = '"&sourceId&"' "
        CALL RSCLOSE(RS)  
    end if
    Call DBExec(strSql, "main")        
%>
{"success":"true","point":"<%=point%>","targetId":"<%=targetId%>","mi_root_menu":"<%=target_root_menu %>","menu_rank":"<%=menu_rank %>"}

