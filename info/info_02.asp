<!--#include virtual="/common/menu/head.asp"-->

	<meta charset="euc-kr">
	<title>����/���� �ȳ�</title>
	<style>
	body {font: Dotum,'����'; margin:0px 0px 0px 0px;}
	.sido {width:770px; padding:0px 0px 30px 0px;}
	.sido_name {height:30px; width:755px; background-color:#54c0cc; font-weight:bold; font-size:14px; color:#ffffff; padding: 0px 0px 0px 15px; line-height:30px;}
	.sigu ul{width::770px; padding: 10px 0px 0px 15px; overflow:auto;}
	.sigu li {list-style: none; float: left; line-height: 30px; vertical-align: middle; text-align: left; font-weight:bold; padding:0px 30px 0px 0px; width:80px; color:#666666;}
	.sigu li.wide {width: 200px;}
	.sigu li.orange {color: #F35001;}
	.sigu li.black {color: #000000;}
	#account_bank {display:none; height:250px;}
	#account {color:#898584; font-weight:bold; padding:0px 0px 0px 15px;}
	#account .dot {color:#FFB592; padding:0px 0px 0px 10px;}
	#account .line {position:relative; background-color:#FFB592; height:1px; width:650px; left:100px; top:-11px;}
	.bank {color:#333333; font-weight:bold; font-size:17px; padding:15px 0px 30px 200px;}
	
	</style>
	<link type="text/css" rel="stylesheet" href="http://mothernbaby.co.kr/common/css/style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script type="text/javascript" language="javascript">
		$(document).ready(function() {
			$(".sido").each(function(i) {
				$(".sido:eq(" + i + ") li").each(function(j) {
					$(this).click(function() {
						$(".sido").each(function(k) {
							$(".sido:eq(" + k + ") li").each(function(l) {
								$(this).css("color","#000000");
							});
						});

						$(this).css("color","red");

						$(".sido").each(function(m) {
							if (i != m) {
								$(".sido:eq(" + m + ")").find("#account_bank").slideUp();
							}
						});
						//�Ϲ� ����
						var bank_name = $(this).attr("bank_name");
						var bank_account = $(this).attr("bank_account");
						var holder_name = $(this).attr("holder_name");
						//�ٿ�ó ����
						var b_bank_name = $(this).attr("b_bank_name");
						var b_bank_account = $(this).attr("b_bank_account");
						var b_holder_name = $(this).attr("b_holder_name");

						$(".sido:eq(" + i + ")").find("#account_bank").slideDown();
						$(".sido:eq(" + i + ")").find(".bank").find(".bank_name").html(bank_name);
						$(".sido:eq(" + i + ")").find(".bank").find(".bank_account").html(bank_account);
						$(".sido:eq(" + i + ")").find(".bank").find(".holder_name").html(holder_name);
						$(".sido:eq(" + i + ")").find(".bank").find(".b_bank_name").html(b_bank_name);
						$(".sido:eq(" + i + ")").find(".bank").find(".b_bank_account").html(b_bank_account);
						$(".sido:eq(" + i + ")").find(".bank").find(".b_holder_name").html(b_holder_name);
					});
				}).css("cursor", "pointer");
			});
			
		});
	</script>
 </head>

<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		<td width="850" valign="top"><table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
				<td style="padding-top:40px;"><img src="/image/sub03_subtitle02.jpg" width="770" height="44" /></td>
			</tr>
			<tr>            
				<td>
						<div id="top">
						<img src="/image/sub_0033.jpg" width="770" height="1111" />
						</div><blockquote></blockquote>
						<div class="sido">
							<div class="sido_name">����</div>
							<div class="sigu">
								<ul>
									<li bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">������</li>
									<li bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">������</li>
									<li bank_name="�츮����" bank_account="1005-403-341323" holder_name="��ä��(�����غ��̺� ��������)" b_bank_name="�츮����" b_bank_account="1005-103-341334" b_holder_name="��ä��(�����غ��̺� ����, ���, ����)">���ϱ�</li>
									<li bank_name="��������" bank_account="110-468-139853" holder_name="�Ѽ���(�����غ��̺� ��������)" b_bank_name="��������" b_bank_account="094701-04-313728" b_holder_name="�Ѽ���(�����غ��̺񰭼�����õ����)">������</li>
									<li bank_name="�츮����" bank_account="1002-855-672280" holder_name="���̰�(�����غ��̺� ��������)" b_bank_name="�츮����" b_bank_account="1005-502-794877" b_holder_name="���̰�(�����غ��̺� ���ۡ����ǡ���õ)">���Ǳ�</li>
									<li bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">������</li>
									<li bank_name="KB��������" bank_account="535501-04-123954" holder_name="�̱���(�����غ��̺� ��������)" b_bank_name="��������" b_bank_account="804601-04-224922" b_holder_name="�̱��� (�����غ��̺� ������������)">���α�</li>
									<li bank_name="�츮����" bank_account="1002-855-672280" holder_name="���̰�(�����غ��̺� ��õ����)" b_bank_name="�츮����" b_bank_account="1005-502-794877" b_holder_name="���̰�(�����غ��̺� ���ۡ����ǡ���õ)">��õ��</li>
									<li bank_name="�츮����" bank_account="1005-403-341323" holder_name="��ä��(�����غ��̺� �������)" b_bank_name="�츮����" b_bank_account="1005-103-341334" b_holder_name="��ä��(�����غ��̺� ����, ���, ����)">�����</li>
									<li bank_name="�츮����" bank_account="1005-403-341323" holder_name="��ä��(�����غ��̺� ��������)" b_bank_name="�츮����" b_bank_account="1005-103-341334" b_holder_name="��ä��(�����غ��̺� ����, ���, ����)">������</li>
									<li bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">���빮��</li>
									<li bank_name="�츮����" bank_account="1002-855-672280" holder_name="���̰�(�����غ��̺� ��������)" b_bank_name="�츮����" b_bank_account="1005-502-794877" b_holder_name="���̰�(�����غ��̺� ���ۡ����ǡ���õ)">���۱�</li>
									<li bank_name="����" bank_account="301-3040-3577-51" holder_name="������(�����غ��̺� ��������)" b_bank_name="����" b_bank_account="301-3040-3573-11" b_holder_name="������(�����غ��̺� ���򡤸��������빮����)">������</li>
									<li bank_name="����" bank_account="301-3040-3577-51" holder_name="������(�����غ��̺� ���빮����)" b_bank_name="����" b_bank_account="301-3040-3573-11" b_holder_name="������(�����غ��̺� ���򡤸��������빮����)">���빮��</li>
									<li bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">���ʱ�</li>
									<li bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">������</li>
									<li bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">���ϱ�</li>
									<li bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">���ı�</li>
									<li bank_name="��������" bank_account="110-468-139853" holder_name="�Ѽ���(�����غ��̺� ��õ����)" b_bank_name="��������" b_bank_account="094701-04-313728" b_holder_name="�Ѽ���(�����غ��̺񰭼�����õ����)">��õ��</li>
									<li bank_name="KB��������" bank_account="535501-04-123954" holder_name="�̱���(�����غ��̺� ����������)" b_bank_name="��������" b_bank_account="804601-04-224922" b_holder_name="�̱��� (�����غ��̺� ������������)">��������</li>
									<li bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">��걸</li>
									<li bank_name="����" bank_account="301-3040-3577-51" holder_name="������(�����غ��̺� ��������)" b_bank_name="����" b_bank_account="301-3040-3573-11" b_holder_name="������(�����غ��̺� ���򡤸��������빮����)">����</li>
									<li bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">���α�</li>
									<li bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">�߱�</li>
									<li bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">�߶���</li>
								</ul>
							</div>
							<div id="account_bank">
								<div id="account">�Ϲݰ���<span class="dot">��</span><div class="line"></div></div>
								<div class="bank">
									<span class="bank_name">KB(��������)</span>
									<span class="bank_account">378801-01-07-123123</span>
									<div class="bank_holder">������: <span class="holder_name">ȫ�浿</span><br/><br/></div>
								</div>
								<div id="account">�ٿ�ó����<span class="dot">��</span><div class="line"></div></div>
								<div class="bank">
									<span class="b_bank_name">�ٿ�ó�����</span>
									<span class="b_bank_account">�ٿ�ó ���¹�ȣ</span>
									<div class="bank_holder">������: <span class="b_holder_name">ȫ���<br/><br/></span></div>
								</div>
							</div>
						</div>					
						<div class="sido">
							<div class="sido_name">��õ</div>
							<div class="sigu">
								<ul>
									<li class="black" bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">����</li>
									<li class="black" bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">��籸</li>
									<li class="black" bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">����</li>
									<li class="black" bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">�߱�</li>
									<li class="black" bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">����</li>
									<li class="black" bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">������</li>
									<li class="black" bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">������</li>
									<li class="black" bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">����</li>
								</ul>
							</div>
							<div id="account_bank">
								<div id="account">�Ϲݰ���<span class="dot">��</span><div class="line"></div></div>
								<div class="bank">
									<span class="bank_name">KB(��������)</span>
									<span class="bank_account">378801-01-07-123123</span>
									<div class="bank_holder">������: <span class="holder_name">ȫ�浿</span><br/><br/></div>
								</div>
								<div id="account">�ٿ�ó����<span class="dot">��</span><div class="line"></div></div>
								<div class="bank">
									<span class="b_bank_name">�ٿ�ó�����</span>
									<span class="b_bank_account">�ٿ�ó ���¹�ȣ</span>
									<div class="bank_holder">������: <span class="b_holder_name">ȫ���<br/><br/></span></div>
								</div>
							</div>
						</div>

						<div class="sido">
							<div class="sido_name">���</div>
							<div class="sigu">
								<ul>
									<li class="black" bank_name="KB��������" bank_account="469901-04-215774" holder_name="�質�� (�����غ��̺� �������)" b_bank_name="��������" b_bank_account="194601-04-243316" b_holder_name="�質��(�����غ��̺��硤�ϻꡤ���֡�����)">���</li>
									<li class="black" bank_name="KB��������" bank_account="469901-04-215774" holder_name="�質�� (�����غ��̺� �ϻ�����)"b_bank_name="��������" b_bank_account="194601-04-243316" b_holder_name="�質��(�����غ��̺��硤�ϻꡤ���֡�����)">�ϻ�</li>
									<li class="black" bank_name="KB��������" bank_account="469901-04-215774" holder_name="�質�� (�����غ��̺� ��������)"b_bank_name="��������" b_bank_account="194601-04-243316" b_holder_name="�質��(�����غ��̺��硤�ϻꡤ���֡�����)">����</li>
									<li class="black" bank_name="KB��������" bank_account="469901-04-215774" holder_name="�質�� (�����غ��̺� ��������)"b_bank_name="��������" b_bank_account="194601-04-243316" b_holder_name="�質��(�����غ��̺��硤�ϻꡤ���֡�����)">����</li>
									<li class="black" bank_name="KB��������" bank_account="378801-01-072771" holder_name="������ (�����غ��̺� ����������)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">������</li>
									<li class="black" bank_name="KB��������" bank_account="378801-01-072771" holder_name="������ (�����غ��̺� ��������)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">����</li>
									<li class="black" bank_name="KB��������" bank_account="378801-01-072771" holder_name="������ (�����غ��̺� ��õ����)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">��õ</li>
									<li class="black" bank_name="KB��������" bank_account="378801-01-072771" holder_name="������ (�����غ��̺� ����õ����)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">����õ</li>
									<li class="black" bank_name="��������" bank_account="110-250-834034" holder_name="���μ� (�����غ��̺� ��������)" b_bank_name="��������" b_bank_account="110-487-539479" b_holder_name="���μ�(�����غ��̺� ��������)">����</li>
									<li class="black" bank_name="�ϳ�����" bank_account="484-910330-68307" holder_name="�ۺ��� (�����غ��̺� �Ⱦ�����)" b_bank_name="�ϳ�����" b_bank_account="484-910011-74904" b_holder_name="�ۺ���(�����غ��̺�)">�Ⱦ�</li>
									<li class="black" bank_name="�ϳ�����" bank_account="484-910330-68307" holder_name="�ۺ��� (�����غ��̺� ��������)" b_bank_name="�ϳ�����" b_bank_account="484-910011-74904" b_holder_name="�ۺ���(�����غ��̺�)">����</li>
									<li class="black" bank_name="�ϳ�����" bank_account="484-910330-68307" holder_name="�ۺ��� (�����غ��̺� �ǿ�����)" b_bank_name="�ϳ�����" b_bank_account="484-910011-74904" b_holder_name="�ۺ���(�����غ��̺�)">�ǿ�</li>
									<li class="black" bank_name="�ϳ�����" bank_account="484-910330-68307" holder_name="�ۺ��� (�����غ��̺� ��õ����)" b_bank_name="�ϳ�����" b_bank_account="484-910011-74904" b_holder_name="�ۺ���(�����غ��̺�)">��õ</li>
									<li class="black wide" bank_name="KB��������" bank_account="378801-01-072771" holder_name="������ (�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">�� �� ��Ÿ ��� ����</li>
								</ul>
							</div>
							<div id="account_bank">
								<div id="account">�Ϲݰ���<span class="dot">��</span><div class="line"></div></div>
								<div class="bank">
									<span class="bank_name">KB(��������)</span>
									<span class="bank_account">378801-01-07-123123</span>
									<div class="bank_holder">������: <span class="holder_name">ȫ�浿</span><br/><br/></div>
								</div>
								<div id="account">�ٿ�ó����<span class="dot">��</span><div class="line"></div></div>
								<div class="bank">
									<span class="b_bank_name">�ٿ�ó�����</span>
									<span class="b_bank_account">�ٿ�ó ���¹�ȣ</span>
									<div class="bank_holder">������: <span class="b_holder_name">ȫ���<br/><br/></span></div>
								</div>
							</div>
						</div>

<!-- 						<div class="sido"> -->
<!-- 							<div class="sido_name">����</div> -->
<!-- 							<div class="sigu"> -->
<!-- 								<ul> -->
<!-- 									<li class="black" bank_name="KB��������" bank_account="478102-04-337215" holder_name="������ (�����غ��̺� ����������)">������</li> -->
<!-- 									<li class="black" bank_name="KB��������" bank_account="478102-04-337215" holder_name="������ (�����غ��̺� ��������)">����</li> -->
<!-- 									<li class="black" bank_name="KB��������" bank_account="478102-04-337215" holder_name="������ (�����غ��̺� ���������)">�����</li> -->
<!-- 									<li class="black" bank_name="KB��������" bank_account="478102-04-337215" holder_name="������ (�����غ��̺� ��������)">����</li> -->
<!-- 									<li class="black" bank_name="KB��������" bank_account="478102-04-337215" holder_name="������ (�����غ��̺� �߱�����)">�߱�</li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 							<div id="account_bank"> -->
<!-- 								<div id="account">����<span class="dot">��</span><div class="line"></div></div> -->
<!-- 								<div id="bank"> -->
<!-- 									<span class="bank_name">KB(��������)</span> -->
<!-- 									<span class="bank_account">378801-01-07-123123</span> -->
<!-- 									<div class="bank_holder">������: <span class="holder_name">ȫ�浿</span></div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!--                        	<div class="sido"> -->
<!-- 							<div class="sido_name">����</div> -->
<!-- 							<div class="sigu"> -->
<!-- 								<ul> -->
<!-- 									<li class="black" bank_name="KB��������" bank_account="234901-01-056778" holder_name="������ (�����غ��̺� ��õ����)">��õ</li> -->
<!-- 									<li class="black" bank_name="KB��������" bank_account="234901-01-056778" holder_name="������ (�����غ��̺� ��������)">����</li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 							<div id="account_bank"> -->
<!-- 								<div id="account">����<span class="dot">��</span><div class="line"></div></div> -->
<!-- 								<div id="bank"> -->
<!-- 									<span class="bank_name">KB(��������)</span> -->
<!-- 									<span class="bank_account">378801-01-07-123123</span> -->
<!-- 									<div class="bank_holder">������: <span class="holder_name">ȫ�浿</span></div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->

						<div class="sido">
							<div class="sido_name">�׿ܱ�Ÿ����</div>
							<div class="sigu">
								<ul>
									<li class="wide" bank_name="KB��������" bank_account="378801-01-072771" holder_name="������(�����غ��̺�)" b_bank_name="�츮����" b_bank_account="1005-103-220459" b_holder_name="������ (�����غ��̺���ĵ����)">�׿ܱ�Ÿ����</li>
								</ul>
							</div>
							<div id="account_bank">
								<div id="account">�Ϲݰ���<span class="dot">��</span><div class="line"></div></div>
								<div class="bank">
									<span class="bank_name">KB(��������)</span>
									<span class="bank_account">378801-01-07-123123</span>
									<div class="bank_holder">������: <span class="holder_name">ȫ�浿</span><br/><br/></div>
								</div>
								<div id="account">�ٿ�ó����<span class="dot">��</span><div class="line"></div></div>
								<div class="bank">
									<span class="b_bank_name">�ٿ�ó�����</span>
									<span class="b_bank_account">�ٿ�ó ���¹�ȣ</span>
									<div class="bank_holder">������: <span class="b_holder_name">ȫ���<br/><br/></span></div>
								</div>
							</div>
						</div>
                        
 
				</td>
			</tr>
                </td>
			</tr>
		</table></td>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->

</body>
</html>
