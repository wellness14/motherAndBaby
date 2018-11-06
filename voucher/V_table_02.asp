	<style type="text/css">


table.morning-session, 
table.afternoon-session {
	width: 100%;
	
}
table.morning-session col.time, 
table.afternoon-session col.time {
	width: 12%;
}
table.morning-session, 
table.afternoon-session thead tr {
	width: 100%;
}
table.morning-session {
	text-align: center;
}
table.afternoon-session thead tr {
	background-color: #b0d0ff;
	color: #ffFFFf;
	text-align: center;
}
table.morning-session td {
	text-align: center;
}
tr.header {
	height: 25px;
}
tr.black {
	background-color: #000;
}
tr.keynote, 

tr.session_01 {
	    background-color: #ddf0ff;
		font-size: 15px;
		text-align: center;
}


tr.session_02 {
	    background-color: #b5dfff;
		font-size: 15px;
		text-align: center;
}
/*tr.session_03 {
	    background-color: #ddf0ff;
		font-size: 15px;
		text-align: center;

}
tr.session_04 {
	    background-color: #ddf0ff;
		font-size: 15px;
		text-align: center;

}
tr.session_05 {
	    background-color: #ddf0ff;
		font-size: 15px;
		text-align: center;
}
tr.session_06 {
	    background-color: #ddf0ff;
		font-size: 15px;
		text-align: center;
}

tr.session_07 {
	    background-color: #ddf0ff;
		font-size: 15px;
		text-align: center;
}
tr.session_08 {
	    background-color: #ddf0ff;
		font-size: 15px;
		text-align: center;*/
}

