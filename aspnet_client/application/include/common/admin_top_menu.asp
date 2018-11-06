    <div id="babysHead">
    <h1>
        <a href="/application/admin/main.asp" id="babysLogo" title="babys 메인페이지로 가기">
            <img src="/application/image/publisher/sub_menu_cs.jpg" width="150" class="img_g" alt="babys"/>
        </a>
    </h1>
		<div  id="babysGnb" role="navigation">
			<h2 class="screen_out">퍼블리셔 메뉴</h2>
			<ul class="gnb_comm">
				<li<%If menuCode="00000" then%> class="on"<%End if%>><a href="/application/admin/main.asp" class="link_menu">홈</a></li>
				<li<%If menuCode="10000" then%> class="on"<%End if%>><a href="/application/admin/member/sysop_list.asp" class="link_menu">계정관리</a></li>
				<li<%If menuCode="20000" then%> class="on"<%End if%>><a href="/application/admin/postnatal/userlog.asp" class="link_menu">산후조리체험</a></li>
				<li<%If menuCode="30000" then%> class="on"<%End if%>><a href="/application/admin/pregnancy/userlist.asp" class="link_menu">스마트출산용품체크</a></li>
				<li<%If menuCode="40000" then%> class="on"<%End if%>><a href="/application/admin/story/list.asp" class="link_menu">스토리커뮤니티관리</a></li>
				<li<%If menuCode="50000" then%> class="on"<%End if%>><a href="/application/admin/board/list.asp?bbscode=001" class="link_menu">게시판관리</a></li>
				<li<%If menuCode="70000" then%> class="on"<%End if%>><a href="/application/admin/function/appversion.asp" class="link_menu">APP관리</a></li>

			</ul>
		</div>
		<div class="info_utility">
			<div class="opt_utility"><!-- opt_open로 선택상자 컨트롤 -->
				<strong class="screen_out">로그인정보</strong>
				<a href="#" class="ico_comm link_utility"><%=cName%>(<%=CID%>)</a>
				<span class="screen_out">선택상자</span>
				<ul class="list_utility">
					<li>
						<a href="/application/admin/logout.asp" class="link_select">로그아웃</a>
					</li>
					<li><a href="/account" class="link_select">회원정보</a></li>
				</ul>
			</div>
		</div>
    </div>