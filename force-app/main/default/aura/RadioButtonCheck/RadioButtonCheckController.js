({
    doInit : function(component, event, helper) {
        var key = component.get("v.key");
        var map = component.get("v.map");
        component.set("v.value",map[key]);
       
    },
   // Proceed:function(component, event, helper){
      //  var selectedRadioOption = document.getElementById("assignmentOptions").key;
      //  alert("selectedRadioOption===="+selectedRadioOption);
       handleSelectedContacts: function(component, event, helper) {
       // var selectedContacts = [];
        //var checkvalue = component.get("v.value");
          //alert("checkvalue-"+checkvalue);
           var value =document.querySelector('input[name ="radioButtonGroup"]:checked').value;
           //document.writeln("You entered " + value + " for your gender<br>");
           //alert('selectedradiobutton === '+value);
           
        var updateEvent = component.getEvent("updateShippingAmount");
           //alert('KKKKK::'+updateEvent);
        updateEvent.setParams({ "shippingAmount": value });
        updateEvent.fire();
           }
       
       
})