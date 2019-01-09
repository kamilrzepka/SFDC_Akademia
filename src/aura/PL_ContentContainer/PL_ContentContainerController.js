({
	handleName: function(component,event,helper){
		const componentName = event.getParam("name");
		helper.initComponent(component,componentName);
  	},
    
	doInit: function(component,event,helper){
        const defComp = component.get("v.defaultInit");
        helper.initComponent(component,defComp);
    }
})