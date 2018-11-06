	    <div id="mNav">
			<% If menuCode="10000" Then%> 
			<div class="inner_nav">
					<ul class="nav_category">
					<li <%If menuCode2="A" Then%>class="fst on"<%else%>class="fst"<%End if%>>
						<a href="sysop_list.asp" class="link_menu">운영자계정</a>
					</li>
					<li <%If menuCode2="B" Then%>class="fst on"<%else%>class="fst"<%End if%>>
						<a href="user_list.asp" class="link_menu">사용자계정</a>
					</li>
					<li <%If menuCode2="C" Then%>class="fst on"<%else%>class="fst"<%End if%>>
						<a href="device_list.asp" class="link_menu">디바이스정보</a>
					</li>
				</ul>
			</div>
			<% ElseIf menuCode="20000" Then%> 
			<div class="inner_nav">
					<ul class="nav_category">
					<li <%If menuCode2="A" Then%>class="fst on"<%else%>class="fst"<%End if%>>
						<a href="userlog.asp" class="link_menu">체험로그</a>
					</li>
					<li <%If menuCode2="B" Then%>class="on"<%else%><%End if%>>
						<a href="shoplist.asp" class="link_menu">지역정보관리</a>
					</li>
				</ul>
			</div>
			<% ElseIf menuCode="30000" Then%> 
			<div class="inner_nav">
					<ul class="nav_category">
					<li <%If menuCode2="A" Then%>class="fst on"<%else%>class="fst"<%End if%>>
						<a href="userlist.asp" class="link_menu">유저참여로그</a>
					</li>
					<li <%If menuCode2="B" Then%>class="on"<%else%><%End if%>>
						<a href="goodslist.asp" class="link_menu">출산용품관리</a>
					</li>
				</ul>
			</div>
			<% ElseIf menuCode="40000" Then%> 
			<div class="inner_nav">
					<ul class="nav_category">
					<li <%If menuCode2="A" Then%>class="fst on"<%else%>class="fst"<%End if%>>
						<a href="list.asp?CFlag=G" class="link_menu">사용자스토리커뮤니티</a>
					</li>
					<li <%If menuCode2="B" Then%>class="on"<%else%><%End if%>>
						<a href="list.asp?CFlag=S" class="link_menu">공식스토리커뮤니티</a>
					</li>
					<li <%If menuCode2="D" Then%>class="on"<%else%><%End if%>>
						<a href="commentlist.asp" class="link_menu">댓글리스트</a>
					</li>
					<li <%If menuCode2="C" Then%>class="on"<%else%><%End if%>>
						<a href="cate_list.asp" class="link_menu">분류관리</a>
					</li>
				</ul>
			</div>
			<% ElseIf menuCode="50000" Then%> 
			<div class="inner_nav">
					<ul class="nav_category">
					<li <%If menuCode2="A" Then%>class="fst on"<%else%>class="fst"<%End if%>>
						<a href="list.asp?bbscode=001" class="link_menu">공지사항</a>
					</li>
					<li <%If menuCode2="B" Then%>class="on"<%else%><%End if%>>
						<a href="list.asp?bbscode=002" class="link_menu">뉴스</a>
					</li>
					<li <%If menuCode2="C" Then%>class="on"<%else%><%End if%>>
						<a href="list.asp?bbscode=003" class="link_menu">이벤트</a>
					</li>
					<li <%If menuCode2="D" Then%>class="on"<%else%><%End if%>>
						<a href="list.asp?bbscode=004" class="link_menu">도움말</a>
					</li>
					<li <%If menuCode2="D" Then%>class="on"<%else%><%End if%>>
						<a href="list.asp?bbscode=005" class="link_menu">서비스 소개</a>
					</li>
				</ul>
			</div>
			<% ElseIf menuCode="60000" Then%> 
			<div class="inner_nav">
					<ul class="nav_category">
					<li <%If menuCode2="A" Then%>class="fst on"<%else%>class="fst"<%End if%>>
						<a href="pid_list.asp" class="link_menu">PID 현황 및 관리</a>
					</li>
					<li <%If menuCode2="B" Then%>class="on"<%else%><%End if%>>
						<a href="sponsor_list.asp" class="link_menu">발급캠페인관리</a>
					</li>
				</ul>
			</div>
			<% ElseIf menuCode="70000" Then%> 
			<div class="inner_nav">
					<ul class="nav_category">
					<li <%If menuCode2="A" Then%>class="fst on"<%else%>class="fst"<%End if%>>
						<a href="appversion.asp" class="link_menu">앱버전관리</a>
					</li>
					<li <%If menuCode2="B" Then%>class="on"<%else%><%End if%>>
						<a href="notice_list.asp" class="link_menu">PUSH관리</a>
					</li>
				</ul>
			</div>
			<% Else%> 
			<div class="inner_nav">
				<ul class="nav_category">
					
				</ul>
			</div>


			<% End If%> 
		</div>