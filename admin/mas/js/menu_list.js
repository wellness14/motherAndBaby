 //폼세팅..
        var idItem = new Ext.form.TextField({
            fieldLabel: '메뉴코드',
            anchor: '95%',
            readOnly:true,
            inputType:'text'
        });
        
        var nameItem = new Ext.form.TextField({
            fieldLabel: '메뉴명',
            anchor: '95%',
            inputType:'text'
        });
        
        var urlItem = new Ext.form.TextField({
            fieldLabel: 'URL',
            anchor: '95%',
            inputType:'text',
            disabled:true
        });
        
        var nameItem2 = new Ext.form.TextField({
            fieldLabel: '메뉴명',
            anchor: '95%',
            inputType:'text'
        });
        
        var urlItem2 = new Ext.form.TextField({
            fieldLabel: 'URL',
            anchor: '95%',
            inputType:'text',
            disabled:true
        });
        
        var dirChkItem = new Ext.form.RadioGroup({
            fieldLabel: '메뉴구분',
            id:'leafChk',
            items: [
                {boxLabel: '디렉토리',name:'leaf', xtype: 'radio',inputValue: 1,checked:true},
                {boxLabel: '메뉴',name:'leaf',xtype: 'radio',inputValue: 2}
            ],
            listeners:{
                change : function (a,b){//( Ext.form.Field this, Mixed newValue, Mixed oldValue ) 
                    setRadioSelect(b)
               } 
            }
        });
        
        var treeNode = null;
        
        var form = new Ext.FormPanel({
            labelWidth: 75,  
            url:'save-form.php',
            frame:true,
            title: '내용',
            el:'formDiv',
            region: 'formDiv',
            bodyStyle:'padding:5px 5px 0',
            width: 450,            
            //defaultType: 'textfield',

            items: [{
                xtype:'fieldset',
                id:"set1",  
                //checkboxToggle:true,
                title: '선택 메뉴',
                autoHeight:true,
                defaults: {width: 210},
                defaultType: 'textfield',
                items :[idItem ,nameItem,urlItem]
            },{
                xtype:'fieldset',
                id:"set2", 
                title: '하위 메뉴 추가',
                collapsible: true,
                collapsed: false, 
                autoHeight:true,
                defaults: {width: 210},
                width: 425, 
                defaultType: 'textfield',
                items :[dirChkItem,nameItem2,urlItem2],
                listeners:{
                      beforeexpand   : function(n,e){
                        if( urlItem.getValue() != ""){
                            msgBox("해당 메뉴는 하위메뉴를 추가 할 수 없습니다.");
                            return false;
                        }
                     }                     
                } 
            }],
                
            buttons: [{
                text: 'Save',
                handler: function() { saveMenu();}
            },{
                text: 'Cancel'
            }]
        });
            
        var sourceId = "";
        
        var treeLoader = new Ext.tree.TreeLoader({
                requestMethod :'GET',
                clearOnLoad : true, 
                dataUrl: '/admin/menu.asp'
            }) ;
            
        var treeNode = null;
        
        var tree = new Ext.tree.TreePanel({
            title:'메뉴',
            el:'treeDiv',
            region:'treeDiv',
            useArrows:true,
            autoScroll:true,
            animate:true,
            enableDD:true,
            containerScroll: true,
            singleExpand: true,
            loader:treeLoader,
            root: {
                nodeType: 'async',
                text: '마더앤베이비 관리자',
                draggable:false,
                expanded:true, 
                id:'0'                
            },
            rootVisible: true,
            
            contextMenu: new Ext.menu.Menu({
                items: [{
                    id: 'delete-node',
                    text: '삭제'
                }],
                listeners: {
                    itemclick: function(item) {
                        switch (item.id) {
                            case 'delete-node':
                                var n = item.parentMenu.contextNode;
                                if (n.parentNode) {
                                    treeNode = n;
                                    if(treeNode.hasChildNodes() ){
                                        msgBox("하위 메뉴가 있는 메뉴는 삭제가 불가능합니다.","info");
                                        return false;
                                    }
                                    Ext.MessageBox.confirm('Confirm', '선택메뉴를 삭제하시겠습니까?', removeTree );
                                }
                                break;
                        }
                    }
                }
            }),

            listeners: {
                click: function(n,e){            
                    //alert("menu"+n.attributes.id+"--"+ n.attributes.text+"--"+ n.attributes.url);
                    setFormValue(n);
                    treeNode = n;
                },
                dragdrop  :function(a, n, dd,e){//( Ext.tree.TreePanel this, Ext.tree.TreeNode node, DD dd, event e ) 
                    
                   Ext.Ajax.request({
                        url: 'menu_move.asp',
                        method:'POST',
                        params: {
                            sourceId : n.attributes.id,
                            targetId : targetId,
                            point : targetPoint 
                        },
                        success: function(){},
                        failure: function(){alert("failure")},
                        scope: this
                    });
                    
               },
               enddrag :function(t,n,e){ //( Ext.tree.TreePanel this, Ext.tree.TreeNode n, event e ) {
                    //alert(n.attributes.id);
               },
                nodedrop :function(e){ //( Object dropEvent ) 
                    targetId = e.target.id;
                    targetPoint = e.point;                       
               }, 
                contextmenu: function(node, e) {
                //          Register the context node with the menu so that a Menu Item's handler function can access
                //          it via its parentMenu property.
                    node.select();
                    setFormValue(node);      
                    var c = node.getOwnerTree().contextMenu;
                    c.contextNode = node;
                    c.showAt(e.getXY());
                }               
            }
        
        });
        
           
        function setFormValue(n){
            idItem.setValue( n.attributes.id);
            nameItem.setValue( n.attributes.text);
            urlItem.setValue(n.attributes.url);
            
            //alert(n.attributes.leaf);
            if (n.attributes.leaf) {//메뉴
                urlItem.setDisabled(false);  
                urlItem2.setDisabled(true); 
                nameItem2.setDisabled(true); 
            } else {//디렉토리
                urlItem.setDisabled(true); 
                urlItem2.setDisabled(true); 
                nameItem2.setDisabled(false);  
            }
            
            dirChkItem.setValue("1");       
        }
        
        function setRadioSelect(val){
            if(val =="1"){
                urlItem2.setDisabled(true);
            }else{
                
                if( urlItem.getValue() != ""){
                    dirChkItem.setValue("1"); 
                    msgBox("해당 메뉴는 하위메뉴를 추가 할 수 없습니다.");
                    return false;
                }
                urlItem2.setDisabled(false);
            }
        }
        
        function saveMenu(){
            //상위메뉴 선택확인.
            if (idItem.getValue() == ""){
                msgBox("메뉴를 선택하십시오.");
               return false; 
            }  
            
            form.getForm().submit({
                url: 'menu_save.asp',
                method: 'POST',                
                params: {
                    id : escape(idItem.getValue()),
                    dirChkItem : escape(idItem.getValue()),
                    name : escape(nameItem.getValue()),
                    url : escape(urlItem.getValue()),
                    subName : escape(nameItem2.getValue()),
                    subUrl : escape(urlItem2.getValue())                    
                },
	            waitMsg: '저장중입니다. ',
                success: function(f,action){
                    //메뉴 수정
                    pNode = treeNode.parentNode;                    
                    treeNode.setText(nameItem.getValue());
                   
                    treeNodeIndex = pNode.indexOf(treeNode);
                    
                    treeLoader.load(pNode);
                    pNode.expand(true,true,function(){
                        setTimeout(function(){
                           pNode.item(treeNodeIndex).select();
                           treeNode = pNode.item(treeNodeIndex);
                           treeNode.expand();
                        }, 250);
                        
                        nameItem2.setValue("");
                        urlItem2.setValue("");
                        dirChkItem.setValue("1");       
                    });
                }
            });
        }
        
        function removeTree(btn){
            if(btn=="yes"){
				Ext.Ajax.request({
						url: 'menu_del.asp',
						method:'POST',
						params: {
							sourceId : escape(treeNode.attributes.id)
						},
						success: function(){ 
							treeNode.remove();
							idItem.setValue("");                                
							nameItem.setValue("");
							urlItem.setValue("");
							nameItem2.setValue("");
							urlItem2.setValue("");
							dirChkItem.setValue("1");       
						},
						failure: function(){alert("failure")},
						scope: this
				}); 
            } 
        } 
                                    
                                    
        Ext.onReady(function(){
        });
        
        //Ext.onReady IE 버그로 인해 window.onload 사용함
        window.onload = function(){
            tree.render();
            form.render();  
        };        

       