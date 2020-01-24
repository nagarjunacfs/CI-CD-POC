trigger LOB_Trigger on nrg__LOB__c (before insert, before update, before delete) {
    if(Trigger.isInsert){
        for(nrg__LOB__c lobRecord : Trigger.new){
            if(lobRecord.nrg__Sales_Rep__c != null){
                LOBTriggerHelper.insertAccTeamMember(lobRecord);
            }
            
        }
    }
    if(Trigger.isUpdate){
        for(nrg__LOB__c lobRecord : Trigger.old){
            for(nrg__LOB__c lobRecordRecent : Trigger.new){
                if(lobRecord.nrg__Sales_Rep__c != lobRecordRecent.nrg__Sales_Rep__c || lobRecord.nrg__Account__c != lobRecordRecent.nrg__Account__c){
                   	system.debug('lobRecord'+lobRecord);
                    system.debug('lobRecordRecent'+lobRecordRecent);
                    LOBTriggerHelper.updateAccTeamMember(lobRecord, lobRecordRecent);
                }
            }
        } 
    }
   
    if(Trigger.isDelete){
        for(nrg__LOB__c lobRecord : Trigger.old){
            List<AccountTeamMember> accTeamMemb = [select id, userId from AccountTeamMember where UserId =:lobRecord.nrg__Sales_Rep__c and AccountId=:lobRecord.nrg__Account__c];
            List<nrg__LOB__c> lobRecordList = [select id, nrg__Account__c, nrg__Sales_Rep__c from nrg__LOB__c where nrg__Sales_Rep__c =: lobRecord.nrg__Sales_Rep__c and nrg__Account__c =: lobRecord.nrg__Account__c];
            if(lobRecordList.size() == 1){
                delete accTeamMemb;
            }
        }
        
    }
}