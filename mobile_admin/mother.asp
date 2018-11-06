<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<!--#include virtual="/admin/common/asp/checkUser.asp"-->
<html lang="ko">
<head>
  <title> :: MothernBaby  Back Office :: </title>
	<meta http-equiv="Content-Type" content="text/html;charset=euc-kr">
	<link rel="stylesheet" type="text/css" href="/common/js/ext-2.2/resources/css/ext-all.css" />
	<script type="text/javascript" src="/common/js/ext-2.2/adapter/ext/ext-base.js"></script>
	<script type="text/javascript" src="/common/js/ext-2.2/ext-all.js"></script>
	<script type="text/javascript" src="/common/js/ext-2.2/ext-patch.js"></script>
	<script type="text/javascript" src="/common/js/ext-2.2/miframe-min.js"></script>
	<script type="text/javascript" src="/common/js/ext-2.2/examples/tabs/TabCloseMenu.js"> </script>

	<link rel="stylesheet" type="text/css" href="<%=url_common%>/css/ExtStyle.css">
	<script type="text/javascript">
		var nothContent = new Ext.BoxComponent({ // raw
			region:'north',
			el: 'north',
			height:48
		}) ;

		var westContent = {
			region: 'west',
			collapsible: true,
			xtype: 'treepanel',
			width: 230,
			minSize: 175,
			maxSize: 500,
			margins:'0 0 5 5',
			cmargins:'0 0 0 0',
			autoScroll: true,
			useArrows:true,
			containerScroll: true,
			split:true,
			animCollapse:false,
			animate: true,
			lines:false,
			collapseMode:'mini',
			singleExpand: true,

			loader: new Ext.tree.TreeLoader({
				requestMethod :'GET',
				dataUrl: '/mobile_admin/mobile_member_list.asp'
			}),
			root: new Ext.tree.AsyncTreeNode({
				text: '메뉴',
				nodeType: 'async',
				expanded:true,
				draggable: false,
				id: '0'
			}),
			rootVisible: false,

			listeners: {
				click: function(n,e){
					if (n.attributes.leaf) {

						addTab("menu"+n.attributes.id, n.attributes.text, n.attributes.url);
					}
				}
			},

			tbar: [{
				text:'비밀번호 변경',
				tooltip: '비밀번호 변경',
				handler: function(){showWindow();},
				scope: this
			},'->', '-', {
				text:'Logout',
				tooltip: '로그아웃',
				handler: function(){location.href='/admin/logout.asp';},
				scope: this
			}/*,{
				iconCls: 'icon-collapse-all',
				tooltip: '모든 메뉴 닫기',
				handler: function(){ collapseAll(); }
			}*/]
		};

		var centerContent = new Ext.TabPanel({
			region:'center',
			id:'doc-body',
			enableTabScroll:true,
			deferredRender:false,
			activeTab:0,
			defaultType:"iframepanel",
			resizeTabs: true,
			minTabWidth: 135,
			tabWidth: 135,
			margins:'0 5 5 0',

			plugins: new Ext.ux.TabCloseMenu(),
			items:[{
				title:"Home",
				id:'home',
				closable:false,
				defaultSrc:'/admin/main.asp'
			}
			]
		});

		function expandAll(){
			 westContent.root.expand(true);
	   }

	   function collapseAll(){
			westContent.root.collapse(true);
	   }

		function addTab(tabId, tabTitle, targetUrl){
			Ext.get('loading').show();

			var tab = centerContent.getItem(tabId);

			if (!tab) {
				centerContent.add({
						xtype:"iframepanel",
						title: tabTitle,
						id:tabId,
						closable:true,
						defaultSrc: targetUrl
					}).show();
			}else{
				   tab.iframe.dom.src = targetUrl;
			}

			setTimeout(function(){
				Ext.get('loading'). hide();
				Ext.get('loading-mask').fadeOut({remove:false});
			}, 250);

			 centerContent.setActiveTab(tab);
		}

		var popPwdItem1 = new Ext.form.TextField({
			fieldLabel: '이전 비밀번호',
			maxLength: 20,
			inputType: 'password',
		   // hideLabel :true,
			//hidden : true,
			anchor: '80%'
		});

		var popPwdItem2 = new Ext.form.TextField({
			fieldLabel: '비밀번호',
			maxLength: 20,
			inputType: 'password',
		   // hideLabel :true,
			//hidden : true,
			anchor: '80%'
		});

		var popPwdItem3 = new Ext.form.TextField({
			fieldLabel: '비밀번호 확인',
			maxLength: 20,
			inputType: 'password',
		   // hideLabel :true,
			//hidden : true,
			anchor: '80%'
		});

		var popupContent = new Ext.FormPanel({
			labelWidth: 100, // label settings here cascade unless overridden
			//url:'user_action.asp',
			frame:true,
			bodyStyle:'padding:5px 5px 0',
			defaultType: 'textfield',

			items: [popPwdItem1,popPwdItem2,popPwdItem3],

			buttons: [{
				text: '저장',
				handler:function(){
					userSubmit();
				}
			},{
				text: '취소',
				handler  : function(){
						win.hide();
					}
			}]
		});

	   function userSubmit(){
			if(popPwdItem1.getValue() =="" ){
				msgBox("이전 비밀번호를 입력하십시오.");
				return false;
			}

			if(popPwdItem2.getValue() =="" ){
				msgBox("비밀번호를 입력하십시오.");
				return false;
			}

			if(popPwdItem3.getValue() =="" ){
				msgBox("비밀번호 확인을 입력하십시오.");
				return false;
			}

			 if(popPwdItem2.getValue() != popPwdItem3.getValue() ){
				msgBox("비밀번호와 비밀번호 확인이 다릅니다.");
				return false;
			}

			 Ext.Ajax.request({
					url: '/admin/mas/user_action.asp',
					method:'POST',
					params: {
						mode : "PWD",
						userId : "<%=uId%>",
						prevPwd : popPwdItem1.getValue(),
						modifyPwd : popPwdItem2.getValue()
					},
				   scope: this,
					success: function(response, opts){
						if(response.responseText == "true"){
							msgBox("비밀번호를 변경했습니다.");

							 popPwdItem1.setValue('');
							 popPwdItem2.setValue('');
							 popPwdItem3.setValue('');


							win.hide();
						}else{
							msgBox("이전 비밀번호가 등록된 비밀번호와 다릅니다.");
						}
					},
					failure: function(){
						msgBox("서버 오류로 처리에 실패했습니다.");
					}

			});
	   }

		var win;
	   function showWindow(){
			if(!win){
				win = new Ext.Window({
					applyTo     : 'winDiv',
					layout      : 'fit',
					width       : 300,
					height      : 180,
					closeAction :'hide',
					title:"비밀번호 변경",
					plain       : true,
					resizable : false,
					items       :[popupContent]

				});
			}
			win.show();
	   }

		Ext.onReady(function(){
			Ext.QuickTips.init();
			//Ext.state.Manager.setProvider(new Ext.state.CookieProvider());

			var viewport = new Ext.Viewport({
					layout:'border',
					items:[
						nothContent,
						westContent,
						centerContent
					 ]
				});

			viewport.doLayout();

			setTimeout(function(){
				Ext.get('loading'). hide();
				Ext.get('loading-mask').fadeOut({remove:false});
			}, 250);

		});
	</script>
</head>
<body>
	<div id="loading-mask" style=""></div>
	<div id="loading">
		<div class="loading-indicator"><img src="<%=img_admin%>/large-loading.gif" style="margin-right:8px;" align="absmiddle"/>Loading...</div>
	</div>
	<div id="west"></div>
	<div id="north" class="topback"></div>
	<div id="winDiv"></div>
</body>
</html>