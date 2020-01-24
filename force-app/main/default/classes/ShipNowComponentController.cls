public with sharing class ShipNowComponentController {
 @AuraEnabled
    public static Map<String,String>listMethod() 
    {
        Map<String,String> Fedex = new Map<String,String>();
        fedex.put( 'FedEx 1 Day Delivery' ,'$100');
        fedex.put('FedEx 1-5 Day Delivery' ,'$60');
        fedex.put('FedEx Express Delivery' ,'$80');
        return fedex;
                
        }
     @AuraEnabled
    public static Map<String,String>listMethod1() 
    {
        Map<String,String> UPS = new Map<String,String>();
        UPS.put( '2 Day Delivery' ,'$200');
        UPS.put('1-5 Day Delivery' ,'$110');
        UPS.put('UPS Fast Delivery' ,'$100');
        return UPS;
                
        }
    @AuraEnabled
    public static Map<String,String>listMethod2() 
    {
        Map<String,String> DHL = new Map<String,String>();
        DHL.put( '2 Business Day' ,'$220');
        DHL.put('6 Business Day' ,'$100');
        DHL.put('DHL Express Delivery' ,'$90');
        return DHL;
                
        }    
    @AuraEnabled
    public static Account getAccountAddress(Id recordId) {
        Map<String,String> accMap = new Map<String,String>();
        
        return [select Name, Id, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, Phone from Account where id =: recordID];
    }
    
    @AuraEnabled
    public static String getCustomSettingValue(String placeName){
        List<nrg__Source_Address_Labels__c> dList = [select name,nrg__Source_Address__c from nrg__Source_Address_Labels__c];
        Map<String,String> addressMap = new Map<String,String>();
        for(nrg__Source_Address_Labels__c abc: dList){
            system.debug(abc);
            addressMap.put(abc.name, abc.nrg__Source_Address__c);
        }
        String address = addressMap.get(placeName);
        return address;
    }
    
    @AuraEnabled
    public static List<String> getCustomSettingNames(){
        List<nrg__Source_Address_Labels__c> dList = [select name,nrg__Source_Address__c from nrg__Source_Address_Labels__c];
        List<String> nameList = new List<String>();
        Set<string> places = new Set<string>();
        Map<String,String> addressMap = new Map<String,String>();
        for(nrg__Source_Address_Labels__c abc: dList){
            system.debug(abc);
            addressMap.put(abc.name, abc.nrg__Source_Address__c);
        }
        places = addressMap.keySet();
        nameList.addAll(places);
        system.debug(nameList);
        return nameList;
    }
    
    @AuraEnabled
    public static List<String> getDefaultCustomSettingName(){
        List<Default_Source_Address_Label__c> dList = [select name, DefaultSourceAddress__c from Default_Source_Address_Label__c];
        List<String> nameList = new List<String>();
        Set<string> places = new Set<string>();
        Map<String,String> addressMap = new Map<String,String>();
        for(Default_Source_Address_Label__c abc: dList){
            system.debug(abc);
            addressMap.put(abc.name, abc.DefaultSourceAddress__c);
        }
        places = addressMap.keySet();
        nameList.addAll(places);
        return nameList;
    }
    
    @AuraEnabled
    public static String getDefaultAddressValue(){
        List<Default_Source_Address_Label__c> dList = [select name,DefaultSourceAddress__c from Default_Source_Address_Label__c where name like '%Koramangala%'];
        Map<String,String> addressMap = new Map<String,String>();
        for(Default_Source_Address_Label__c abc: dList){
            system.debug(abc);
            addressMap.put(abc.name, abc.DefaultSourceAddress__c);
        }
        String defaultValue = addressMap.get('Koramangala');
        return defaultValue;
    }
    
     @AuraEnabled
 public static List <account> fetchAccount(String searchKeyWord) {
  String searchKey = searchKeyWord + '%';
  List <Account> returnList = new List <Account>();
  List <Account> lstOfAccount = [select id, Name from account where Name LIKE: searchKey];
 
  for (Account acc: lstOfAccount) {
     returnList.add(acc);
     }
  return returnList;
 }
    
     @AuraEnabled
 public static List <contact> fetchContact(String searchKeyWordContact) {
  String searchKey = searchKeyWordContact + '%';
  List < Contact > returnList = new List < Contact > ();
  List < Contact > lstOfContact = [select id, Name from contact where Name LIKE: searchKey];
 
  for (Contact con: lstOfContact) {
     returnList.add(con);
     
  }
  return returnList;
 }
  
}