Ext.override(Ext.form.RadioGroup, {
  getName: function() {
    return this.items.first().getName();
  },

  getValue: function() {
    var v;

    this.items.each(function(item) {
      v = item.getRawValue();
      return !item.getValue();
    });

    return v;
  },

  setValue: function(v) {
    if(this.rendered)
		this.items.each(function(item) {
	      item.setValue(item.getRawValue() == v);
	    });
	else
		for(k in this.items) this.items[k].checked = this.items[k].inputValue == v;
  },
  
  afterRender: function() {
        var group = this;
        this.items.each(function(field) {
            // Listen for 'check' event on each child item
            field.on("check", function(self, checked) {
              // if checkbox is checked, then fire 'change' event on RadioGroup container
              if(checked)
                // Note, oldValue (third parameter in 'change' event listener) is not passed, 
                // because is not easy to get it
                group.fireEvent('change', group, self.getRawValue());
            });
        });
        Ext.form.RadioGroup.superclass.afterRender.call(this)
    }
}); 

Ext.override(Ext.tree.TreeNode,
{
    refresh: function(attributes)
    {
        // Update the node's properties
        this.expanded = attributes.expanded === true;
        this.isTarget = attributes.isTarget !== false;
        this.draggable = attributes.draggable !== false && attributes.allowDrag !== false;
        this.allowChildren = attributes.allowChildren !== false && attributes.allowDrop !== false;
        this.text = attributes.text || this.text;
        this.cls = attributes.cls || this.cls;
        this.icon = attributes.icon || this.icon;
        this.iconCls = attributes.iconCls || this.iconCls;
        // re-render the ui if it is rendered
        if (this.rendered)
        {
            this.rendered = false;
            this.ui.rendered = false;
            Ext.fly(this.ui.wrap).remove();
            this.render();
        }
    }
}); 


function msgBox(strMsg,icon){
    
    if (!icon) icon = "error";
    iconCls = Ext.MessageBox.ERROR;
         
    if(icon =="info") iconCls = Ext.MessageBox.INFO;
    if(icon =="question") iconCls = Ext.MessageBox.QUESTION;
    if(icon =="warning") iconCls = Ext.MessageBox.WARNING;
    if(icon =="error") iconCls = Ext.MessageBox.ERROR;
               
    Ext.MessageBox.show({
       msg: strMsg,
       buttons: Ext.MessageBox.OK ,
       icon:iconCls
   });
}