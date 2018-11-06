<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!DOCTYPE html>
<html>
<head>
 </head>
<body>
    	<form action="../../api/get_storyfile_db.asp"  ENCTYPE="multipart/form-data" method="post" name="write_form">
		<input type="hidden" name="sMode" value="register">
        <input type="hidden" name="uCode" value="1000000001">
			<fieldset>
				 <table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">번호 분류</label></th>
						<td>
						    <div class="inner_cell">
								<input type="text" name="sNum">
							</div> 
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">파일</label></th>
						<td>
						    <div class="inner_cell">
								<input type="file" name="mfilename" id="iconfilename" class="file_attachment">
							</div> 
							<div class="inner_cell">
								<input type="file" name="mfilename" id="iconfilename" class="file_attachment">
							</div>
							<div class="inner_cell">
								<input type="file" name="mfilename" id="iconfilename" class="file_attachment">
							</div>
							<div class="inner_cell">
								<input type="file" name="mfilename" id="iconfilename" class="file_attachment">
							</div>
						</td>
					</tr>
					</tbody>
				</table>
			</fieldset>
			<div class="wrap_btn">
				   <span class="bundle_btn">
					   <span class="btn_blue"><button onclick="formChk();return false;" class="inner_btn">등록하기</button></span>
				   </span>
				</div>
</body>
</html>
