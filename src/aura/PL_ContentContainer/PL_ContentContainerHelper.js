({
    initComponent: function(component,componentName){
         const componentMap = new Map([
                        ["employees", "c:EmployeesCmp"],
                        ["items", "c:EmployeesCmp"],
             			["sets", "c:EmployeesCmp"]
                    ]);
         const cmpName = componentMap.get(componentName);

        $A.createComponent(
			cmpName, {}, newComponent => {
				if (component.isValid()) {
					component.set("v.cmpBody", newComponent);
                    newComponent.afterInit(componentName);
				}
            }
        );
    },
})