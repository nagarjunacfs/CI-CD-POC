({
    NavigatetoC2 : function(component, event, helper) {
        
      console.log('Enter Here');
        component.set('v.whole',false);
        component.set('v.shipnowpage',false);
        component.set('v.packagepage',true);
        var shippstreet = component.find("shipstreet").get("v.value");
      alert('shipStreet ' + shippstreet);
        var shippcity = component.find("shipcity").get("v.value");
        var shippstate = component.find("shipstate").get("v.value");
        var shippzipcode = component.find("shipzipcode").get("v.value");
        var shippcountry = component.find("shipcountry").get("v.value");
        var phone = component.find("phonenumber").get("v.value");
        var address =[shipstreet,shipcity,shipstate,shipzipcode,shipcountry,phone];
        alert('address' + address);
      
        
    },

  clickDropDown : function(component, event, helper) {
      //var accountName = component.find("accountRecord").get("v.value");
      //alert('accountName '+ accountName);
       var getAttributeValue = component.get("v.dropdown");
      console.log(getAttributeValue);
      component.set("v.dropdown", "false");
      if (getAttributeValue == "true" ||getAttributeValue == "false" || getAttributeValue == false) {
          component.set("v.dropdown", "true");
          };
    	var shippstreet = component.get("v.shippingDetailsRecord.ShippingStreet");
      	component.set("v.shipStreet", shippstreet);
      	var shippstate = component.get("v.shippingDetailsRecord.ShippingState");
        component.set("v.shipState", shippstate);
      	var shippcity = component.get("v.shippingDetailsRecord.ShippingCity");
        component.set("v.shipCity", shippcity);
      	var shippzipcode = component.get("v.shippingDetailsRecord.ShippingPostalCode");
        component.set("v.shipZipcode", shippzipcode);
      	var shippcountry = component.get("v.shippingDetailsRecord.ShippingCountry");
        component.set("v.shipCountry", shippcountry);
      	var phone = component.get("v.shippingDetailsRecord.Phone_Number__c");
        component.set("v.phoneNum", phone);
      
       
      },
  
    myAction : function(component, event, helper) {
         //get state when country populated- start
               helper.defaultAddressLabel(component, event, helper);
              helper.defaultAddressValue(component, event, helper);
              //var optionValue = component.get("c.getCustomSettingValues");
              var optionValue = component.get("c.getCustomSettingNames");
 
              optionValue.setCallback(this, function(a) {
                  var res = a.getReturnValue();
                    var labels = [];
                  res.forEach(function(element) {
                  labels.push({ value: element, label: element });
              });
                  
                  component.set("v.nameLabels",labels);
                 
              });
              $A.enqueueAction(optionValue);
                 // end
  },
   
  onClickDropdown: function (component, event, helper) {
      
       var selectedValue = component.find("sourceAddress").get("v.value");
     
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
  } ,
  
  doInit : function(component, event, helper) {
      var action = component.get("c.listMethod");//getting data form Apex class
      action.setCallback(this,function(response){
          var state = response.getState();
          console.log(state);
          if (state === "SUCCESS") {
              //Create an empty array to store the map keys 
              var arrayMapKeys = [];
              //Store the response of apex controller (return map)     
              var result = response.getReturnValue();
              //Set the store response[map] to component attribute, which name is map and type is map.   
              component.set('v.companyMap', result);
              //alert(JSON.stringify(response.getReturnValue()));
              //  component.set('v.myMap',response.getReturnValue());
              for (var key in result) {
                  arrayMapKeys.push(key);
              }
              //Set the list of keys.     
              component.set('v.keyList', arrayMapKeys);
          }
      });        
      $A.enqueueAction(action);
      var action1 = component.get("c.listMethod1");//getting data form Apex class
      action1.setCallback(this,function(response1){
          var state1 = response1.getState();
          console.log(state1);
          if (state1 === "SUCCESS") {
              //Create an empty array to store the map keys 
              var arrayMapKeys1 = [];
              //Store the response of apex controller (return map)     
              var result1 = response1.getReturnValue();
              //Set the store response[map] to component attribute, which name is map and type is map.   
              component.set('v.companyMap1', result1);
              //alert(JSON.stringify(response1.getReturnValue()));
              //  component.set('v.myMap',response.getReturnValue());
              for (var key1 in result1) {
                  arrayMapKeys1.push(key1);
              }
              //Set the list of keys.     
              component.set('v.keyList1', arrayMapKeys1);
          }
      });  
      $A.enqueueAction(action1);
      var action2 = component.get("c.listMethod2");//getting data form Apex class
      action2.setCallback(this,function(response2){
          var state2 = response2.getState();
          console.log(state2);
          if (state2 === "SUCCESS") {
              //Create an empty array to store the map keys 
              var arrayMapKeys2 = [];
              //Store the response of apex controller (return map)     
              var result2 = response2.getReturnValue();
              //Set the store response[map] to component attribute, which name is map and type is map.   
              component.set('v.companyMap2', result2);
              //alert(JSON.stringify(response2.getReturnValue()));
              //  component.set('v.myMap',response.getReturnValue());
              for (var key2 in result2) {
                  arrayMapKeys2.push(key2);
              }
              //Set the list of keys.     
              component.set('v.keyList2', arrayMapKeys2);
              var getCurrentStep = component.get("v.currentStep");
              if(getCurrentStep == "2"){
                  component.set("v.currentStep", "3");
              }
          }
      });
      
      $A.enqueueAction(action2);
      
  }, 
  
  //  Starts of SAD :28
  addOrder : function (component ,event ,helper){
      var abc = component.get("v.companyMap");
    // if(abc){
        //  alert("You have to select one courier type"+abc);
     //}
      var rParamAcc = JSON.stringify(abc);
      //alert("rParamAcc=="+rParamAcc);
      component.set('v.isOpen',true);	
      
      
  },
  close : function (component ,event ,helper){
      component.set('v.isOpen',false);
  },
  Proceed : function (component ,event ,helper){
      /*var childComp = component.find('childComp');alert("checkvalue-"+childComp);
      childComp.callChild();
      component.set('v.isOpen',false);
      */
       
       var v= component.get('v.accountRecord');
       
       var shipp = component.get('v.currentshippingamount');
       
       var amountValue = shipp.substring(1);
       v.Shipping_Charges__c = 0;
       v.Shipping_Charges__c =v.Shipping_Charges__c+amountValue;
       
       component.set('v.accountRecord',v);
       
       component.find("accRec").saveRecord($A.getCallback(function(saveResult) {
           if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
               console.log("Save completed successfully.");
           } else if (saveResult.state === "INCOMPLETE") {
               console.log("User is offline, device doesn't support drafts.");
           } else if (saveResult.state === "ERROR") {
               console.log('Problem saving record, error: ' + 
                           JSON.stringify(saveResult.error));
           } else {
               console.log('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
           }
       }));
       component.set('v.isOpen',false);
       component.set('v.whole',false);
       var getCurrentStep = component.get("v.currentStep");
       if(getCurrentStep == "3"){
           component.set("v.currentStep", "4");
       }
       
       component.set('v.NextPage',true);
       
   }, 
  handleUpdateAmount: function(component, event, helper) {
      
      var updatedShip = event.getParam("shippingAmount");
      alert('The shipping charge you select is '+updatedShip);
      component.set('v.currentshippingamount',updatedShip);
      //  alert(':::::::'+'v.currentshippingamount');
  },
  
   doInitPackage: function (component, event, helper) {
      var options = [
          { value: "bag", label: "BAG" },
          { value: "barrel", label: "BARREL" },
          { value: "basket", label: "BASKET" },
          { value: "box", label: "BOX" },
          { value: "bucket", label: "BUCKET" },
          { value: "bundle", label: "BUNDLE" },
          { value: "carton", label: "CARTON" },
          { value: "case", label: "CASE" },
          { value: "container", label: "CONTAINER" },
          { value: "crate", label: "CRATE" },
          { value: "other", label: "OTHER" }
          
      ];
      component.set("v.options", options);
  },
  handleOptionSelected: function (cmp, event) {
      //Get the string of the "value" attribute on the selected option
      var selectedValue = event.getParam("value");
      
  },
  handleClick : function(component, event, helper) {
      console.log('Enter Here');
        component.set('v.packagepage',false);
      component.set('v.shipnowpage',false);
        component.set('v.whole',true);
      var shippstreet = component.find("shipstreet").get("v.value");
      alert('shipStreet ' + shippstreet);
        var shippcity = component.find("shipcity").get("v.value");
        var shippstate = component.find("shipstate").get("v.value");
        var shippzipcode = component.find("shipzipcode").get("v.value");
        var shippcountry = component.find("shipcountry").get("v.value");
        var phone = component.find("phonenumber").get("v.value");
        var address =[shipstreet,shipcity,shipstate,shipzipcode,shipcountry,phone];
        alert('address' + address);
      
  },
    
     keyPressController : function(component, event, helper) {
        // get the search Input keyword   
        var getInputkeyWord = component.get("v.SearchKeyWord");
        // check if getInputKeyWord size id more then 0 then open the lookup result List and 
        // call the helper 
        // else close the lookup result List part.   
        if( getInputkeyWord.length > 0 ){
            var forOpen = component.find("searchRes");
            $A.util.addClass(forOpen, 'slds-is-open');
            $A.util.removeClass(forOpen, 'slds-is-close');
            helper.searchHelper(component,event,getInputkeyWord);
        }
        else{  
            component.set("v.listOfSearchRecords", null ); 
            var forclose = component.find("searchRes");
            $A.util.addClass(forclose, 'slds-is-close');
            $A.util.removeClass(forclose, 'slds-is-open');
        }
        
    },
    
    // function for clear the Record Selaction 
    clear :function(component,event,heplper){
        
        var pillTarget = component.find("lookup-pill");
        var lookUpTarget = component.find("lookupField"); 
        
        $A.util.addClass(pillTarget, 'slds-hide');
        $A.util.removeClass(pillTarget, 'slds-show');
        
        $A.util.addClass(lookUpTarget, 'slds-show');
        $A.util.removeClass(lookUpTarget, 'slds-hide');
        
        component.set("v.SearchKeyWord",null);
        component.set("v.listOfSearchRecords", null );
    },
    
    // This function call when the end User Select any record from the result list.   
    handleComponentEvent : function(component, event, helper) {
        
        // get the selected Account record from the COMPONETN event 	 
        var selectedAccountGetFromEvent = event.getParam("accountByEvent");
        
        component.set("v.selectedRecord" , selectedAccountGetFromEvent); 
        
        var forclose = component.find("lookup-pill");
        $A.util.addClass(forclose, 'slds-show');
        $A.util.removeClass(forclose, 'slds-hide');
        
        
        var forclose = component.find("searchRes");
        $A.util.addClass(forclose, 'slds-is-close');
        $A.util.removeClass(forclose, 'slds-is-open');
        
        var lookUpTarget = component.find("lookupField");
        $A.util.addClass(lookUpTarget, 'slds-hide');
        $A.util.removeClass(lookUpTarget, 'slds-show');  
        
    },
    // automatically call when the component is done waiting for a response to a server request.  
   hideSpinner : function (component, event, helper) {
        var spinner = component.find("spinner");
        var evt = spinner.get("e.toggle");
        evt.setParams({ isVisible : false });
        evt.fire();    
    },
    // automatically call when the component is waiting for a response to a server request.
    showSpinner : function (component, event, helper) {
        var spinner = component.find("spinner");
        var evt = spinner.get("e.toggle");
        evt.setParams({ isVisible : true });
        evt.fire();    
    },
    
   
});