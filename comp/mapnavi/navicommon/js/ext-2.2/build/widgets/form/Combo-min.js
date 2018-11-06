/*
 * Ext JS Library 2.2
 * Copyright(c) 2006-2008, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */

Ext.form.ComboBox=Ext.extend(Ext.form.TriggerField,{defaultAutoCreate:{tag:"input",type:"text",size:"24",autocomplete:"off"},listClass:"",selectedClass:"x-combo-selected",triggerClass:"x-form-arrow-trigger",shadow:"sides",listAlign:"tl-bl?",maxHeight:300,minHeight:90,triggerAction:"query",minChars:4,typeAhead:false,queryDelay:500,pageSize:0,selectOnFocus:false,queryParam:"query",loadingText:"Loading...",resizable:false,handleHeight:8,editable:true,allQuery:"",mode:"remote",minListWidth:70,forceSelection:false,typeAheadDelay:250,lazyInit:true,initComponent:function(){Ext.form.ComboBox.superclass.initComponent.call(this);this.addEvents("expand","collapse","beforeselect","select","beforequery");if(this.transform){this.allowDomMove=false;var C=Ext.getDom(this.transform);if(!this.hiddenName){this.hiddenName=C.name}if(!this.store){this.mode="local";var G=[],D=C.options;for(var B=0,A=D.length;B<A;B++){var F=D[B];var E=(Ext.isIE?F.getAttributeNode("value").specified:F.hasAttribute("value"))?F.value:F.text;if(F.selected){this.value=E}G.push([E,F.text])}this.store=new Ext.data.SimpleStore({"id":0,fields:["value","text"],data:G});this.valueField="value";this.displayField="text"}C.name=Ext.id();if(!this.lazyRender){this.target=true;this.el=Ext.DomHelper.insertBefore(C,this.autoCreate||this.defaultAutoCreate);Ext.removeNode(C);this.render(this.el.parentNode)}else{Ext.removeNode(C)}}else{if(Ext.isArray(this.store)){if(Ext.isArray(this.store[0])){this.store=new Ext.data.SimpleStore({fields:["value","text"],data:this.store});this.valueField="value"}else{this.store=new Ext.data.SimpleStore({fields:["text"],data:this.store,expandData:true});this.valueField="text"}this.displayField="text";this.mode="local"}}this.selectedIndex=-1;if(this.mode=="local"){if(this.initialConfig.queryDelay===undefined){this.queryDelay=10}if(this.initialConfig.minChars===undefined){this.minChars=0}}},onRender:function(B,A){Ext.form.ComboBox.superclass.onRender.call(this,B,A);if(this.hiddenName){this.hiddenField=this.el.insertSibling({tag:"input",type:"hidden",name:this.hiddenName,id:(this.hiddenId||this.hiddenName)},"before",true);this.el.dom.removeAttribute("name")}if(Ext.isGecko){this.el.dom.setAttribute("autocomplete","off")}if(!this.lazyInit){this.initList()}else{this.on("focus",this.initList,this,{single:true})}if(!this.editable){this.editable=true;this.setEditable(false)}},initValue:function(){Ext.form.ComboBox.superclass.initValue.call(this);if(this.hiddenField){this.hiddenField.value=this.hiddenValue!==undefined?this.hiddenValue:this.value!==undefined?this.value:""}},initList:function(){if(!this.list){var A="x-combo-list";this.list=new Ext.Layer({shadow:this.shadow,cls:[A,this.listClass].join(" "),constrain:false});var B=this.listWidth||Math.max(this.wrap.getWidth(),this.minListWidth);this.list.setWidth(B);this.list.swallowEvent("mousewheel");this.assetHeight=0;if(this.title){this.header=this.list.createChild({cls:A+"-hd",html:this.title});this.assetHeight+=this.header.getHeight()}this.innerList=this.list.createChild({cls:A+"-inner"});this.innerList.on("mouseover",this.onViewOver,this);this.innerList.on("mousemove",this.onViewMove,this);this.innerList.setWidth(B-this.list.getFrameWidth("lr"));if(this.pageSize){this.footer=this.list.createChild({cls:A+"-ft"});this.pageTb=new Ext.PagingToolbar({store:this.store,pageSize:this.pageSize,renderTo:this.footer});this.assetHeight+=this.footer.getHeight()}if(!this.tpl){this.tpl="<tpl for=\".\"><div class=\""+A+"-item\">{"+this.displayField+"}</div></tpl>"}this.view=new Ext.DataView({applyTo:this.innerList,tpl:this.tpl,singleSelect:true,selectedClass:this.selectedClass,itemSelector:this.itemSelector||"."+A+"-item"});this.view.on("click",this.onViewClick,this);this.bindStore(this.store,true);if(this.resizable){this.resizer=new Ext.Resizable(this.list,{pinned:true,handles:"se"});this.resizer.on("resize",function(E,C,D){this.maxHeight=D-this.handleHeight-this.list.getFrameWidth("tb")-this.assetHeight;this.listWidth=C;this.innerList.setWidth(C-this.list.getFrameWidth("lr"));this.restrictHeight()},this);this[this.pageSize?"footer":"innerList"].setStyle("margin-bottom",this.handleHeight+"px")}}},bindStore:function(A,B){if(this.store&&!B){this.store.un("beforeload",this.onBeforeLoad,this);this.store.un("load",this.onLoad,this);this.store.un("loadexception",this.collapse,this);if(!A){this.store=null;if(this.view){this.view.setStore(null)}}}if(A){this.store=Ext.StoreMgr.lookup(A);this.store.on("beforeload",this.onBeforeLoad,this);this.store.on("load",this.onLoad,this);this.store.on("loadexception",this.collapse,this);if(this.view){this.view.setStore(A)}}},initEvents:function(){Ext.form.ComboBox.superclass.initEvents.call(this);this.keyNav=new Ext.KeyNav(this.el,{"up":function(A){this.inKeyMode=true;this.selectPrev()},"down":function(A){if(!this.isExpanded()){this.onTriggerClick()}else{this.inKeyMode=true;this.selectNext()}},"enter":function(A){this.onViewClick();this.delayedCheck=true;this.unsetDelayCheck.defer(10,this)},"esc":function(A){this.collapse()},"tab":function(A){this.onViewClick(false);return true},scope:this,doRelay:function(C,B,A){if(A=="down"||this.scope.isExpanded()){return Ext.KeyNav.prototype.doRelay.apply(this,arguments)}return true},forceKeyDown:true});this.queryDelay=Math.max(this.queryDelay||10,this.mode=="local"?10:250);this.dqTask=new Ext.util.DelayedTask(this.initQuery,this);if(this.typeAhead){this.taTask=new Ext.util.DelayedTask(this.onTypeAhead,this)}if(this.editable!==false){this.el.on("keyup",this.onKeyUp,this)}if(this.forceSelection){this.on("blur",this.doForce,this)}},onDestroy:function(){if(this.view){this.view.el.removeAllListeners();this.view.el.remove();this.view.purgeListeners()}if(this.list){this.list.destroy()}this.bindStore(null);Ext.form.ComboBox.superclass.onDestroy.call(this)},unsetDelayCheck:function(){delete this.delayedCheck},fireKey:function(A){if(A.isNavKeyPress()&&!this.isExpanded()&&!this.delayedCheck){this.fireEvent("specialkey",this,A)}},onResize:function(A,B){Ext.form.ComboBox.superclass.onResize.apply(this,arguments);if(this.list&&this.listWidth===undefined){var C=Math.max(A,this.minListWidth);this.list.setWidth(C);this.innerList.setWidth(C-this.list.getFrameWidth("lr"))}},onEnable:function(){Ext.form.ComboBox.superclass.onEnable.apply(this,arguments);if(this.hiddenField){this.hiddenField.disabled=false}},onDisable:function(){Ext.form.ComboBox.superclass.onDisable.apply(this,arguments);if(this.hiddenField){this.hiddenField.disabled=true}},setEditable:function(A){if(A==this.editable){return }this.editable=A;if(!A){this.el.dom.setAttribute("readOnly",true);this.el.on("mousedown",this.onTriggerClick,this);this.el.addClass("x-combo-noedit")}else{this.el.dom.setAttribute("readOnly",false);this.el.un("mousedown",this.onTriggerClick,this);this.el.removeClass("x-combo-noedit")}},onBeforeLoad:function(){if(!this.hasFocus){return }this.innerList.update(this.loadingText?"<div class=\"loading-indicator\">"+this.loadingText+"</div>":"");this.restrictHeight();this.selectedIndex=-1},onLoad:function(){if(!this.hasFocus){return }if(this.store.getCount()>0){this.expand();this.restrictHeight();if(this.lastQuery==this.allQuery){if(this.editable){this.el.dom.select()}if(!this.selectByValue(this.value,true)){this.select(0,true)}}else{this.selectNext();if(this.typeAhead&&this.lastKey!=Ext.EventObject.BACKSPACE&&this.lastKey!=Ext.EventObject.DELETE){this.taTask.delay(this.typeAheadDelay)}}}else{this.onEmptyResults()}},onTypeAhead:function(){if(this.store.getCount()>0){var B=this.store.getAt(0);var C=B.data[this.displayField];var A=C.length;var D=this.getRawValue().length;if(D!=A){this.setRawValue(C);this.selectText(D,C.length)}}},onSelect:function(A,B){if(this.fireEvent("beforeselect",this,A,B)!==false){this.setValue(A.data[this.valueField||this.displayField]);this.collapse();this.fireEvent("select",this,A,B)}},getValue:function(){if(this.valueField){return typeof this.value!="undefined"?this.value:""}else{return Ext.form.ComboBox.superclass.getValue.call(this)}},clearValue:function(){if(this.hiddenField){this.hiddenField.value=""}this.setRawValue("");this.lastSelectionText="";this.applyEmptyText();this.value=""},setValue:function(A){var C=A;if(this.valueField){var B=this.findRecord(this.valueField,A);if(B){C=B.data[this.displayField]}else{if(this.valueNotFoundText!==undefined){C=this.valueNotFoundText}}}this.lastSelectionText=C;if(this.hiddenField){this.hiddenField.value=A}Ext.form.ComboBox.superclass.setValue.call(this,C);this.value=A},findRecord:function(C,B){var A;if(this.store.getCount()>0){this.store.each(function(D){if(D.data[C]==B){A=D;return false}})}return A},onViewMove:function(B,A){this.inKeyMode=false},onViewOver:function(D,B){if(this.inKeyMode){return }var C=this.view.findItemFromChild(B);if(C){var A=this.view.indexOf(C);this.select(A,false)}},onViewClick:function(B){var A=this.view.getSelectedIndexes()[0];var C=this.store.getAt(A);if(C){this.onSelect(C,A)}if(B!==false){this.el.focus()}},restrictHeight:function(){this.innerList.dom.style.height="";var B=this.innerList.dom;var E=this.list.getFrameWidth("tb")+(this.resizable?this.handleHeight:0)+this.assetHeight;var C=Math.max(B.clientHeight,B.offsetHeight,B.scrollHeight);var A=this.getPosition()[1]-Ext.getBody().getScroll().top;var F=Ext.lib.Dom.getViewHeight()-A-this.getSize().height;var D=Math.max(A,F,this.minHeight||0)-this.list.shadowOffset-E-5;C=Math.min(C,D,this.maxHeight);this.innerList.setHeight(C);this.list.beginUpdate();this.list.setHeight(C+E);this.list.alignTo(this.wrap,this.listAlign);this.list.endUpdate()},onEmptyResults:function(){this.collapse()},isExpanded:function(){return this.list&&this.list.isVisible()},selectByValue:function(A,C){if(A!==undefined&&A!==null){var B=this.findRecord(this.valueField||this.displayField,A);if(B){this.select(this.store.indexOf(B),C);return true}}return false},select:function(A,C){this.selectedIndex=A;this.view.select(A);if(C!==false){var B=this.view.getNode(A);if(B){this.innerList.scrollChildIntoView(B,false)}}},selectNext:function(){var A=this.store.getCount();if(A>0){if(this.selectedIndex==-1){this.select(0)}else{if(this.selectedIndex<A-1){this.select(this.selectedIndex+1)}}}},selectPrev:function(){var A=this.store.getCount();if(A>0){if(this.selectedIndex==-1){this.select(0)}else{if(this.selectedIndex!=0){this.select(this.selectedIndex-1)}}}},onKeyUp:function(A){if(this.editable!==false&&!A.isSpecialKey()){this.lastKey=A.getKey();this.dqTask.delay(this.queryDelay)}},validateBlur:function(){return !this.list||!this.list.isVisible()},initQuery:function(){this.doQuery(this.getRawValue())},doForce:function(){if(this.el.dom.value.length>0){this.el.dom.value=this.lastSelectionText===undefined?"":this.lastSelectionText;this.applyEmptyText()}},doQuery:function(C,B){if(C===undefined||C===null){C=""}var A={query:C,forceAll:B,combo:this,cancel:false};if(this.fireEvent("beforequery",A)===false||A.cancel){return false}C=A.query;B=A.forceAll;if(B===true||(C.length>=this.minChars)){if(this.lastQuery!==C){this.lastQuery=C;if(this.mode=="local"){this.selectedIndex=-1;if(B){this.store.clearFilter()}else{this.store.filter(this.displayField,C)}this.onLoad()}else{this.store.baseParams[this.queryParam]=C;this.store.load({params:this.getParams(C)});this.expand()}}else{this.selectedIndex=-1;this.onLoad()}}},getParams:function(A){var B={};if(this.pageSize){B.start=0;B.limit=this.pageSize}return B},collapse:function(){if(!this.isExpanded()){return }this.list.hide();Ext.getDoc().un("mousewheel",this.collapseIf,this);Ext.getDoc().un("mousedown",this.collapseIf,this);this.fireEvent("collapse",this)},collapseIf:function(A){if(!A.within(this.wrap)&&!A.within(this.list)){this.collapse()}},expand:function(){if(this.isExpanded()||!this.hasFocus){return }this.list.alignTo(this.wrap,this.listAlign);this.list.show();this.innerList.setOverflow("auto");Ext.getDoc().on("mousewheel",this.collapseIf,this);Ext.getDoc().on("mousedown",this.collapseIf,this);this.fireEvent("expand",this)},onTriggerClick:function(){if(this.disabled){return }if(this.isExpanded()){this.collapse();this.el.focus()}else{this.onFocus({});if(this.triggerAction=="all"){this.doQuery(this.allQuery,true)}else{this.doQuery(this.getRawValue())}this.el.focus()}}});Ext.reg("combo",Ext.form.ComboBox);