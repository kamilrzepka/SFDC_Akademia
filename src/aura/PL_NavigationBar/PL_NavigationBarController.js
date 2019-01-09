({
	init: function (component,event,helper) {
        component.set("v.selectedItem", "employees");
        component.set("v.currentContent", "employees");
        helper.selectedMenu(component);
    },
  	handleSelect: function(component, event, helper) {
          helper.selectedMenu(component);
    }
})