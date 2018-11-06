			<form id="sFrm" name="sFrm" method="get" action="?">
			<input type="hidden" name="brd_id" value="<%=brd_id%>">
			<div class="selection">
				검색:
				<select name="smode" class="box">
					<option value="">조건</option>
					<option value="1" <%=fncSetSelectBox(smode,"1")%>>제목</option>
					<option value="2" <%=fncSetSelectBox(smode,"2")%>>내용</option>
					<option value="3" <%=fncSetSelectBox(smode,"3")%>>제목+내용</option>
				</select>
				<input type="text" name="sword" size="10" maxlength="10" value="<%=sword%>"/>
				<a onClick="jQuery('#sFrm').submit();" style="cursor:pointer;" class="button">검색</a>

				<a onClick="location.href='<%=urlList%>?brd_id=<%=brd_id%>';" style="cursor:pointer;" class="button">전체리스트</a>
 
					<a onClick="location.href='<%=urlIns%>?<%=strLnkUrl%>'" style="cursor:pointer;" class="button">등록</a>
 
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