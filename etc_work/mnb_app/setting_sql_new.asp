<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!--#include virtual="/common/inc/member_email_send.asp"-->

<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"
	
	user_id = fncRequest("user_id")
	mr_idx = fncRequest("mr_idx")
	command = fncRequest("command")

	If command = "address" Then
		post = fncRequest("post")
		address1 = fncRequest("address1")
		address2 = fncRequest("address2")

		strSql = "UPDATE MO_MEM_DTL SET"
		strSql = strSql & " MD_POST = '" & post & "'"
		strSql = strSql & " , MD_ADDR1 = '" & address1 & "'"
		strSql = strSql & " , MD_ADDR2 = '" & address2 & "'"
		strSql = strSql & " WHERE MD_MEM_ID = '" & user_id & "'"

		Call DBExec(strSql, "main") : Call DBClose(DBCon)

		msg = "주소설정이 완료 되었습니다."
	ElseIf command = "reser" Then
		care_area_post = fncRequest("care_area_post")
		care_area_address1 = fncRequest("care_area_address1")
		care_area_address2 = fncRequest("care_area_address2")
		care_area_place_value = fncRequest("care_area_place_value")
		childbirth = Replace(fncRequest("childbirth"), "-", "")
		childbirth_form1_value = fncRequest("childbirth_form1_value")
		childbirth_form2_value = fncRequest("childbirth_form2_value")
		breast_feeding_form_value = fncRequest("breast_feeding_form_value")
		childbirth_experience_value = fncRequest("childbirth_experience_value")
		carecenter_use_chk_value = fncRequest("carecenter_use_chk_value")
		carecenter_date = Replace(fncRequest("carecenter_date"), "-", "")
		carecenter_use_value = fncRequest("carecenter_use_value")
		family_value = fncRequest("family_value")

		mr_unique = fncRequest("mr_unique")

		If childbirth_form2_value = "" Then
			childbirth_form2_value = Replace(mr_unique, "쌍둥이|| ", "")
		Else
			If InStr(mr_unique, "쌍둥이") > 0 Then
				childbirth_form2_value = mr_unique
			Else
				If mr_unique <> "" Then
					childbirth_form2_value = "쌍둥이|| " & mr_unique
				End If
			End If
		End If

		strSql = "SELECT"
		strSql = strSql & " MR_CARE_PLACE_POST"
		strSql = strSql & " , MR_CARE_PLACE_ADDR1"
		strSql = strSql & " , MR_CARE_PLACE_ADDR2"
		strSql = strSql & " , MR_CARE_PLACE"
		strSql = strSql & " , MR_CHILDBIRTH"
		strSql = strSql & " , MR_CHILDBIRTH_FORM"
		strSql = strSql & " , MR_UNIQUE"
		strSql = strSql & " , MR_BREAST_FEEDING"
		strSql = strSql & " , MR_EXPER"
		strSql = strSql & " , MR_CLINIC"
		strSql = strSql & " , MR_CLINIC_DATE"
		strSql = strSql & " , MR_CLINIC_PERIOD"
		strSql = strSql & " , MR_FAMILY"
		strSql = strSql & " FROM MO_RESERVATION"
		strSql = strSql & " WHERE MR_IDX = '" & mr_idx & "'"

		Set Rs = DBExec(strSql, "main")

		If Not Rs.Eof Then
			oldDataColumn = "MR_CARE_PLACE_POST, MR_CARE_PLACE_ADDR1, MR_CARE_PLACE_ADDR2, MR_CARE_PLACE, MR_CHILDBIRTH, MR_CHILDBIRTH_FORM, MR_UNIQUE, MR_BREAST_FEEDING, MR_EXPER, MR_CLINIC, MR_CLINIC_DATE, MR_CLINIC_PERIOD, MR_FAMILY"
			oldDataColumnArr = Split(oldDataColumn, ", ")

			newDataColumn = "care_area_post, care_area_address1, care_area_address2, care_area_place_value, childbirth, childbirth_form1_value, childbirth_form2_value, breast_feeding_form_value, childbirth_experience_value, carecenter_use_chk_value, carecenter_date, carecenter_use_value, family_value"
			newDataColumnArr = Split(newDataColumn, ", ")

			For i = 0 To UBound(newDataColumnArr)
				oldData = Rs(oldDataColumnArr(i))

				newData = fncRequest(newDataColumnArr(i))

				If newDataColumnArr(i) = "carecenter_date" Or newDataColumnArr(i) = "childbirth" Then
					newData = Replace(newData, "-", "")
				End If

				If newDataColumnArr(i) = "childbirth_form2_value" Then
					If newData = "" Then
						newData = Replace(mr_unique, "쌍둥이|| ", "")
					Else
						If InStr(mr_unique, "쌍둥이") > 0 Then
							newData = mr_unique
						Else
							If mr_unique <> "" Then
								newData = "쌍둥이|| " & mr_unique
							End If
						End If
					End If
				End If
				
				If oldData <> newData Then
					strHisSql = "INSERT INTO MO_APP_MY_DATA_HISTORY(MR_IDX, MH_NAME, MH_OLD_CONTENT, MH_NEW_CONTENT, MH_ID) VALUES('" & mr_idx & "', '" & oldDataColumnArr(i) & "', '" & oldData & "', '" & newData & "', '" & user_id & "');"
					Call DBExec(strHisSql, "main")
				End If
			Next
		End If

		Call DBClose(DBCon)

		strSql = "UPDATE MO_RESERVATION SET"
		strSql = strSql & " MR_CARE_PLACE_POST = '" & care_area_post & "'"
		strSql = strSql & " , MR_CARE_PLACE_ADDR1 = '" & care_area_address1 & "'"
		strSql = strSql & " , MR_CARE_PLACE_ADDR2 = '" & care_area_address2 & "'"
		strSql = strSql & " , MR_CARE_PLACE = '" & care_area_place_value & "'"
		strSql = strSql & " , MR_CHILDBIRTH = '" & childbirth & "'"
		strSql = strSql & " , MR_CHILDBIRTH_FORM = '" & childbirth_form1_value & "'"
		strSql = strSql & " , MR_UNIQUE = '" & childbirth_form2_value & "'"
		strSql = strSql & " , MR_BREAST_FEEDING = '" & breast_feeding_form_value & "'"
		strSql = strSql & " , MR_EXPER = '" & childbirth_experience_value & "'"
		strSql = strSql & " , MR_CLINIC = '" & carecenter_use_chk_value & "'"
		strSql = strSql & " , MR_CLINIC_DATE = '" & carecenter_date & "'"
		strSql = strSql & " , MR_CLINIC_PERIOD = '" & carecenter_use_value & "'"
		strSql = strSql & " , MR_FAMILY = '" & family_value & "'"
		strSql = strSql & " WHERE MR_IDX = '" & mr_idx & "'"

		Call DBExec(strSql, "main") : Call DBClose(DBCon)

		msg = "고객정보 변경이 완료 되었습니다."
	ElseIf command = "security" Then
		user_pwd = fncRequest("user_pwd")
		hp1 = fncRequest("hp1")
		hp2 = fncRequest("hp2")
		hp3 = fncRequest("hp3")
		hp = hp1 & "-" & hp2 & "-" & hp3
		
		If user_pwd <> "" Then
			strSql = "UPDATE MO_MEM_MAS SET"
			strSql = strSql & " MM_MEM_PW = dbo.UF_MD5('" & user_pwd & "')"
			strSql = strSql & " WHERE MM_MEM_ID = '" & user_id & "'"

			Call DBExec(strSql, "main") : Call DBClose(DBCon)
		End If

		strSql = "UPDATE MO_MEM_DTL SET"
		strSql = strSql & " MD_HP = '" & hp & "'"
		strSql = strSql & " WHERE MD_MEM_ID = '" & user_id & "'"
	
		Call DBExec(strSql, "main") : Call DBClose(DBCon)

		msg = "보안정보 변경이 완료 되었습니다."
	End If

	If msg <> "" Then
		Response.Write "<script type='text/javascript'>alert('" & msg & "'); parent.location.reload();</script>"
	End If
%>