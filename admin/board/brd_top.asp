			<form id="sFrm" name="sFrm" method="get" action="?">
			<input type="hidden" name="brd_id" value="<%=brd_id%>">
			<div class="selection">
				�� �� : 
				<select name="smode" class="box">
					<option value="">- �˻� ���� - </option>
					<option value="1" <%=fncSetSelectBox(smode,"1")%>>������</option>
					<option value="2" <%=fncSetSelectBox(smode,"2")%>>�۳���</option>
					<option value="3" <%=fncSetSelectBox(smode,"3")%>>������ + �۳���</option>
				</select>
				<input type="text" name="sword" size="40" maxlength="40" value="<%=sword%>"/>
				<a onClick="jQuery('#sFrm').submit();" style="cursor:pointer;" class="button">�� ��</a>

				<a onClick="location.href='<%=urlList%>?brd_id=<%=brd_id%>';" style="cursor:pointer;" class="button">��ü ����Ʈ</a>
				<span style="margin-left:20px;">
					<a onClick="location.href='<%=urlIns%>?<%=strLnkUrl%>'" style="cursor:pointer;" class="button">���</a>
				</span>
			</div>
			</form>

			<!-- <div class="tb_tab">
				<div>
					<a href="Pmp_Item_List.asp?cat1=P"<% If cat1 = "P" Then %> class="on"<% End If %>>PMP ������</a>
					<a href="Dic_Item_List.asp?cat1=D"<% If cat1 = "D" Then %> class="on"<% End If %>>���ڻ��� ������</a>
					<a href="Acc_Item_List.asp?cat1=A"<% If cat1 = "A" Then %> class="on"<% End If %>>�׼����� ������</a>
					<a href="Pmp_Item_List.asp?cat1=T"<% If cat1 = "T" Then %> class="on"<% End If %>>�º�PC ������</a>
				</div>
			</div> -->