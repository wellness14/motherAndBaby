<script type="text/javascript" charset="utf-8">
		var modal_serach = "";
		
	 
//		var over_chk_btn1 = $("#over_chk_btn1");
		
			$(document).ready(function() {
			$("#over_chk_btn1").click(function(){
				modal_serach = $("#modal-serach").val();
				
			//	alert(modal_serach);
				if(modal_serach != ""){
					window.open("http://greencandy.co.kr/greencand/campaign.php?event_title="+modal_serach, "_self","");
				}
			});

 		});

					/*	if(modal_serach != ""){
					window.open("http://greencandy.co.kr/greencand/campaign.php?event_title="+modal_serach, "_self","");
//window.open("http://www.w3schools.com", "_blank", "toolbar=yes, scrollbars=yes, resizable=yes, top=500, left=500, width=400, height=400");
				}*/

</script>
<!--캠페인 찾기 모달-->
<div class="modal fade" id="searchModal" role="dialog">
	<div class="modal-dialog modal-sm">
	
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" style="color:#FFFFFF; font-weight:bold; text-align:center; background-color:#00A9A6;">
				캠페인 찾기
			</div>

			<div class="modal-body">
				<div style="text-align:center;">
					<input type="text" class="input_01" style="width:150px;" id="modal-serach">
					<input type="button" value="찾기" id="over_chk_btn1" class="over_chk_btn1">
				</div>
			</div>

			<div class="modal-footer" style="text-align:center;">
				<button type="button" class="modal_btn1" data-dismiss="modal">닫기</button>
			</div>
		</div>
	  
	</div>
</div>

<!--안내 메시지 모달-->
<div class="modal fade" id="msgModal" role="dialog">
	<div class="modal-dialog modal-sm">
	
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" style="color:#FFFFFF; font-weight:bold; text-align:center; background-color:#00A9A6;">
				안내
			</div>

			<div class="modal-body">
				<div style="text-align:center;">
					<div class="msg"></div>
				</div>
			</div>

			<div class="modal-footer" style="text-align:center;">
				<button type="button" class="modal_btn1" data-dismiss="modal">닫기</button>
			</div>
		</div>
	  
	</div>
</div>