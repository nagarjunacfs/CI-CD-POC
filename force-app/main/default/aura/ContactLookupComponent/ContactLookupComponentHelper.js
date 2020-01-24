({
	searchHelperContact : function(component,event,getInputkeyWord) {
	  // call the apex class method 
     var action = component.get("c.fetchContact");
      // set param to method  
        action.setParams({
            'searchKeyWordContact': getInputkeyWord
          });
      // set a callBack    
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
              
              // if storeResponse size is equal 0 ,display No Result Found... message on screen.
                if (storeResponse.length == 0) {
                    component.set("v.MessageContact", 'No Result Found...');
                } else {
                    component.set("v.MessageContact", 'Search Result...');
                }
                
                // set searchResult list with return value from server.
                component.set("v.listOfSearchRecordsContact", storeResponse);
            }
 
        });
      // enqueue the Action  
        $A.enqueueAction(action);
    
	},
})