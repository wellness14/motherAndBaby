		   <% If Left(menuCode1,1) = "1" Then %>
		   <ul>
				<li id="menu01">
						<a href="#">마더앤베이비<span class="arrow"></span></a>
					<ul>
						<li><a href="/mobileweb/comp/comp.asp">마더앤베이비</a></li>
						<li><a href="/mobileweb/service/service_01.asp">산후케어서비스</a></li>
						<li><a href="/mobileweb/info/info_01.asp">이용안내/예약</a></li>
						<li><a href="/mobileweb/board/board_01.asp">커뮤니티</a></li>
					</ul>
				</li>
			 </ul>
		   <% ElseIf Left(menuCode1,1) = "2" Then%> 
			<ul>
				<li id="menu01">
						<a href="#">마더앤베이비<span class="arrow"></span></a>
					<ul>
						<li><a href="/mobileweb/comp/comp.asp">마더앤베이비</a></li>
						<li><a href="/mobileweb/service/service_01.asp">산후케어서비스</a></li>
						<li><a href="/mobileweb/info/info_01.asp">이용안내/예약</a></li>
						<li><a href="/mobileweb/board/board_01.asp">커뮤니티</a></li>
					</ul>
				</li>
				<li id="menu02">
					<% 
					If menuCode2 = "A" Then 
                       subTitle = "마더앤베이비케어란?" 
                    ElseIf menuCode2 = "B" Then 
                       subTitle = "트리니티케어시스템?" 
                    ElseIf menuCode2 = "C" Then 
                       subTitle = "전담간호사의 역할"
                    ElseIf menuCode2 = "D" Then 
                       subTitle = "산후관리사가 하는일"
                    ElseIf menuCode2 = "E" Then 
                       subTitle = "자문단소개" 
                    ElseIf menuCode2 = "F" Then 
                       subTitle = "협력사소개"
                    ElseIf menuCode2 = "G" Then 
                       subTitle = "제휴안내"
                     ElseIf menuCode2 = "H" Then 
                       subTitle = "지사안내"
                    End If 
					%>
					<a href="#"><%=subTitle%><span class="arrow"></span></a>
					<ul>
						<li><a href="/mobileweb/comp/comp.asp?menuCode1=20000&menuCode2=A">마더앤베이비케어란?</a></li>
						<li><a href="/mobileweb/comp/comp.asp?menuCode1=20000&menuCode2=B">트리니티케어시스템</a></li>
						<li><a href="/mobileweb/comp/comp.asp?menuCode1=20000&menuCode2=C">전담간호사의 역할</a></li>
						<li><a href="/mobileweb/comp/comp.asp?menuCode1=20000&menuCode2=D">산후관리사가 하는일</a></li>
						<li><a href="/mobileweb/comp/comp.asp?menuCode1=20000&menuCode2=E">자문단소개</a></li>
						<li><a href="/mobileweb/comp/comp.asp?menuCode1=20000&menuCode2=F">협력사소개</a></li>
						<li><a href="/mobileweb/comp/comp.asp?menuCode1=20000&menuCode2=G">제휴안내</a></li>
						<li><a href="/mobileweb/comp/comp.asp?menuCode1=20000&menuCode2=H">지사안내</a></li>
					</ul>
				</li>
             </ul>
            <% ElseIf Left(menuCode1,1) = "3" Then%> 
			<ul>
				<li id="menu01" class="000">
						<a href="#">산후케어서비스<span class="arrow"></span></a>
					<ul>
						<li><a href="/mobileweb/comp/comp.asp">마더앤베이비</a></li>
						<li><a href="/mobileweb/service/service_01.asp">산후케어서비스</a></li>
						<li><a href="/mobileweb/info/info_01.asp">이용안내/예약</a></li>
						<li><a href="/mobileweb/board/board_01.asp">커뮤니티</a></li>
					</ul>
				</li>
				<li id="menu02" class="000">
				    <% 
					If menuCode2 = "A" Then 
                       subTitle = "서비스 프로그램" 
                    ElseIf menuCode2 = "B" Then 
                       subTitle = "내게맞는서비스찾기" 
                    ElseIf menuCode2 = "C" Then 
                       subTitle = "바디케어프로그램"
                    ElseIf menuCode2 = "D" Then 
                       subTitle = "수유관리프로그램"
                    ElseIf menuCode2 = "E" Then 
                       subTitle = "영양관리프로그램" 
                    ElseIf menuCode2 = "F" Then 
                       subTitle = "부가서비스안내"
                    End If 
					%>

					<a href="#"><%=subTitle%><span class="arrow"></span></a>
					<ul>
						<li><a href="/mobileweb/service/service_01.asp?menuCode1=30000&menuCode2=A">서비스 프로그램</a></li>
						<li><a href="/mobileweb/service/service_03.asp?menuCode1=30000&menuCode2=B">내게맞는서비스찾기</a></li>
						<li><a href="/mobileweb/service/service_01.asp?menuCode1=30000&menuCode2=C">바디케어프로그램</a></li>
						<li><a href="/mobileweb/service/service_01.asp?menuCode1=30000&menuCode2=D">수유관리프로그램</a></li>
						<li><a href="/mobileweb/service/service_01.asp?menuCode1=30000&menuCode2=E">영양관리프로그램</a></li>
						<li><a href="/mobileweb/service/service_01.asp?menuCode1=30000&menuCode2=F">부가서비스안내</a></li>
					</ul>
				</li>
            </ul>
            <% ElseIf Left(menuCode1,1) = "4" Then%>    
			<ul>
				<li id="menu01" class="000">
						<a href="#">이용안내/예약<span class="arrow"></span></a>
					<ul>
						<li><a href="/mobileweb/comp/comp.asp">마더앤베이비</a></li>
						<li><a href="/mobileweb/service/service_01.asp">산후케어서비스</a></li>
						<li><a href="/mobileweb/info/info_01.asp">이용안내/예약</a></li>
						<li><a href="/mobileweb/board/board_01.asp">커뮤니티</a></li>
					</ul>
				</li>
				<li id="menu02" class="000">
				    <% 
					If menuCode2 = "A" Then 
                       subTitle = "상담신청" 
                    ElseIf menuCode2 = "B" Then 
                       subTitle = "예약/결제안내" 
                    ElseIf menuCode2 = "C" Then 
                       subTitle = "예약취소/환불규정"
					ElseIf menuCode2 = "D" Then 
                       subTitle = "정부지원사업안내"
                    ElseIf menuCode2 = "E" Then 
                       subTitle = "서비스용품안내"
                    ElseIf menuCode2 = "F" Then 
                       subTitle = "출산선물안내" 
                    End If 
					%>

					<a href="#"><%=subTitle%><span class="arrow"></span></a>
					<ul>
						<li><a href="/mobileweb/info/info_01.asp">상담신청</a></li>
						<li><a href="/mobileweb/info/info_02.asp?menuCode1=40000&menuCode2=B">예약/결제안내</a></li>
						<li><a href="/mobileweb/info/info_02.asp?menuCode1=40000&menuCode2=C">예약취소/환불규정</a></li>
