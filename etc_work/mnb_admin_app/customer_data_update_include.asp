					<div class="my_box_01_1" id="info_box_04_sub_<%=MS_SEQ%>" style="display:none;">
						<div class="my_box_02_2">
							<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
						</div>
						<div class="my_box_03">
							<%=check_name%>
						</div>

<%

    If idx <> "" Then
		strTable = " FROM MO_BRD_SERVICE WITH(NOLOCK) "

	 	strWhere = " WHERE MS_CNLKBN='N' AND MS_IDX = '"& idx &"' order by MS_IDX  desc " 
		strSql = ""
		strSql = strSql & "	;SELECT * "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
  
			MS_IDX = Rs(0)
			MS_MEM_ID = Rs(1)
			MS_MEM_NM = Rs(2)
			MS_BIRTH = Rs(3)
			MS_PHONE = Rs(4)
			MS_HP = Rs(5)
			MS_POST = Rs(6)
			MS_ADDR1 = Rs(7)
			MS_ADDR2 = Rs(8)
			MS_SERVICE = Rs(9)
			MS_PERIOD = Rs(10)
			MS_TYPE = Rs(11)
			MS_CHILDBIRTH = Rs(12) 
			MS_SERVICEDT = Rs(13)
			MS_CLINIC = Rs(14)
			MS_EXPER = Rs(15)
			MS_UNIQUE = Rs(16)
			MS_FAMILY = Rs(17)
			MS_CONTENT = Rs(18)
			MS_PROVISION_1 = Rs(19)
			MS_PROVISION_2 = Rs(20)
			MS_CNLKBN = Rs(21)
			MS_REG_DT = Rs(22)
			MD_LOCAL = Rs(23) 
			MS_END = Rs(24)
			MS_JUMIN1 = Rs(25)
			MS_JUMIN2 = Rs(26)
			MS_CONTENT_2 = Rs(27)     
			MD_LOCAL_DETAIL = Rs(28)  
			hospital_date		= Rs(29) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			hospital_post		= Rs(30) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			hospital_address1	= Rs(31) ' 상담자 메모 관리자만 볼수있음. -- 사용안함 
			MS_SEX = Rs(32) 
			MS_AGREE1 = Rs(33) 
			MS_AGREE2 = Rs(34) 
			MS_AGREE3 = Rs(35) 
			MS_AGREE4 = Rs(36) 
			MS_AGREE5 = Rs(37) 

			mode = "upd"
			arrList = Rs.getRows()
		End If 
		Call RSClose(Rs)
	 
	
		If MS_SEX = "1" Then 
			MS_SEX = "남자"
		Else
			MS_SEX = "여자"
		End if
		'	등록 상품 호출
		strSql = ""
		strSql = "; select cc_kor_nm2 from [MO_COMM_CD] where cc_comm_cd = '"& MD_LOCAL &"'  "
	 
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOf Then 
			local_name = Rs(0)
			arrProdt = Rs.getRows()
		End If 
		Call RSClose(Rs)

	End If  

	MS_UNIQUE = Replace(MS_UNIQUE,"||",",")
	MS_FAMILY = Replace(MS_FAMILY,"||",",")
%>
   
					<div class="my_box_01_sub">
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:10px;"><%=mem_nm%> 산모님의 서비스정보입니다.</span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">서비스 프로그램 : <%=MS_SERVICE%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">이용기간 : <%=MS_PERIOD%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">이용형태 : <%=MS_TYPE%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">출산예정일 : <%=Left(MS_CHILDBIRTH,4)%>.<%=mid(MS_CHILDBIRTH,5,2)%>.<%=right(MS_CHILDBIRTH,2)%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">서비스희망일 : <%=Left(MS_SERVICEDT,4)%>.<%=mid(MS_SERVICEDT,5,2)%>.<%=right(MS_SERVICEDT,2)%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">지점 : <%=local_name%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">조리원 : <%=MS_CLINIC%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">출산경험 : <%=MS_EXPER%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">특이사항 : <%=MS_UNIQUE%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">가족사항 : <%=MS_FAMILY%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">입원병원날짜 : <%=Left(hospital_date,4)%>.<%=mid(hospital_date,5,2)%>.<%=right(hospital_date,2)%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">입원병원주소 : <%=hospital_address1%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">상담내용 : <%=MS_CONTENT%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">생년월일 : <%=Left(MS_BIRTH,4)%>.<%=mid(MS_BIRTH,5,2)%>.<%=right(MS_BIRTH,2)%> </span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">성별 : <%=MS_SEX%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">휴대폰 : <%=MS_HP%></span></div> 

						<input type="button" name="close_btn" id="close_btn_<%=MS_SEQ%>" class="info_input_02_22" value="닫기" onclick="close_div('<%=MS_SEQ%>');"/>
					</div>
				</div>