tr.etc {
	background-color: #F5F6F8;
	color: #ADAEB0;
	text-align: center;
}
th, 
td {
	padding: 1em;
	vertical-align: middle;
}
th.time {
	text-align: center;
	background-color:#b0d0ff;
	padding:15px 0 15px 0;
	vertical-align:middle;
}
th.track {text-align: center;
	background-color:#2c61af;
	padding:15px 0 15px 0;

}
tr.gift {
	background-color: #ececec;
	text-align: center;
	color: #000;
	height: 80px;
}
tr.gift strong {
	font-size: 1.4em;
}
td.lunch {
	height: 40px;
	color: #374e0c;
	background-color: #dedede;
}
td.speaker a {
	color: #202020;
	font-size: 12px;
	text-decoration: none;
	vertical-align:middle;
	
}
td.speaker .title a:visited {
	color: #202020;
	vertical-align:middle;
}
/*td.speaker .title a:hover, 
td.speaker .title a:active {
	color: #f15023;
	text-decoration: underline;
}*/
td.speaker img {
	float: left;
	margin-right: 7px;
	margin-bottom: 10px;
	width: 50px;
	height: 50px;
}
td.speaker .speaker-name {
	display: block;
	margin-bottom: 5px;
	margin-left: 57px;
}
td.speaker .speaker-name, 
td.speaker .speaker-name a {
	color: gray;
}
td.speaker .title {
	display: block;
	
	font-weight: 600;
}
td.speaker .team {
	background: url(http://i.kthimg.com/TOP/svc/h3/2012/img/location_poi.png) no-repeat;
	padding-left: 16px;
	padding-top: 2px;
	display: block;
	margin-top: 8px;
	font-size: 11px;
	color: #8f8f8f;
	clear: center;
}
@media only screen and (max-width: 650px) {
	table.morning-session, 
	table.afternoon-session, 
	table.morning-session col.time, 
	table.afternoon-session col.time {
		width: 100%;
	}
	table.morning-session [data-cell-header]:before, 
	table.afternoon-session [data-cell-header]:before {
		content: attr(data-cell-header);
		display: block;
		margin: 0 0 0em;
		font-size: 0.8em;
		text-align: center;
		opacity: 0.8;
		background: #2c61af;
		border-radius: 2px;
		padding: 0.3em 0.6em;
		box-shadow: ;
		color: #ffffff;
	}
	table.morning-session th[scope], 
	table.afternoon-session th[scope] {
		display: none;
	}
	table.morning-session th, 
	table.afternoon-session th, 
	table.morning-session td, 
	table.afternoon-session td {
		display: block;
		width: auto;



#back_blue{background-color:#ffffff;}




	@import url('http://fonts.googleapis.com/earlyaccess/nanumgothic.css');
	table, div, p {font-family:'Nanum Gothic';}
	body {
		font-family:'Nanum Gothic';
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	}

	.button {
		width: 100%;
		height: 100%;
		line-height:3;
		color: #ffffff;
		text-decoration: none;
		font-size: 14px;
		font-weight: bold;
		display: block;
		text-align: center;
		position: relative;

		/* BACKGROUND GRADIENTS */
		background: rgb(97,127,170); /* Old browsers */
		background: -moz-linear-gradient(top, rgba(97,127,170,1) 0%, rgba(44,97,175,1) 90%); 
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(97,127,170,1)), color-stop(90%,rgba(44,97,175,1))); /* Chrome,Safari4+ */
		background: -webkit-linear-gradient(top, rgba(97,127,170,1) 0%,rgba(44,97,175,1) 90%); /* Chrome10+,Safari5.1+ */
		background: -o-linear-gradient(top, rgba(97,127,170,1) 0%,rgba(44,97,175,1) 90%); /* Opera 11.10+ */
		background: -ms-linear-gradient(top, rgba(97,127,170,1) 0%,rgba(44,97,175,1) 90%); /* IE10+ */
		background: linear-gradient(to bottom, rgba(97,127,170,1)0%,rgba(44,97,175,1) 90%); /* W3C */
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#617faa', endColorstr='#2c61af',GradientType=0 ); /* IE6-9 */

		/* BORDER RADIUS */
		-moz-border-radius: 10px;
		-webkit-border-radius: 10px;
		border-radius: 10px;

		/* BOX SHADOW */
		-moz-box-shadow: 0 1px 3px black;
		-webkit-box-shadow: 0 1px 3px black;
		box-shadow: 0 1px 3px black;
	}

	/* WHILE HOVERED */
	.button:hover {
		background: rgb(139,162,193); /* Old browsers */
		background: -moz-linear-gradient(top,  rgba(139,162,193,1) 0%, rgba(85,136,213,1) 90%); /* FF3.6+ */
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(139,162,193,1)), color-stop(90%,rgba(85,136,213,1))); /* Chrome,Safari4+ */
		background: -webkit-linear-gradient(top,  rgba(139,162,193,1) 0%,rgba(85,136,213,1) 90%); /* Chrome10+,Safari5.1+ */
		background: -o-linear-gradient(top,  rgba(139,162,193,1) 0%,rgba(85,136,213,1) 90%); /* Opera 11.10+ */
		background: -ms-linear-gradient(top,  rgba(139,162,193,1) 0%,rgba(85,136,213,1) 90%); /* IE10+ */
		background: linear-gradient(to bottom,  rgba(139,162,193,1) 0%,rgba(85,136,213,1) 90%); /* W3C */
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#8ba2c1', endColorstr='#5588d5',GradientType=0 ); /* IE6-9 */
		}

	/* WHILE BEING CLICKED */
	.button:active {
		-moz-box-shadow: 0 2px 6px black;
		-webkit-box-shadow: 0 2px 6px black;
	}


.button_02 {
		width: 100%;
		height: 100%;
		line-height:3;
		color: #ffffff;
		text-decoration: none;
		font-size: 14px;
		font-weight: bold;
		display: block;
		text-align: center;
		position: relative;
		background: #2c61af;
		}
		.button_02:hover {
		color: #2c61af;
		background:#ffffff;
		}
		</Style>

