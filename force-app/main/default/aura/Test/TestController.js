({
    doInit : function(component, event, helper) {
       // alert('loadeed ::: ');
        component.find('recordHandler').reloadRecord();
        var recName = component.get("v.record.Name");
        alert("recName "+ recName);
    },
	handleRecordUpdated : function(component, event, helper) {
    var eventParams = event.getParams();
       if(eventParams.changeType === "LOADED") {
            var rec = component.get("v.simpleRecord");
           console.log('rec _-->'+JSON.stringify(rec));
        }		
	}
})