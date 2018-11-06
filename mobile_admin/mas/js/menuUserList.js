    Ext.grid.CheckColumn = function(config){
        Ext.apply(this, config);
        if(!this.id){
            this.id = Ext.id();
        }
        this.renderer = this.renderer.createDelegate(this);
    };
         
    Ext.grid.CheckColumn.prototype ={
        init : function(grid){
            this.grid = grid;
            this.grid.on('render', function(){
                var view = this.grid.getView();
                view.mainBody.on("mousedown", this.onMouseDown, this);
            }, this);
        },

        onMouseDown : function(e, t){
            if(t.className && t.className.indexOf('x-grid3-cc-'+this.id) != -1){
                e.stopEvent();
                var index = this.grid.getView().findRowIndex(t);
                var record = this.grid.store.getAt(index);
                record.set(this.dataIndex, !record.data[this.dataIndex]);
                //alert(record.data['id']);
                setTeamAuth(this.dataIndex,record.data['id'],record.data[this.dataIndex]); 
                
            }
        },

        renderer : function(v, p, record){
            p.css += ' x-grid3-check-col-td'; 
            return '<div class="x-grid3-check-col'+(v?'-on':'')+' x-grid3-cc-'+this.id+'">&#160;</div>';
        }
    };
 
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
            url: 'json_team_list.asp',
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
            url: 'json_team_list.asp',
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
        listeners: {
            select :function(combo,record,index){//( Ext.form.ComboBox combo, Ext.data.Record record, Number index ) 
                combo.collapse(); 
                combo.setValue(record.get("id"));
			    setUserItem(combo.getValue(),'');				    
		    } 
        }
    }); 
    
   var treeLoader =  new Ext.tree.TreeLoader({
            requestMethod :'GET',
            dataUrl: '/admin/Menu.asp',
             baseParams : {
                menu:"team_auth"
            } 
        });
         
   var westContent =  new Ext.tree.TreePanel({
        region: 'west',
        width: 300,
        minSize: 300,
        maxSize: 300,
        margins:'30 0 5 5',
        autoScroll: true,
        useArrows:true,
        containerScroll: true,
        split:true,
        animCollapse:false,
        animate: true,
        lines:false,
        singleExpand: true,        
        loader: treeLoader,
        root: new Ext.tree.AsyncTreeNode({
            text: '마더앤베이비 관리자 메뉴',
            nodeType: 'async',
            expanded:true,
            draggable: false,
            id: '0'
        }),
        rootVisible: true,
         
        listeners: {
            click: function(n,e){            
               setGridData(n.attributes.id,n.attributes.text);
            }
        }
    });
    
    var menuJson = new Ext.data.JsonReader({
        root:'teams', 
        totalProperty:'recordCount',
        id: 'id',
        fields: [{
            name: 'id',
            type: 'string',
            mapping: 'id'
        }, {
            name: 'part_name',
            type: 'string',
            mapping: 'part_name'
        }, {
            name: 'team_name',
            type: 'string',
            mapping: 'team_name'
        }      
       , {
            name: 'user_name',
            type: 'string',
            mapping: 'user_name'
        }
        , {
            name: 'user_auth',
            type: 'bool',
            mapping: 'user_auth'
        }
        ]
    })
        
   var menuStore = new Ext.data.Store({
        id: 'menuStore',
        proxy: new Ext.data.HttpProxy({
            url: 'json_menu_user_list.asp', // File to connect to
            method: 'GET'
        }),
        baseParams: {
            node: "0",
            part_name:"all"
        }, // this parameter asks for listing
        // the return will be Json, so lets set up a reader
        reader: menuJson
    });
 
   var checkColumn = new Ext.grid.CheckColumn({
        header: "사용",
        id:"user", 
        dataIndex: 'user_auth',
        width: 55  
    });
      
   //store.setDefaultSort('id', "DESC"); 
   var columns =[{
        header: "사용자ID",
        dataIndex: 'id',
        sortable: false,
        filterable: true,
        filter: {type: 'list'}
/*
	},{
		header: "지역명",
		dataIndex: 'part_name',
		sortable: false,
		filterable: true,
		filter: {type: 'list'}
	},{
		header: "팀명",
		width: 50,
		dataIndex: 'team_name',
		sortable: false
*/
	},{
        header: "이름",
        width: 50,
        dataIndex: 'user_name',
        sortable: false
    },checkColumn];
    
   var centerContent = new Ext.grid.GridPanel( {
        title:'팀별 메뉴 관리 ',
        region: 'center',
        store : menuStore,
        columns : columns,
        margins:'30 5 5 0',
        autoScroll: true,
        //autoHeight :true,
        autoWidth: true,
        viewConfig: {
            forceFit: true,
            autoExpandColumn: 'id'
        },
        plugins:[checkColumn],
        //frame:true,
        border:true
        // inline buttons
        ///buttons: [{text:'Save'},{text:'Cancel'}],
       // buttonAlign:'center'
        
   });
     
   var menuId;
    
    function setGridData(id,title){
        menuId = id; 
        centerContent.setTitle(title);
        
        menuStore.baseParams = {
            node: id,
            part_name:"all"
        };
        
        menuStore.load();	
    }
    
   function setMenuList(pId){
        //tree reload        
        var rootNode = westContent.getRootNode();
        
        treeLoader.baseParams = {
            menu:"team_auth",
            teamId:pId
        }
        
        treeLoader.load(rootNode);
        rootNode.expand();
        
        //grid reload
        setGridData(0);
   }
    
   function setTeamAuth(indexText,userId,select){ //데이터 구분,팀아이디,선택여부)
               
        Ext.Ajax.request({
                url: 'menu_user_action.asp',
                method:'POST',
                params: {
                    menuId : menuId,
                    userId : userId,
                    indexText : "user_auth",
                    select : select
                },
                success: function(){ 
                    //alert("success");
                   // menuStore.load();	
                },
                failure: function(){alert("failure")},
                scope: this
        });    
   }
   
   window.onload = function() {
   
        Ext.QuickTips.init();

        Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
        
        var viewport = new Ext.Viewport({
                layout:"border",
                items:[
                   // nothContent,
                    westContent,
                    centerContent
                 ]
            });      
            
        menuStore.load();       
    };     