<!--정보확인 팝업-->
<div class="modal fade" id="infoModal" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel"><div class="cus-modal-title">주소확인</div></h4>
			</div>
			<div class="modal-body">
				서비스의 원활한 제공을 위해 필요한 정보 입니다.<br/>
				입력하신 정보는<br/>
				케어프로그램 서비스를 제공하기 위한 방문정보로만 활용됩니다.
				<div class="cus-modal-btn-area">
					<a href="setting.asp"><input type="button" name="address" id="address" class="cus-modal-btn" value="설정하기"  /></a>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="cus-modal-confirm" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

<!--서비스정보 팝업-->
<div class="modal fade" id="serviceModal" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel"><div class="cus-modal-title">서비스정보</div></h4>
			</div>
			<div class="modal-body">
				<table class="table">
					<colgroup>
						<col width="30%" />
						<col width="70%" />
					</colgroup>
					<thead>
						<tr>
							<th>구분</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>서비스 유형</th>
							<td><%=service_name%> / <%=service_type%> / <%=service_period%></td>
						</tr>
						<tr>
							<th>서비스 기간</th>
							<td><%=dateConvert2(servicesdt)%> ~ <%=dateConvert2(serviceedt)%></td>
						</tr>
						<tr>
							<th>신청일</th>
							<td><%=dateConvert2(reg_dt)%></td>
						</tr>
						<% If payment_res_dt <> "" Then %>
						<tr>
							<th>선금</th>
							<td><%=numberFormatConvert(payment)%>원</td>
						</tr>
						<% End If %>
						<tr>
							<th>수단</th>
							<td><%=pay_type%></td>
						</tr>
						<tr>
							<th>결제여부</th>
							<td><%=payment_state%></td>
						</tr>
						<% If content <> "" Then %>
						<tr>
							<th>상담내용</th>
							<td><%=Replace(content, Chr(10), "<br/>")%></td>
						</tr>
						<% End If %>
						<tr>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="cus-modal-confirm" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

<!--대여알림 팝업-->
<div class="modal fade" id="rentModal" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel"><div class="cus-modal-title">대여알림</div></h4>
			</div>
			<div class="modal-body">
				<img src="http://mothernbaby.co.kr/mobileweb/html/images/sub35_01.jpg" style="width:100%; padding:10px;" />
				<div class="cus-modal-btn-area">
					<a href="tel:02-557-3579"><input type="button" name="address" id="address" class="cus-modal-btn" value="통화하기"  /></a>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="cus-modal-confirm" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

<!--출산선물 팝업-->
<div class="modal fade" id="giftModal" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel"><div class="cus-modal-title">출산선물</div></h4>
			</div>
			<div class="modal-body">
				<img src="/image/giftbtn1.jpg" style="width:100%; padding:10px;"><br>
				<img src="/image/gift01.jpg" style="width:100%; padding:10px;"><br>
				<img src="/image/giftbtn2.jpg" style="width:100%; padding:10px;"><br>
				<img src="/image/gift02.jpg" style="width:100%; padding:10px;"><br>
				<img src="/image/giftbtn3.jpg" style="width:100%; padding:10px;"><br>
				<img src="/image/gift04.jpg" style="width:100%; padding:10px;"><br>
				<img src="/image/giftbtn4.jpg" style="width:100%; padding:10px;"><br>
				<img src="/image/gift04.jpg" style="width:100%; padding:10px;"><br>
			</div>
			<div class="modal-footer">
				<button type="button" class="cus-modal-confirm" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

<!--만족도조사 팝업-->
<div class="modal fade" id="satisfactionModal" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel"><div class="cus-modal-title">만족도조사</div></h4>
			</div>
			<div class="modal-body">
				<div class="plan_box_01_sub"> 
					 <div id="star1" > 산후도우미 </div><br>
					 <div id="star2" > 전담간호사 </div><br>
					 <div id="star3" > 바디케어 </div><br>
					 <div id="star4" > 모유수유마사지 </div><br>
					 <div id="star5" > 모유성분 분석 </div><br>
					 <div id="star6" > 아기맞이 소독 </div><br> 
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="cus-modal-confirm" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

<!--서비스정보 팝업-->
<div class="modal fade" id="infoDetailModal" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel"><div class="cus-modal-title">정보확인</div></h4>
			</div>
			<div class="modal-body">
				<div style="font-weight:bold; font-size:14pt; margin-bottom:20px;"><%=nm%> 고객님</div>
				<div style="font-weight:bold; font-size:13pt;">가입프로그램</div>
				&nbsp;&nbsp;&nbsp;&nbsp;- <%=nm%> 고객님 서비스정보<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;- <%=service_name%> / <%=service_type%> / <%=service_period%><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;- <%=dateConvert2(servicesdt)%> 시작예정<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;- <%=dateConvert2(serviceedt)%> 종료예정<br/><br/>

				<span style="font-weight:bold; font-size:13pt;">지점</span>&nbsp;&nbsp;<%=cc_kor_nm%><br/><br/>
				<span style="font-weight:bold; font-size:13pt;">산후조리장소</span>&nbsp;&nbsp;<%=care_place%><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;- 우편번호: <%=care_place_post%><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;- 주소: <%=care_place_addr1%><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;- 상세주소: <%=care_place_addr2%><br/><br/>

				<span style="font-weight:bold; font-size:13pt;">출산예정일</span> <%=dateConvert4(childbirth)%><br/><br/>
				<span style="font-weight:bold; font-size:13pt;">분만형태</span> <%=childbirth_form%><br/><br/>
				<span style="font-weight:bold; font-size:13pt;">출산경험</span> <%=exper%><br/><br/>
				<div style="font-weight:bold; font-size:13pt;">산후조리원이용</div>
				&nbsp;&nbsp;&nbsp;&nbsp;- 입실일: <%=dateConvert4(clinic_date)%><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;- 입실기간: <%=clinic_period%>

				<div class="cus-modal-btn-area">
					<a href="setting.asp"><input type="button" name="address" id="address" class="cus-modal-btn" value="설정하기"  /></a>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="cus-modal-confirm" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>