<!--                         <li><a href="/mobileweb/info/info_02.asp?menuCode1=40000&menuCode2=D">정부지원사업안내</a></li> -->
						<li><a href="/mobileweb/info/info_02.asp?menuCode1=40000&menuCode2=E">서비스용품안내</a></li>
						<li><a href="/mobileweb/info/info_02.asp?menuCode1=40000&menuCode2=F">출산선물안내</a></li>
					</ul>
				</li>
            </ul>

			<% ElseIf Left(menuCode1,1) = "5" Then%>    
			<ul>
				<li id="menu01" class="000">
						<a href="#">커뮤니티<span class="arrow"></span></a>
					<ul>
						<li><a href="/mobileweb/comp/comp.asp">마더앤베이비</a></li>
						<li><a href="/mobileweb/service/service_01.asp">산후케어서비스</a></li>
						<li><a href="/mobileweb/info/info_01.asp">이용안내/예약</a></li>
						<li><a href="/mobileweb/board/board_01.asp">커뮤니티</a></li>
					</ul>
				</li>
				<li id="menu02" class="000">
				    <% 
					If menuCode2 = "A" Then 
                       subTitle = "공지&뉴스" 
                    ElseIf menuCode2 = "B" Then 
                       subTitle = "FAQ" 
                    ElseIf menuCode2 = "C" Then 
                       subTitle = "1:1Q&A"
					ElseIf menuCode2 = "D" Then 
                       subTitle = "칭찬하기"
                    ElseIf menuCode2 = "E" Then 
                       subTitle = "이벤트"
                    End If 
					%>

					<a href="#"><%=subTitle%><span class="arrow"></span></a>
					<ul>
						<li><a href="/mobileweb/board/board_01.asp">공지&뉴스</a></li>
						<li><a href="/mobileweb/board/board_02.asp">FAQ</a></li>
						<li><a href="/mobileweb/board/board_03.asp">1:1Q&A</a></li>
						<li><a href="/mobileweb/board/board_04.asp">칭찬하기</a></li>
						<li><a href="/mobileweb/board/board_05.asp">이벤트</a></li>
                </ul>
				</li>
            </ul>
			 <% End If %> 

