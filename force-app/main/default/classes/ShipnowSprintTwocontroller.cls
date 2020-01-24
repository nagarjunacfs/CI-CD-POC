public class ShipnowSprintTwocontroller {

     
    @AuraEnabled
    public static void insertData(string title,string street,string city,string state,string zipcode,string Country,string phoneno,string company,string contactname){
       list<Shipping__c> shpng=new list<Shipping__c>();
      
        
        Shipping__c shp = new Shipping__c(Name=title,City__c=city,Country__c=Country,Phone__c=phoneno,State__c=state,Street__c=street,ZipCode__c=zipcode,Shipping_Charges__c =366,Courier__c ='FedEx');
        shpng.add(shp);
        insert shpng;
        
      
    }
     @AuraEnabled
    public static WrapperController getData(){
        WrapperController wrc = new WrapperController();
        wrc.ship=[select id,Name,City__c,Country__c,State__c,Street__c,ZipCode__c from Shipping__c];
        system.debug('wrapperclass'+wrc.ship);
        return wrc;
    }
    public class WrapperController{
        @AuraEnabled public list<Shipping__c> ship{get;set;}
        @AuraEnabled public boolean togglebox {get;set;}
    
    public WrapperController(){
        togglebox = false;
        ship=new list<Shipping__c>();
        }
    }

}