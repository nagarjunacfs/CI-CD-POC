({
	defaultAddressLabel : function(component, event, helper) {
        var defaultValue = component.get("c.getDefaultCustomSettingName");
                defaultValue.setCallback(this, function(a) {
                    var res = a.getReturnValue();
                    component.set("v.defaultAddressVal",res);
                });
                $A.enqueueAction(defaultValue);
                   // end
    },
    
    defaultAddressValue : function(component, event, helper){
        var defaultAddress = component.get("c.getDefaultAddressValue");
                defaultAddress.setCallback(this, function(a) {
                    var res = a.getReturnValue();
                    component.set("v.DefaultAddressValue",res);
                });
                $A.enqueueAction(defaultAddress);
                   // end
    },
   
    searchHelper : function(component,event,getInputkeyWord) {
        // call the apex class method 
        var action = component.get("c.fetchAccount");
        // set param to method  
       	action.setParams({
            'searchKeyWord': getInputkeyWord
        });
        // set a callBack    
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                 // if storeResponse size is equal 0 ,display No Result Found... message on screen.
                if (storeResponse.length == 0) {
                    component.set("v.Message", 'No Result Found...');
                } else {
                    component.set("v.Message", 'Search Result...');
                }
                
                // set searchResult list with return value from server.
                component.set("v.listOfSearchRecords", storeResponse);
            }
            
        });
        // enqueue the Action  
        $A.enqueueAction(action);
        
    },
 
});