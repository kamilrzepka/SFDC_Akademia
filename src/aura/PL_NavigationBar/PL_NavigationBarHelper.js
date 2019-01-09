({
	selectedMenu : function(component) {
            const selected = component.get("v.selectedItem");
            let cmpEvent = $A.get("e.c:PL_SelectedComponentNameEvent");
                    cmpEvent.setParams({"name": selected});
                    cmpEvent.fire();
	}
})