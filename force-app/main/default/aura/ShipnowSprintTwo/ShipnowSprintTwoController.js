({
	
	EditOrder : function(component, event, helper) {
		component.set('v.isOpen',true);
        
	},
     closed : function (component ,event ,helper){
        component.set('v.isOpen',false);
    },
  
     close : function (component ,event ,helper){
         var Title =component.get("v.Title");
         alert('title'+Title);
         var Street  = component.get("v.Street");
        alert('Street'+Street);
          var State = component.get("v.State");
        alert('State'+State);
         var ZipCode =component.get("v.ZipCode");
           alert('ZipCode'+ZipCode);
         var City =component.get("v.City");
          alert('City'+City);
          var Country  = component.get("v.Country");
        alert('Country'+Country);
          var Phone = component.get("v.Phone");
        alert('Phone'+Phone);
          var Company = component.get("v.Company");
        alert('Company'+Company);
        
        component.set('v.isOpen',false);
         var action =component.get("c.insertData");
         action.setParams({"title" : Title ,street:Street,state :State ,
                           Country:Country ,phoneno:Phone ,company:Company ,
                           city :City, zipcode :ZipCode});
         action.setCallback(this,function(response){
          var state =response.getState();
         if(state === "SUCCESS"){
             
         }else{
             alert('state'+state);
         }
             
             
     });
        $A.enqueueAction(action);
          var action1 = component.get("c.getData");
        action1.setCallback(this,function(response){
            var state =response.getState();
            if(state === "SUCCESS"){
                component.set("v.wrapperList",response.getReturnValue());
                
                 alert('recordlist');
                  component.set("v.isOpen",false);
                component.set("v.isOpenrecords",true);
            }
        });
         $A.enqueueAction(action1);
    },
    onEdit :function(component, event, helper) {
        component.set("v.isEdit", true);		
	}
})