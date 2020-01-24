@isTest(seeAllData=true)
public class LOBTriggerHelperTest {
    
     
     public static testMethod void test1(){
        Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];
        
        user testUser = new user();
        testUser.LastName = 'LIVESTON';
        testUser.FirstName='JASON';
        testUser.Alias = 'jliv';
        testUser.Email = 'jason.liveston@asdf.com';
        testUser.Username = 'bhanuprakash123@gmail.com';
        testUser.ProfileId = profileId.id;
        testUser.TimeZoneSidKey = 'GMT';
        testUser.LanguageLocaleKey = 'en_US';
        testUser.EmailEncodingKey = 'UTF-8';
        testUser.LocaleSidKey = 'en_US';
        insert testUser;
        
        user testUsr = new user();
        testUsr.LastName = 'Pioneer';
        testUsr.FirstName='team';
        testUsr.Alias = 'pioneer';
        testUsr.Email = 'pioneer@asdf.com';
        testUsr.Username = 'pioneerteam@gmail.com';
        testUsr.ProfileId = profileId.id;
        testUsr.TimeZoneSidKey = 'GMT';
        testUsr.LanguageLocaleKey = 'en_US';
        testUsr.EmailEncodingKey = 'UTF-8';
        testUsr.LocaleSidKey = 'en_US';
        insert testUsr;
        
        Account acc = new Account();
        acc.Name = 'TestAcc';
        insert acc;
        
        Account newAcc = new Account();
        newAcc.Name = 'TestAccCreation';
        insert newAcc;
        
        nrg__LOB__c lob = new nrg__LOB__c();
        lob.Name = 'LobTest1';
        lob.nrg__Account__c = acc.Id;
        lob.nrg__Sales_Rep__c = testUsr.Id;
        insert lob;
        
        nrg__LOB__c lob1 = new nrg__LOB__c();
		lob1.Id = lob.Id;
        lob1.nrg__Sales_Rep__c = testUser.Id;
        update lob1;
        
        /*
  		map<String,nrg__LOB__c> lobmap = new map<String,nrg__LOB__c>();
        lobmap.put('oldValue',lob);
        
        lob = [select nrg__Sales_Rep__c,nrg__Account__c from nrg__LOB__c where id =: lob.id];
        lob.nrg__Sales_Rep__c = testUser.Id;
        update lob;
		lobmap.put('newValue',lob);
        
        system.debug('oldValue '+ lobmap.get('oldValue'));
         system.debug('newValue '+ lobmap.get('newValue'));
        */
         AccountTeamMember accTeamMemb = new AccountTeamMember();
        accTeamMemb.AccountId = lob.nrg__Account__c;
        accTeamMemb.UserId = testUser.Id;
        accTeamMemb.AccountAccessLevel = 'edit';
        accTeamMemb.CaseAccessLevel = 'edit';
        accTeamMemb.OpportunityAccessLevel = 'edit';
        accTeamMemb.TeamMemberRole = 'Sales Rep';
        insert accTeamMemb;
      
        LOBTriggerHelper.insertAccTeamMember(lob);
         LOBTriggerHelper.updateAccTeamMember(lob,lob1);
       //LOBTriggerHelper.updateAccTeamMember(lobmap.get('oldValue'),lobmap.get('newValue')); 
    }
    
    /*
     public static testMethod void test2(){
        Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];
        
        user testUser = new user();
        testUser.LastName = 'LIVESTON';
        testUser.FirstName='JASON';
        testUser.Alias = 'jliv';
        testUser.Email = 'jason.liveston@asdf.com';
        testUser.Username = 'bhanuprakash123@gmail.com';
        testUser.ProfileId = profileId.id;
        testUser.TimeZoneSidKey = 'GMT';
        testUser.LanguageLocaleKey = 'en_US';
        testUser.EmailEncodingKey = 'UTF-8';
        testUser.LocaleSidKey = 'en_US';
        insert testUser;
        
        user testUsr = new user();
        testUsr.LastName = 'Pioneer';
        testUsr.FirstName='team';
        testUsr.Alias = 'pioneer';
        testUsr.Email = 'pioneer@asdf.com';
        testUsr.Username = 'pioneerteam@gmail.com';
        testUsr.ProfileId = profileId.id;
        testUsr.TimeZoneSidKey = 'GMT';
        testUsr.LanguageLocaleKey = 'en_US';
        testUsr.EmailEncodingKey = 'UTF-8';
        testUsr.LocaleSidKey = 'en_US';
        insert testUsr;
        
        Account acc = new Account();
        acc.Name = 'TestAcc';
        insert acc;
        
        Account newAcc = new Account();
        newAcc.Name = 'TestAccCreation';
        insert newAcc;
        
        nrg__LOB__c lob = new nrg__LOB__c();
        lob.Name = 'LobTest1';
        lob.nrg__Account__c = acc.Id;
         lob.nrg__Sales_Rep__c = testUser.Id;
        insert lob;
        
        nrg__LOB__c lob1 = new nrg__LOB__c();
		lob1.Id = lob.Id;
        lob1.nrg__Account__c = newAcc.Id;
        update lob1;
        
        /*
  		map<String,nrg__LOB__c> lobmap = new map<String,nrg__LOB__c>();
        lobmap.put('oldValue',lob);
        
        lob = [select nrg__Sales_Rep__c,nrg__Account__c from nrg__LOB__c where id =: lob.id];
        lob.nrg__Account__c = newAcc.Id;
        update lob;
		lobmap.put('newValue',lob);
        */
    /*
         AccountTeamMember accTeamMemb = new AccountTeamMember();
        accTeamMemb.AccountId = lob.nrg__Account__c;
        accTeamMemb.UserId = testUser.Id;
        accTeamMemb.AccountAccessLevel = 'edit';
        accTeamMemb.CaseAccessLevel = 'edit';
        accTeamMemb.OpportunityAccessLevel = 'edit';
        accTeamMemb.TeamMemberRole = 'Sales Rep';
        insert accTeamMemb;
      
        LOBTriggerHelper.insertAccTeamMember(lob);
       LOBTriggerHelper.updateAccTeamMember(lob,lob1); 
    }
    */
    
}