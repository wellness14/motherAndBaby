    var popTeamStore1 = new Ext.data.Store({
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

	var popTeamItem1 = new Ext.form.ComboBox({
        id: 'popUserteam1',
        fieldLabel: '지역선택',
        store: popTeamStore1,
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
			    setTeamItem(combo.getValue(),'pop');
			    
		    } 
        }
    });

    var popTeamStore2 = new Ext.data.Store({
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
    
	var popTeamItem2 = new Ext.form.ComboBox({
        id: 'popUserteam2',
        fieldLabel: '팀선택',
        store: popTeamStore2,
		emptyText:'선택',
		displayField: 'team_name',
		valueField: 'id',
        width: '200',
        triggerAction: 'all',
        listeners: {
            select :function(combo,record,index){//( Ext.form.ComboBox combo, Ext.data.Record record, Number index ) 
                combo.collapse(); 
                combo.setValue(record.get("id"));		    
		    } 
        }
    });
   
   var popNameItem = new Ext.form.TextField({
        emptyText:'성명',
        fieldLabel: '성명',
        maxLength: 20,
        anchor: '70%'
    });
   
    var popIdItem = new Ext.form.TextField({
        emptyText:'아이디',
        fieldLabel: '아이디',
        maxLength: 20,
        anchor: '70%'
    });    
    
   var popLevelItem = new Ext.form.TextField({
        emptyText:'직책',
        fieldLabel: '직책',
        maxLength: 20,
        anchor: '70%'
    });  

    var popModeItem = new Ext.form.TextField({
        emptyText:'Mode',
        fieldLabel: 'Mode',
        maxLength: 20,
        hideLabel :true,
        hidden : true,
        anchor: '70%'
    });  
    
   var popPwdItem = new Ext.form.TextField({
        emptyText:'Pwd',
        fieldLabel: 'Pwd',
        maxLength: 20,
       // hideLabel :true,
        //hidden : true,
        anchor: '70%'
    });  
     
    var popupContent = new Ext.FormPanel({
        labelWidth: 75, // label settings here cascade unless overridden
        frame:true,
        bodyStyle:'padding:5px 5px 0',
        defaultType: 'textfield',

        items: [popTeamItem1,popTeamItem2,popNameItem,popIdItem,popPwdItem,popLevelItem,popModeItem],

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
        if (popTeamItem1.getValue() == ""){
            msgBox("지역를 선택하십시오.");
            return false;
        }
        
        if (popTeamItem2.getValue() == ""){
            msgBox("팀을 선택하십시오.");
            return false;
        }
        
        if(popNameItem.getValue() =="" ){
            msgBox("성명을 입력하십시오.");
            return false;
        }
        
        if(popIdItem.getValue() =="" ){
            msgBox("아이디를 입력하십시오.");
            return false;
        }
        
        if(popLevelItem.getValue() =="" ){
            msgBox("직책을 입력하십시오.");
            return false;
        }
        
         Ext.Ajax.request({
                url: 'user_action.asp',
                method:'POST',
                params: {
                    teamId : popTeamItem2.getValue() ,
                    level  : escape(popLevelItem.getValue()) ,
                    userId : popIdItem.getValue(),
					userPw : escape(popPwdItem.getValue()),
                    mode   : popModeItem.getValue(),
					userNm : escape(popNameItem.getValue())
                },
               scope: this, 
                success: function(){ 
                    //alert("success");                    
                    win.hide();
                },
                failure: function(){alert("failure")}
                
        }); 
   } 
    
   var win; 
   function showWindow(){
        if(!win){
            win = new Ext.Window({
                applyTo     : 'winDiv',
                layout      : 'fit',
                width       : 300,
                height      : 260,
                closeAction :'hide',
                title:"사용자 등록", 
                plain       : true,
                resizable : false, 
                items       :[popupContent]
              
            });
        }                
        win.show();            
   } 
   
   function initWinForm(){
        popTeamItem1.setValue('');
        popTeamItem2.setValue('');
        popNameItem.setValue('');
        popIdItem.setValue('');
        popLevelItem.setValue('');
        popModeItem.setValue('INS');
        
        showWindow();
        win.setTitle("사용자 등록");
   }
   
   function modifyUser(record){
		popTeamItem1.setValue(record.data.part_name);               
        popTeamItem2.setValue(record.data.ul_grp_cd);
        popNameItem.setValue(record.data.ul_mem_nm);
        popIdItem.setValue(record.data.ul_mem_id);
        popLevelItem.setValue(record.data.ul_level);
        popModeItem.setValue('EDIT');
                        
        showWindow();
        win.setTitle("사용자 수정");
   }