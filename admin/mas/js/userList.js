    var teamJson = new Ext.data.JsonReader({
		root:'teams',
		id: 'id',
		fields:[{
			name:'id',
			type:'int',
			mapping:'id'
		},{
			name:'part_name',
			type:'string',
			mapping:'part_name'
		},{
			name:'team_name',
			type:'string',
			mapping:'team_name'
		}]
	}); 
	
    var teamStore1 = new Ext.data.Store({
    //    id: 'Store1',
        proxy: new Ext.data.HttpProxy({
            url: '/admin/mas/json_team_list.asp',
            method: 'post'
        }),
        baseParams: {
            //part_name: "test"
        },
        reader: teamJson
    });	

	var teamItem1 = new Ext.form.ComboBox({
     //   id: 'userteam1',
        fieldLabel: '지역선택',
        store: teamStore1,
		emptyText:'선택',
		displayField: 'part_name',
		valueField: 'part_name',
        width: '200',
        //selectOnFocus:true,
        triggerAction: 'all',
        listeners: {
            select :function(combo,record,index){//( Ext.form.ComboBox combo, Ext.data.Record record, Number index ) 
                combo.collapse(); 
                combo.setValue(record.get("part_name"));
			    setTeamItem(combo.getValue(),'');			    
		    } 
        }
    });
    
    var partName ;
    
    var teamStore2 = new Ext.data.Store({
      //  id: 'Store2',
        proxy: new Ext.data.HttpProxy({
            url: '/admin/mas/json_team_list.asp',
            method: 'post',
            menu:"team_auth"
        }),
        baseParams: {
           // part_name:partName
        },
        reader: teamJson
    });	
    
	var teamItem2 = new Ext.form.ComboBox({
       // id: 'userteam2',
        fieldLabel: '팀선택',
        store: teamStore2,
		emptyText:'선택',
		displayField: 'team_name',
		valueField: 'id',
        width: '200',
        triggerAction: 'all',
        forceSelection:true,
        listeners: {
            select :function(combo,record,index){//( Ext.form.ComboBox combo, Ext.data.Record record, Number index ) 
                combo.collapse(); 
                combo.setValue(record.get("id"));		    
		    } 
        }
    });
    
    var userItem = new Ext.form.TextField({
        emptyText:'성명',
        fieldLabel: '성명',
        maxLength: 20,
        anchor: '70%'
    });
     
    var useYNItem = new Ext.form.ComboBox({
        fieldLabel: '사용여부',
        store: new Ext.data.SimpleStore({
            fields: ['value', 'text'],
            data: [['', '전체'],['Y', '사용'], ['N', '삭제']]
        }),
        mode: 'local',
        emptyText: '전체',
        selectOnFocus: true,
        displayField: 'text',
        valueField: 'value',
        width:100,
        triggerAction: 'all'
    }); 
         
    var nothContent = new Ext.Panel({ // raw
        region:'north',
        el: 'north',
        layout:'anchor',
        border: false,
        height:24,
        items: [{
            xtype:'box',
            el:'header',
            border:false
        }, new Ext.Toolbar({
                cls:'top-toolbar',
                items:[ '지역:',teamItem1,'-','팀:',teamItem2,'-','성명:',userItem,'-','사용여부:',useYNItem,"  ",
                    {
                        text:'검색', 
                        tooltip: '검색',
                        pressed :true,
                        handler: function(){ searchUser(); }
                    },'->',
                    {
                        text:'사용자 등록', 
                        tooltip: '사용자 등록',
                        pressed :true,
                        handler: function(){initWinForm(); }
                    }
                ]
            })
         ]
       });

    var userJson = new Ext.data.JsonReader({
        root:'users', 
        totalProperty:'recordCount',
        id: 'id',
        fields: [{
			name:'ul_grp_cd',
			type:'string',
			mapping:'ul_grp_cd'
		},{
			name:'cc_kor_nm',
			type:'string',
			mapping:'cc_kor_nm'
		},{
			name:'part_name',
			type:'string',
			mapping:'part_name'
		},{
			name:'ul_mem_id',
			type:'string',
			mapping:'ul_mem_id'
		},{
			name:'ul_mem_nm',
			type:'string',
			mapping:'ul_mem_nm'
		},{
			name:'ul_level',
			type:'string',
			mapping:'ul_level'
		},{
			name:'member_name',
			type:'string',
			mapping:'member_name'
		},{
			name:'ul_use_yn',
			type:'string',
			mapping:'ul_use_yn'
		},{
			name:'start',
			type:'int',
			mapping:'start'
		},{
			name:'limit',
			type:'int',
			mapping:'limit'
		},{
			name:'pwd',
			type:'string',
			mapping:'pwd'
		}]
    });
     
	var userName = "";
	var userStore = new Ext.data.Store({
       // id: 'menuStore',
        proxy: new Ext.data.HttpProxy({
            url: 'json_user_list.asp', // File to connect to
            method: 'POST'
        }),
        baseParams: {
            groupCode	: teamItem2.getValue(),
            userName	: escape(userName),
            useYN		: useYNItem.getValue()
        },
        reader: userJson
    });
    
   //store.setDefaultSort('id', "DESC"); 
   var columns =[{
        header: "지역명",
        width: 50,
        dataIndex: 'cc_kor_nm',
        sortable: false        
    },{
        header: "사용자성명",
        width: 50,
        dataIndex: 'ul_mem_nm',
        sortable: false
    },{
        header: "사용자코드",
        width: 50,
        dataIndex: 'ul_mem_id',
        sortable: false
    },{
        header: "직책",
        width: 50,
        dataIndex: 'ul_level',
        sortable: false
    },{
        header: "사용여부",
        width: 50,
        dataIndex: 'ul_use_yn',
        sortable: false,
        renderer : setUseTitle
    }];

	var selectionModel = new Ext.grid.RowSelectionModel({
		singleSelect: true
    });
    
   var contentPaging =  new Ext.PagingToolbar({
		pageSize:30,
		store: userStore,
		displayInfo: true,
		firstText : "처음", 
		lastText : "마지막",
		nextText : "다음",
		prevText : "이전",
		refreshText : "새로고침", 
		displayMsg: '전체 <font color="red">{2}</font> 중 {0} - {1}',
		emptyMsg: "No topics to display"
	});
                                  
	var centerContent = new Ext.grid.GridPanel( {
        region: 'center',
        store : userStore,
        columns : columns,
        margins:'5 5 5 5',
        autoScroll: true,
        autoWidth: true,
        viewConfig: {
            forceFit: true,
            autoExpandColumn: 'id'
        },
        loadMask: {
            msg: '데이타 로드중'
        },
        sm: selectionModel,
        border:true,
        bbar :contentPaging
	});

	centerContent.on('rowcontextmenu', onContextClick, centerContent);       
	centerContent.on('rowdblclick', onRowClick, centerContent);        
    
	var menu;

	function onRowClick(grid,index,e){
		if (grid.ctxRow) {
            grid.ctxRow = null;
        }
        grid.ctxRow = grid.view.getRow(index);
        record = grid.store.getAt(index);
        setTeamItem(record.data.part_name,'pop');	
        
        popTeamItem1.setValue(record.data.part_name);               
        popTeamItem2.setValue(record.data.ul_grp_cd);
        popNameItem.setValue(record.data.ul_mem_nm);
        popIdItem.setValue(record.data.ul_mem_id);
        popLevelItem.setValue(record.data.ul_level);
        popModeItem.setValue('edit');        
	}
             
	function onContextClick(grid, index, e){
		if (grid.ctxRow) {
            grid.ctxRow = null;
        }
        grid.ctxRow = grid.view.getRow(index);
        grid.ctxRecord = grid.store.getAt(index);
        selectionModel.selectRow(index);        
        setTeamItem(grid.ctxRecord.data.part_name,'pop');	
        if (win) win.hide();
        
        if(grid.ctxRecord.data.ul_use_yn =="Y") {deleteText = "삭제";} else {deleteText = "사용";}
            menu = new Ext.menu.Menu({
                id: 'grid-ctx',
                shadow : true,
                items: [
               {
                    text: grid.ctxRecord.data.ul_mem_nm+"("+grid.ctxRecord.data.ul_mem_id+")"
                }, '-',
                {
                    id: 'modify',
                    text: '수정',
                    scope:this,
                    handler: function(){                        
                        modifyUser(grid.ctxRecord);
                    }
                },{
                    id: 'delete',
                    text: deleteText,
                    scope:this,
                    handler: function(){
                        page = (grid.ctxRecord.data.start/grid.ctxRecord.data.limit) +1;
                        setUserAuth(grid.ctxRecord.data.ul_mem_id,grid.ctxRecord.data.ul_use_yn,page);
                    }
                }]
            });
            
            menu.on('hide', onContextHide, grid);
        //}
        
        e.stopEvent();
                
        menu.showAt(e.getXY());
   }
   
   function onContextHide(grid){
        if (grid.ctxRow) {
            grid.ctxRow = null;
        }
        
        menu = "";
    }
    
   function setTeamItem(value,target){
        if (value != "") {
            if ( target =="pop"){
                partName = value;
                popTeamItem2.setValue('');
                popTeamStore2.baseParams = {
                    part_name: escape(partName)
                };
                popTeamStore2.reload();
            }else{
                partName = value;
                teamItem2.setValue('');
                teamStore2.baseParams = {
                    part_name: escape(partName)
                };
                teamStore2.reload();
            } 
        }  
     }
     
    function searchUser(){
        userName = userItem.getValue() ;
        
        userStore.baseParams = {
            groupCode	: teamItem2.getValue(),
            userName	: escape(userName),
            useYN		: escape(useYNItem.getValue())
		};
		
		userStore.load();	
    }
    
   //사용여부 확인
   function setUserAuth(user_id,use_yn,page){   //setUserAuth(record.data['ul_mem_id'],record.data[this.dataIndex])
        Ext.Ajax.request({
                url: 'user_action.asp',
                method:'POST',
                params: {
                    mode : "USE",
                    useYN : use_yn,
                    userId : user_id
                },
                success: function(){ 
                    //userStore.load();	
                     contentPaging.changePage(page);
                },
                failure: function(){alert("failure")},
                scope: this
        });    

   }
   
   function setUseTitle(value){
		var strValue = "";
		if(value =="Y") strValue = "<font color='blue'>사용</font>";
		if(value =="N") strValue = "<font color='red'>삭제</font>";
		
		return strValue;
	}
	                  
   window.onload = function() {
        Ext.QuickTips.init();
        var viewport = new Ext.Viewport({
                layout:"border",
                items:[
                    nothContent,
                    centerContent
                 ]
            });      
        userStore.load();       
    };