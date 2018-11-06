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
}
td.speaker .title a:visited {
	color: #202020;
}
td.speaker .title a:hover, 
td.speaker .title a:active {
	color: #f15023;
	text-decoration: underline;
}
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
		margin: 0 0 1em;
		font-size: 0.8em;
		text-align: center;
		opacity: 0.8;
		background: #2c61af;
		border-radius: 2px;
		padding: 0.3em 0.6em;
		box-shadow: 1px 1px 2px #bbb;
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

		</Style>


<table class="afternoon-session" cellspacing="1" style="border-spacing:2px;border-collapse:separate;">
<caption style="text-align: right;" >［ 건강보험료 본인부담금에 의한 전국가구평균소득 65% 판정기준 ]</caption>
	<colgroup>
		<col class="time" width="110">
		<col width="*">
		<col width="*">
		<col width="*">
		<col width="*">
	</colgroup>
	<thead>

	<tr class="etc">
		
		<td colspan="4" >건강보험료 본인부담금(원) </td>
	</tr>
	<tr class="etc">
		
	</tr>

		<tr>
			<th scope="row" class="track">가구원수</th>
			<th scope="row" class="track">직장 가입자</th>
			<th scope="row" class="track">지역가입자</th>
			<th scope="row" class="track">혼합(직장+지역)</th>
	
		</tr>
	</thead>
		<tbody><tr class="session_01">
		<th class="time" scope="row">2인</th>
					<td class="speaker" data-cell-header="직장가입자 - 2인">
			<div>
		
				<span class="title">61,379</span>
				
			</div>
		</td>
				

				<td class="speaker" data-cell-header="지역가입자 - 2인">
			<div>
			
				<span class="title">47,997</span>
				
			</div>
		</td>


					<td class="speaker" data-cell-header="혼합(직장+지역) - 2인">
			<div>
				
				<span class="title">62,201</span>
				
			</div>
		</td>
					
				</tr>
		
		<tr class="session_02">
		<th class="time" scope="row">3인</th>
					<td class="speaker" data-cell-header="직장가입자- 3인">
			<div>
				<span class="title">87,731</span>
			</div>
		</td>
					<td class="speaker" data-cell-header="지역가입자 - 3인">
			<div>

				<span class="title">87,698</span>
			</div>

		</td>
					<td class="speaker" data-cell-header="혼합(직장+지역) - 3인">
			<div>

				<span class="title">88,430</span>

			</div>
		</td>
	
				</tr>

				<tr class="session_01">
		<th class="time" scope="row">4인</th>
					<td class="speaker" data-cell-header="직장가입자- 4인">
			<div>
				<span class="title">98,557</span>
			</div>
		</td>
					<td class="speaker" data-cell-header="지역가입자 - 4인">
			<div>

				<span class="title">103,894</span>
			</div>

		</td>
					<td class="speaker" data-cell-header="혼합(직장+지역) - 4인">
			<div>

				<span class="title">99,769</span>

			</div>
		</td>
	
				</tr>

				<tr class="session_02">
		<th class="time" scope="row">5인</th>
					<td class="speaker" data-cell-header="직장가입자- 5인">
			<div>
				<span class="title">104,450</span>
			</div>
		</td>
					
					<td class="speaker" data-cell-header="지역가입자 - 5인">
			<div>

				<span class="title">112,143</span>
			
			</div>

					</td>
				<td class="speaker" data-cell-header="혼합(직장+지역) - 5인">
			
			<div>

				<span class="title">105,783</span>
			
			</div>

				</td>
					
				</tr>






				<tr class="session_01">

		<th class="time" scope="row">6인</th>

		<td class="speaker" data-cell-header="직장가입자- 6인">
			
			<div>
				
				<span class="title">110,823</span>
			
			</div>
		
		</td>
		
		<td class="speaker" data-cell-header="지역가입자 - 6인">	
			<div>
					
				<span class="title">120,855</span>
			
			</div>
		
		</td>
		
		<td class="speaker" data-cell-header="혼합(직장+지역) - 6인">	
			
			<div>
				
				<span class="title">112,221</span>
			
			</div>
		
		</td>
				</tr>




				<tr class="session_02">

		<th class="time" scope="row">7인</th>

		<td class="speaker" data-cell-header="직장가입자- 7인">
			
			<div>
				
				<span class="title">116,655</span>
			
			</div>
		
		</td>
		
		<td class="speaker" data-cell-header="지역가입자 - 7인">	
			<div>
					
				<span class="title">128,325</span>
			
			</div>
		
		</td>
		
		<td class="speaker" data-cell-header="혼합(직장+지역) - 7인">	
			
			<div>
				
				<span class="title">118,139</span>
			
			</div>
		
		</td>
				</tr>



						<tr class="session_01"id="table_text_b_02">

		<th class="time" scope="row">8인</th>

		<td class="speaker" data-cell-header="직장가입자- 8인">
			
			<div>
				
				<span class="title">121,275</span>
			
			</div>
		
		</td>
		
		<td class="speaker" data-cell-header="지역가입자 - 8인">	
			<div>
					
				<span class="title">133,955</span>
			
			</div>
		
		</td>
		
		<td class="speaker" data-cell-header="혼합(직장+지역) - 8인">	
			
			<div>
				
				<span class="title">122,699</span>
			
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