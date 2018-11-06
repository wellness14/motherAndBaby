<!DOCTYPE html>
<html>
<head>
    <!--#include virtual="/application/include/common/admin_head.asp"-->
</head>
<body>
    	<form action="./api/get_userfile_db.asp"  ENCTYPE="multipart/form-data" method="post" name="write_form">
		
								<input type="text" name="UCode" value="1000000001">
                                <input type="text" name="pFlag"  value="profile">
								<input type="file" name="pfilename" class="file_attachment">
								<button onclick="formChk();return false;" class="inner_btn">등록하기</button>
</body>
</html>
<script type="text/javascript">
    function formChk()
    {
        
		  frm.submit();


    }



</script>

