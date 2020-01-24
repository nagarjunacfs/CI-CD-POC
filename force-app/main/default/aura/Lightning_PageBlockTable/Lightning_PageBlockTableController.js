({
    doInit: function(component, event, helper){
        
    },
	doOnLoad : function(component, event, helper) {
        helper.loadAccounts(component, event);
	},
    save : function(component, event, helper) {
        try {
		component.find("edit").get("e.recordSave").fire();
        }catch (e) {
    		console.log(e);
  			}
        location.reload();// This will refresh the app to get the latest updated data.        
    },
    edit : function(component, event, helper) {
        component.set("v.isView",false);
        component.set("v.isEdit",true);
        console.log('Edit record ID..'+event.target.id);
        component.set("v.editAccId",event.target.id);
        component.set("v.viewAccId",event.target.id);
        
        
    },
    
    view : function(component, event, helper) {
        component.set("v.isEdit",false);
        component.set("v.viewAccId",event.target.id);
        component.set("v.isView",true);
        
    },
    
    delete : function(component, event, helper) {        
        if(confirm('Are you sure?'))
    	helper.deleteAccount(component, event);        
    }
})