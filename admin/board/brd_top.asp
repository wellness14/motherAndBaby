			<form id="sFrm" name="sFrm" method="get" action="?">
			<input type="hidden" name="brd_id" value="<%=brd_id%>">
			<div class="selection">
				검 색 : 
				<select name="smode" class="box">
					<option value="">- 검색 조건 - </option>
					<option value="1" <%=fncSetSelectBox(smode,"1")%>>글제목</option>
					<option value="2" <%=fncSetSelectBox(smode,"2")%>>글내용</option>
					<option value="3" <%=fncSetSelectBox(smode,"3")%>>글제목 + 글내용</option>
				</select>
				<input type="text" name="sword" size="40" maxlength="40" value="<%=sword%>"/>
				<a onClick="jQuery('#sFrm').submit();" style="cursor:pointer;" class="button">검 색</a>

				<a onClick="location.href='<%=urlList%>?brd_id=<%=brd_id%>';" style="cursor:pointer;" class="button">전체 리스트</a>
				<span style="margin-left:20px;">
					<a onClick="location.href='<%=urlIns%>?<%=strLnkUrl%>'" style="cursor:pointer;" class="button">등록</a>
				</span>
			</div>
			</form>

			<!-- <div class="tb_tab">
				<div>
					<a href="Pmp_Item_List.asp?cat1=P"<% If cat1 = "P" Then %> class="on"<% End If %>>PMP 마스터</a>
					<a href="Dic_Item_List.asp?cat1=D"<% If cat1 = "D" Then %> class="on"<% End If %>>전자사전 마스터</a>
					<a href="Acc_Item_List.asp?cat1=A"<% If cat1 = "A" Then %> class="on"<% End If %>>액세서리 마스터</a>
					<a href="Pmp_Item_List.asp?cat1=T"<% If cat1 = "T" Then %> class="on"<% End If %>>태블릿PC 마스터</a>
				</div>
			</div> -->