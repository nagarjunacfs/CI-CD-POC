({
    contactAddress : function(component, event, helper) {
        var action = component.get("c.getContact");
        action.setCallback(this, function(data) {
                component.set("v.conAddress", data.getReturnValue());
                console.log(data.getReturnValue());
            
         });
         $A.enqueueAction(action); 
    },

	clickDropDown : function(component, event, helper) {
         var getAttributeValue = component.get("v.dropdown");
        console.log(getAttributeValue);
        component.set("v.dropdown", "false");
        if (getAttributeValue == "true" ||getAttributeValue == "false" || getAttributeValue == false) {
            component.set("v.dropdown", "true");
            };
           
        },
    
  	myAction : function(component, event, helper) {
           //get state when country populated- start
             
                //var optionValue = component.get("c.getCustomSettingValues");
        		var optionValue = component.get("c.getCustomSettingNames");
   
                optionValue.setCallback(this, function(a) {
                    var res = a.getReturnValue();
                    alert('response' + res);
                  	var labels = [];
                    labels.push(res);
                    component.set("v.optVal", labels);
                    //component.set("v.optVal",a.getReturnValue());
                    //helper.customSettingValues(component, event, helper);
                });
                $A.enqueueAction(optionValue);
                   // end
    },
     
    onClickDropdown: function (component, event, helper) {
         var selectedValue = component.find("SourceSelect").get("v.value");
        //alert('seleced Value ' + selectedValue);
       	 
        var action = component.get("c.getCustomSettingValue");
   		 action.setParams({  placeName : selectedValue  });
        //alert('address value ' + action);
            action.setCallback(this, function(res) {  
                //alert('result' + res.getReturnValue());
                 component.set("v.SourceAddressValue",res.getReturnValue());
                    //helper.customSettingValues(component, event, helper);
                });
                $A.enqueueAction(action);
        
    }
});