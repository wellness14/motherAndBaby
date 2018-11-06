<%
	Function numStr(value)
		If Len(value) = 1 Then
			numStr = "0" & value
		Else
			numStr = value
		End If
	End Function

	Function dateConvert1(value)
		dateConvert1 = Left(value, 4) & "-" & Mid(value, 5, 2) & "-" & Right(value, 2)
	End Function

	Function dateConvert2(value)
		dateConvert2 = Left(value, 4) & "년 " & Mid(value, 5, 2) & "월 " & Right(value, 2) & "일"
	End Function

	Function dateConvert3(value)
		dateConvert3 = numStr(Mid(value, 5, 2)) & "-" & numStr(Right(value, 2))
	End Function

	Function dateConvert4(value)
		dateConvert4 = Left(value, 4) & "." & Mid(value, 5, 2) & "." & Right(value, 2)
	End Function

	Function numberFormatConvert(value)
		If IsNull(value) Or value = "" Then
			value = 0
		End If
		
		numberFormatConvert = FormatNumber(value, 0)
	End Function

	Function serviceCount(value1, value2)
		Dim value3

		value3 = value2 & "(0회)"

		If value2 = "전담간호사 방문서비스" Then
			If value1 = "프라이빗2주" Or value1 = "프라이빗3주" Or value1 = "프라이빗4주" Then
				value3 = value2 & " (택2회)"
			ElseIf value1 = "다둥이4주" Or value1 = "워킹맘4주" Or value1 = "과체중4주" Or value1 = "35세이상4주" Or value1 = "산후조리원을 내집4주" Then
				value3 = value2 & " (3회)"
			End If
		End If

		If value2 = "산전/산후 바디케어" Then
			If value1 = "프라이빗2주" Then
				value3 = value2 & " (택2회)"
			ElseIf value1 = "프라이빗3주" Or value1 = "프라이빗4주" Then
				value3 = value2 & " (택3회)"
			ElseIf value1 = "다둥이4주" Or value1 = "워킹맘4주" Then
				value3 = value2 & " (5회)"
			ElseIf value1 = "과체중4주" Then
				value3 = value2 & " (7회)"
			ElseIf value1 = "35세이상4주" Or value1 = "산후조리원을 내집4주" Then
				value3 = value2 & " (10회)"
			End If
		End If

		If value2 = "모유수유마사지" Then
			If value1 = "다둥이4주" Then
				value3 = value2 & " (2회)"
			End If
		End If

		If value2 = "모유성분 분석서비스" Then
			If value1 = "프라이빗2주" Or value1 = "프라이빗3주" Or value1 = "프라이빗4주" Then
				value3 = value2 & " (1회)"
			ElseIf value1 = "다둥이4주" Or value1 = "워킹맘4주" Or value1 = "과체중4주" Or value1 = "35세이상4주" Or value1 = "산후조리원을 내집4주" Then
				value3 = value2 & " (1회)"
			End If
		End If

		If value2 = "아기맞이 소독서비스" Then
			If value1 = "프라이빗2주" Or value1 = "프라이빗3주" Or value1 = "프라이빗4주" Then
				value3 = value2 & " (1회)"
			ElseIf value1 = "다둥이4주" Or value1 = "워킹맘4주" Or value1 = "과체중4주" Or value1 = "35세이상4주" Or value1 = "산후조리원을 내집4주" Then
				value3 = value2 & " (1회)"
			End If
		End If

		serviceCount = value3
	End Function

	Function myMnb(i, total, value1, value2, value3, check_date)
		Dim rtnValue
		
		rtnValue = ""

		If value1 = "address" Then
			rtnValue = rtnValue & "		<div class=""my-mnb-card"">"
			rtnValue = rtnValue & "			<div class=""my-mnb-card-icon-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-icon""><img src=""img/mb_gps.png"" /></div>"
			If i = total Then
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div></div>"
			Else
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div> <img src=""img/mb_line.png"" /></div>"
			End If
			rtnValue = rtnValue & "			</div>"
			
			rtnValue = rtnValue & "			<div class=""my-mnb-card-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-left6""></div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-top""><span class=""my-mnb-card-box-top-title6"">[정보확인]</span> " & value2 & "</div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-bottom"">" & value3 & "</div>"
			rtnValue = rtnValue & "			</div>"
			rtnValue = rtnValue & "		</div>"
		ElseIf value1 = "gift" Then
			rtnValue = rtnValue & "		<div class=""my-mnb-card"">"
			rtnValue = rtnValue & "			<div class=""my-mnb-card-icon-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-icon""><img src=""img/mb_pur_heart.png"" /></div>"
			If i = total Then
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div></div>"
			Else
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div> <img src=""img/mb_line.png"" /></div>"
			End If
			rtnValue = rtnValue & "			</div>"
			
			rtnValue = rtnValue & "			<div class=""my-mnb-card-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-left5""></div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-top""><span class=""my-mnb-card-box-top-title5"">[서비스정보]</span> " & value2 & "</div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-bottom"">" & value3 & "</div>"
			rtnValue = rtnValue & "			</div>"
			rtnValue = rtnValue & "		</div>"
		ElseIf value1 = "service" Then
			rtnValue = rtnValue & "		<div class=""my-mnb-card"">"
			rtnValue = rtnValue & "			<div class=""my-mnb-card-icon-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-icon""><img src=""img/mb_pur_heart.png"" /></div>"
			If i = total Then
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div></div>"
			Else
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div> <img src=""img/mb_line.png"" /></div>"
			End If
			rtnValue = rtnValue & "			</div>"
			
			rtnValue = rtnValue & "			<div class=""my-mnb-card-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-left5""></div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-top""><span class=""my-mnb-card-box-top-title5"">[서비스정보]</span> " & value2 & "</div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-bottom"">" & value3 & "</div>"
			rtnValue = rtnValue & "			</div>"
			rtnValue = rtnValue & "		</div>"
		ElseIf value1 = "helper" Then
			rtnValue = rtnValue & "		<div class=""my-mnb-card"">"
			rtnValue = rtnValue & "			<div class=""my-mnb-card-icon-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-icon""><img src=""img/mb_org_heart.png"" /></div>"
			If i = total Then
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div></div>"
			Else
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div> <img src=""img/mb_line.png"" /></div>"
			End If
			rtnValue = rtnValue & "			</div>"
			
			rtnValue = rtnValue & "			<div class=""my-mnb-card-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-left4""></div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-top""><span class=""my-mnb-card-box-top-title4"">[산후도우미]</span> " & value2 & "</div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-bottom"">" & value3 & "</div>"
			rtnValue = rtnValue & "			</div>"
			rtnValue = rtnValue & "		</div>"
		ElseIf value1 = "helper_visit" Then
			rtnValue = rtnValue & "		<div class=""my-mnb-card"">"
			rtnValue = rtnValue & "			<div class=""my-mnb-card-icon-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-icon""><img src=""img/mb_red_calen.png"" /></div>"
			If i = total Then
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div></div>"
			Else
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div> <img src=""img/mb_line.png"" /></div>"
			End If
			rtnValue = rtnValue & "			</div>"
			
			rtnValue = rtnValue & "			<div class=""my-mnb-card-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-left3""></div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-top""><span class=""my-mnb-card-box-top-title3"">[스케쥴]</span> " & value2 & "</div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-bottom"">" & value3 & "</div>"
			rtnValue = rtnValue & "			</div>"
			rtnValue = rtnValue & "		</div>"
		ElseIf value1 = "bodycare" Then
			rtnValue = rtnValue & "		<div class=""my-mnb-card"">"
			rtnValue = rtnValue & "			<div class=""my-mnb-card-icon-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-icon""><img src=""img/mb_blue_calen.png"" /></div>"
			If i = total Then
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div></div>"
			Else
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div> <img src=""img/mb_line.png"" /></div>"
			End If
			rtnValue = rtnValue & "			</div>"
			
			rtnValue = rtnValue & "			<div class=""my-mnb-card-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-left2""></div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-top""><span class=""my-mnb-card-box-top-title2"">[스케쥴]</span> " & value2 & "</div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-bottom"">" & value3 & "</div>"
			rtnValue = rtnValue & "			</div>"
			rtnValue = rtnValue & "		</div>"
		ElseIf value1 = "nurse_visit" Then
			rtnValue = rtnValue & "		<div class=""my-mnb-card"">"
			rtnValue = rtnValue & "			<div class=""my-mnb-card-icon-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-icon""><img src=""img/mb_blue_calen.png"" /></div>"
			If i = total Then
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div></div>"
			Else
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div> <img src=""img/mb_line.png"" /></div>"
			End If
			rtnValue = rtnValue & "			</div>"
			
			rtnValue = rtnValue & "			<div class=""my-mnb-card-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-left2""></div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-top""><span class=""my-mnb-card-box-top-title2"">[스케쥴]</span> " & value2 & "</div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-bottom"">" & value3 & "</div>"
			rtnValue = rtnValue & "			</div>"
			rtnValue = rtnValue & "		</div>"
		ElseIf value1 = "mom_milk_analysis" Then
			rtnValue = rtnValue & "		<div class=""my-mnb-card"">"
			rtnValue = rtnValue & "			<div class=""my-mnb-card-icon-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-icon""><img src=""img/mb_blue_calen.png"" /></div>"
			If i = total Then
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div></div>"
			Else
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div> <img src=""img/mb_line.png"" /></div>"
			End If
			rtnValue = rtnValue & "			</div>"
			
			rtnValue = rtnValue & "			<div class=""my-mnb-card-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-left2""></div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-top""><span class=""my-mnb-card-box-top-title2"">[스케쥴]</span> " & value2 & "</div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-bottom"">" & value3 & "</div>"
			rtnValue = rtnValue & "			</div>"
			rtnValue = rtnValue & "		</div>"
		ElseIf value1 = "sodok" Then
			rtnValue = rtnValue & "		<div class=""my-mnb-card"">"
			rtnValue = rtnValue & "			<div class=""my-mnb-card-icon-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-icon""><img src=""img/mb_blue_calen.png"" /></div>"
			If i = total Then
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div></div>"
			Else
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div> <img src=""img/mb_line.png"" /></div>"
			End If
			rtnValue = rtnValue & "			</div>"
			
			rtnValue = rtnValue & "			<div class=""my-mnb-card-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-left2""></div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-top""><span class=""my-mnb-card-box-top-title2"">[스케쥴]</span> " & value2 & "</div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-bottom"">" & value3 & "</div>"
			rtnValue = rtnValue & "			</div>"
			rtnValue = rtnValue & "		</div>"
		ElseIf value1 = "mom_milk_msg" Then
			rtnValue = rtnValue & "		<div class=""my-mnb-card"">"
			rtnValue = rtnValue & "			<div class=""my-mnb-card-icon-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-icon""><img src=""img/mb_blue_calen.png"" /></div>"
			If i = total Then
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div></div>"
			Else
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div> <img src=""img/mb_line.png"" /></div>"
			End If
			rtnValue = rtnValue & "			</div>"
			
			rtnValue = rtnValue & "			<div class=""my-mnb-card-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-left2""></div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-top""><span class=""my-mnb-card-box-top-title2"">[스케쥴]</span> " & value2 & "</div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-bottom"">" & value3 & "</div>"
			rtnValue = rtnValue & "			</div>"
			rtnValue = rtnValue & "		</div>"
		ElseIf value1 = "add_service1" Then
			rtnValue = rtnValue & "		<div class=""my-mnb-card"">"
			rtnValue = rtnValue & "			<div class=""my-mnb-card-icon-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-icon""><img src=""img/mb_red_calen.png"" /></div>"
			If i = total Then
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div></div>"
			Else
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div> <img src=""img/mb_line.png"" /></div>"
			End If
			rtnValue = rtnValue & "			</div>"
			
			rtnValue = rtnValue & "			<div class=""my-mnb-card-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-left3""></div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-top""><span class=""my-mnb-card-box-top-title3"">[스케쥴]</span> " & value2 & "</div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-bottom"">" & value3 & "</div>"
			rtnValue = rtnValue & "			</div>"
			rtnValue = rtnValue & "		</div>"
		ElseIf value1 = "add_service2" Then
			rtnValue = rtnValue & "		<div class=""my-mnb-card"">"
			rtnValue = rtnValue & "			<div class=""my-mnb-card-icon-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-icon""><img src=""img/mb_red_calen.png"" /></div>"
			If i = total Then
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div></div>"
			Else
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div> <img src=""img/mb_line.png"" /></div>"
			End If
			rtnValue = rtnValue & "			</div>"
			
			rtnValue = rtnValue & "			<div class=""my-mnb-card-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-left3""></div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-top""><span class=""my-mnb-card-box-top-title3"">[스케쥴]</span> " & value2 & "</div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-bottom"">" & value3 & "</div>"
			rtnValue = rtnValue & "			</div>"
			rtnValue = rtnValue & "		</div>"
		ElseIf value1 = "add_service3" Then
			rtnValue = rtnValue & "		<div class=""my-mnb-card"">"
			rtnValue = rtnValue & "			<div class=""my-mnb-card-icon-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-icon""><img src=""img/mb_red_calen.png"" /></div>"
			If i = total Then
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div></div>"
			Else
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div> <img src=""img/mb_line.png"" /></div>"
			End If
			rtnValue = rtnValue & "			</div>"
			
			rtnValue = rtnValue & "			<div class=""my-mnb-card-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-left3""></div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-top""><span class=""my-mnb-card-box-top-title3"">[스케쥴]</span> " & value2 & "</div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-bottom"">" & value3 & "</div>"
			rtnValue = rtnValue & "			</div>"
			rtnValue = rtnValue & "		</div>"
		ElseIf value1 = "pay" Then
			rtnValue = rtnValue & "<div class=""my-mnb-card"">"
			rtnValue = rtnValue & "			<div class=""my-mnb-card-icon-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-icon""><img src=""img/mb_bell.png"" /></div>"
			If i = total Then
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div></div>"
			Else
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div> <img src=""img/mb_line.png"" /></div>"
			End If
			rtnValue = rtnValue & "			</div>"
			
			rtnValue = rtnValue & "			<div class=""my-mnb-card-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-left1""></div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-top""><span class=""my-mnb-card-box-top-title1"">[결제]</span> " & value2 & "</div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-bottom"">" & value3 & "</div>"
			rtnValue = rtnValue & "			</div>"
			rtnValue = rtnValue & "		</div>"
		ElseIf value1 = "add_pay1" Then
			rtnValue = rtnValue & "<div class=""my-mnb-card"">"
			rtnValue = rtnValue & "			<div class=""my-mnb-card-icon-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-icon""><img src=""img/mb_bell.png"" /></div>"
			If i = total Then
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div></div>"
			Else
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div> <img src=""img/mb_line.png"" /></div>"
			End If
			rtnValue = rtnValue & "			</div>"
			
			rtnValue = rtnValue & "			<div class=""my-mnb-card-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-left1""></div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-top""><span class=""my-mnb-card-box-top-title1"">[결제]</span> " & value2 & "</div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-bottom"">" & value3 & "</div>"
			rtnValue = rtnValue & "			</div>"
			rtnValue = rtnValue & "		</div>"
		ElseIf value1 = "add_pay2" Then
			rtnValue = rtnValue & "<div class=""my-mnb-card"">"
			rtnValue = rtnValue & "			<div class=""my-mnb-card-icon-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-icon""><img src=""img/mb_bell.png"" /></div>"
			If i = total Then
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div></div>"
			Else
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div> <img src=""img/mb_line.png"" /></div>"
			End If
			rtnValue = rtnValue & "			</div>"
			
			rtnValue = rtnValue & "			<div class=""my-mnb-card-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-left1""></div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-top""><span class=""my-mnb-card-box-top-title1"">[결제]</span> " & value2 & "</div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-bottom"">" & value3 & "</div>"
			rtnValue = rtnValue & "			</div>"
			rtnValue = rtnValue & "		</div>"
		ElseIf value1 = "add_pay3" Then
			rtnValue = rtnValue & "<div class=""my-mnb-card"">"
			rtnValue = rtnValue & "			<div class=""my-mnb-card-icon-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-icon""><img src=""img/mb_bell.png"" /></div>"
			If i = total Then
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div></div>"
			Else
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div> <img src=""img/mb_line.png"" /></div>"
			End If
			rtnValue = rtnValue & "			</div>"
			
			rtnValue = rtnValue & "			<div class=""my-mnb-card-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-left1""></div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-top""><span class=""my-mnb-card-box-top-title1"">[결제]</span> " & value2 & "</div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-bottom"">" & value3 & "</div>"
			rtnValue = rtnValue & "			</div>"
			rtnValue = rtnValue & "		</div>"
		ElseIf value1 = "premium_service" Then
			rtnValue = rtnValue & "		<div class=""my-mnb-card"">"
			rtnValue = rtnValue & "			<div class=""my-mnb-card-icon-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-icon""><img src=""img/mb_red_calen.png"" /></div>"
			If i = total Then
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div></div>"
			Else
				rtnValue = rtnValue & "				<div class=""my-mnb-card-line""><div class=""my-mnb-card-date"">" & dateConvert3(check_date) & "</div> <img src=""img/mb_line.png"" /></div>"
			End If
			rtnValue = rtnValue & "			</div>"
			
			rtnValue = rtnValue & "			<div class=""my-mnb-card-box"">"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-left3""></div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-top""><span class=""my-mnb-card-box-top-title3"">[스케쥴]</span> " & value2 & "</div>"
			rtnValue = rtnValue & "				<div class=""my-mnb-card-box-bottom"">" & value3 & "</div>"
			rtnValue = rtnValue & "			</div>"
			rtnValue = rtnValue & "		</div>"
		End If

		myMnb = rtnValue
	End Function
%>