<table class="afternoon-session" cellspacing="1" style="border-spacing:2px;border-collapse:separate;">

	<colgroup>
		<col class="time" width="110">
		<col width="*">
		<col width="*">
		<col width="*">
		<col width="*">
	</colgroup>
	<thead>


	<tr class="etc">
		
	</tr>

		<tr>
			<th scope="col" class="track">구분</th>
			<th scope="col" class="track">가격상한선</th>
			<th scope="col" class="track">소득(전국가구 월평균소득)</th>
			<th scope="col" class="track">유형</th>
			<th scope="col" class="track">본인부담금</th>
			<th scope="col" class="track">지원기간</th>
			<th scope="col" class="track" style="font-size: 9pt;">본인에게 해당하는 <br/>사항을 선택하세요. <br/>(택1)</th>
	
		</tr>
	</thead>
	<tr class="session_01">
		<th class="time" scope="row" rowspan="4" style="vertical-align:middle;">단테아</th>
					<td class="speaker" rowspan="4" data-cell-header="단테아 - 가격상한선">
			<div>
		
				<span class="title" >800,000원</span>
				
			</div>
		</td>
				

				<td class="speaker" data-cell-header="단테아 - 소득(전국가구 월평균소득)">
			<div>
			
				<span class="title">40%이하</span>
				
			</div>
			
		</td>


					<td class="speaker" id="back_blue"  data-cell-header="유형">
			<div>
				
				<span class="title">A-가형</span>
				
			</div>
			
		</td>

		<td class="speaker" rowspan="4" data-cell-header="본인부담금">
			
			<div>
				
				<span class="title">책정가와정부지원금 차액</span>
				
			</div>
		</td>

		<td class="speaker"rowspan="4" data-cell-header="지원기간">
			
			<div>
				
				<span class="title">2주</span>
				
			</div>
		</td>

		<td class="speaker" >
			
			<div>
				
				<p><a href="#"class="button" style="color:#ffffff;">선택</a></p>
				
			</div>
		</td>

		<tr class="session_01">
		<td class="speaker" data-cell-header="단테아 - 가격상한선">
	
		<div>
			
				<span class="title">40%초과~50%이하</span>
				
			</div>
			
			<td class="speaker"  data-cell-header="유형">
			<div>
				
				<span class="title">A-나형</span>
				
			</div>
			<td class="speaker" >
			
			<div>
				
				<p><a href="#"class="button" style="color:#ffffff;">선택</a></p>
				
			</div>
		</td>
			
		<tr class="session_01">
		<td class="speaker" data-cell-header="단테아 - 가격상한선">
	
		<div>
			
				<span class="title">50%초과~65%이하</span>
				
			</div>

			<td class="speaker" class="session_02"data-cell-header="유형">
			<div>
				
				<span class="title">A-다형</span>
				
			</div>
			<td class="speaker" >
			
			<div>
				
				<p><a href="#"class="button" style="color:#ffffff;">선택</a></p>
				
			</div>
		</td>
			
		

			<tr class="session_01">
		<td class="speaker" data-cell-header="단테아 - 가격상한선">
	
		
		<div>
			
				<span class="title">65%초과(예외지원)</span>
				
			</div>

			<td class="speaker" data-cell-header="유형">
			<div>
				
				<span class="title">A-라형</span>
				
			</div>
			<td class="speaker" >
			
			<div>
				
				<p><a href="#"class="button" style="color:#ffffff;">선택</a></p>
				
			</div>
		</td>



					
				</tr>
		
		<tr class="session_02">
		<th class="time" scope="row" rowspan="4">쌍생아</th>
					<td class="speaker" rowspan="4" data-cell-header="단테아 - 가격상한선">
			<div>
		
				<span class="title" >1,500,000원</span>
				
			</div>
		</td>
				

				<td class="speaker" data-cell-header="단테아 - 소득(전국가구 월평균소득)">
			<div>
			
				<span class="title">40%이하</span>
				
			</div>
			
		</td>


					<td class="speaker" data-cell-header="쌍생아 - 유형">
			<div>
				
				<span class="title">B-가형</span>
				
			</div>
			
		</td>

		<td class="speaker" rowspan="4" data-cell-header="쌍생아 - 본인부담금">
			
			<div>
				
				<span class="title">책정가와정부지원금 차액</span>
				
			</div>
		</td>

		<td class="speaker"rowspan="4" data-cell-header="쌍생아 - 지원기간">
			
			<div>
				
				<span class="title">3주</span>
				
			</div>
		</td>

		<td class="speaker" >
			
			<div>
				
				<p><a href="#"class="button" style="color:#ffffff;">선택</a></p>
				
			</div>
		</td>

		<tr class="session_02">
		<td class="speaker" data-cell-header="쌍생아 - 가격상한선">
	
		<div>
			
				<span class="title">40%초과~50%이하</span>
				
			</div>
			
			<td class="speaker" data-cell-header="유형">
			<div>
				
				<span class="title">B-나형</span>
				
			</div>
			<td class="speaker" >
			
			<div>
				
				<p><a href="#"class="button" style="color:#ffffff;">선택</a></p>
				
			</div>
		</td>

			
		<tr class="session_02">
		<td class="speaker" data-cell-header="쌍생아 - 가격상한선">
	
		<div>
			
				<span class="title">50%초과~65%이하</span>
				
			</div>

			<td class="speaker" data-cell-header="쌍생아 - 유형">
			<div>
				
				<span class="title">B-다형</span>
				
			</div>
			<td class="speaker" >
			
			<div>
				
				<p><a href="#"class="button" style="color:#ffffff;">선택</a></p>
				
			</div>
		</td>
			
		

			<tr class="session_02">
		<td class="speaker" data-cell-header="쌍생아 - 가격상한선">
	
		
		<div>
			
				<span class="title">65%초과(예외지원)</span>
				
			</div>

			<td class="speaker" data-cell-header="쌍생아 - 유형">
			<div>
				
				<span class="title">B-라형</span>
				
			</div>
			<td class="speaker" >
			
			<div>
				
				<p><a href="#"class="button" style="color:#ffffff;">선택</a></p>
				
			</div>
		</td>



					
		

		<tr class="session_01">
		<th class="time" scope="row" rowspan="4">삼태아 이상 중증 장애인 산모</th>
					<td class="speaker" rowspan="4" data-cell-header="단테아 - 가격상한선">
			<div>
		
				<span class="title" >2,200,000원</span>
				
			</div>
		</td>
				

				<td class="speaker" data-cell-header="단테아 - 소득(전국가구 월평균소득)">
			<div>
			
				<span class="title">40%이하</span>
				
			</div>
			
		</td>


					<td class="speaker" id="back_blue"  data-cell-header="유형">
			<div>
				
				<span class="title">C-가형</span>
				
			</div>
			
		</td>

		<td class="speaker" rowspan="4" data-cell-header="본인부담금">
			
			<div>
				
				<span class="title">책정가와정부지원금 차액</span>
				
			</div>
		</td>

		<td class="speaker"rowspan="4" data-cell-header="지원기간">
			
			<div>
				
				<span class="title">4주</span>
				
			</div>
		</td>

		<td class="speaker" >
			
			<div>
				
				<p><a href="#"  class="button"style="color:#ffffff;">선택</a></p>
				
			</div>
		</td>

		<tr class="session_01">
		<td class="speaker" data-cell-header="단테아 - 가격상한선">
	
		<div>
			
				<span class="title">40%초과~50%이하</span>
				
			</div>
			
			<td class="speaker"  data-cell-header="유형">
			<div>
				
				<span class="title">C-나형</span>
				
			</div>
			<td class="speaker" >
			
			<div>
				
				<p><a href="#"class="button" style="color:#ffffff;">선택</a></p>
				
			</div>
		</td>
			
		<tr class="session_01">
		<td class="speaker" data-cell-header="단테아 - 가격상한선">
	
		<div>
			
				<span class="title">50%초과~65%이하</span>
				
			</div>

			<td class="speaker" class="session_02"data-cell-header="유형">
			<div>
				
				<span class="title">C-다형</span>
				
			</div>
			<td class="speaker" >
			
			<div>
				
				<p><a href="#"class="button" style="color:#ffffff;">선택</a></p>
				
			</div>
		</td>
			
		

			<tr class="session_01">
		<td class="speaker" data-cell-header="단테아 - 가격상한선">
	
		
		<div>
			
				<span class="title">65%초과(예외지원)</span>
				
			</div>

			<td class="speaker" data-cell-header="유형">
			<div>
				
				<span class="title">C-라형</span>
				
			</div>
			<td class="speaker" >
			
			<div>
				
				<p><a href="#"class="button" style="color:#ffffff;">선택</a></p>
				
			</div>
		</td>



					
				</tr>

				
</table>

	<script>
function addCellHeader(table) {
	if (!table) {
		return false;
	}

	var trs = table.getElementsByTagName('tr');
	var trsChild;
	var grid = {};
	var cells;
	for (var i = 0, cntI = trs.length; i < cntI; i++) {
		if (!grid[i]) {
			grid[i] = {};
		}
		trsChild = trs.item(i).childNodes;
		cells = 0
		for (var j = 0, cntJ = trsChild.length; j < cntJ; j++) {
			if (trsChild[j].nodeType == 1) {
				grid[i][cells++] = trsChild[j];
			}
		}
	}

	var cellHeader = '';
	for (row in grid) {
		if (row == 0) {
			continue;
		}
		for (cell in grid[row]) {
			if (cell == 0) {
				continue;
			}
			cellHeader = grid[0][cell].innerHTML + ' - ' + grid[row][0].innerHTML
			grid[row][cell].setAttribute('data-cell-header', cellHeader);
		}
	}
}

//addCellHeader(document.querySelector('.afternoon-session'));


	</script>