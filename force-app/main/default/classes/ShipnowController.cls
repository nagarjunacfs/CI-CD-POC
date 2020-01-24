public class ShipnowController {
	 
    @AuraEnabled
    public static List<nrg__Source_Address_Labels__c> getCustomSettingValues(){
        List<nrg__Source_Address_Labels__c> dList = new List<nrg__Source_Address_Labels__c>();
        
       
      dList = nrg__Source_Address_Labels__c.getAll().values();
        // dList = nrg__Source_Address_Labels__c.getAll().values();
      /*
        list<string> city = new list<string>();
        for(integer i=0;i<dList.size();i++){
            city.add(dList[i].name);
            system.debug('city'+city);
         }
		*/
         return dList;
    }
    @AuraEnabled
    public static Contact getContact() {
        return [select Name, MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry, Account.Name, Phone from Contact];
    }
    
     @AuraEnabled
    public static List<Account> getAccountAddress() {
        return [select Name, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, Phone from Account];
    }
}