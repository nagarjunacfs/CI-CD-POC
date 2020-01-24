public class LOBTriggerHelper {
    public static void insertAccTeamMember(nrg__LOB__c lobRecord){
        AccountTeamMember accTeamMemb = new AccountTeamMember();
        accTeamMemb.AccountId = lobRecord.nrg__Account__c;
        accTeamMemb.UserId = lobRecord.nrg__Sales_Rep__c;
        accTeamMemb.AccountAccessLevel = 'edit';
        accTeamMemb.CaseAccessLevel = 'edit';
        accTeamMemb.OpportunityAccessLevel = 'edit';
        accTeamMemb.TeamMemberRole = 'Sales Rep';
        insert accTeamMemb;
    }
    public static void updateAccTeamMember(nrg__LOB__c lobRecord, nrg__LOB__c lobRecordRecent){
        List<AccountTeamMember> accTeamMembList = new List<AccountTeamMember>();
        List<AccountTeamMember> accTeamMemb = [select id, userId from AccountTeamMember where UserId =:lobRecord.nrg__Sales_Rep__c and AccountId=:lobRecord.nrg__Account__c];
        List<nrg__LOB__c> lobRecordList = [select id, nrg__Account__c, nrg__Sales_Rep__c from nrg__LOB__c where nrg__Sales_Rep__c =: lobRecord.nrg__Sales_Rep__c and nrg__Account__c =: lobRecord.nrg__Account__c];
        if(lobRecordList.size() > 0){

            if(lobRecordList.size() == 1 && (lobRecord.nrg__Account__c == lobRecordRecent.nrg__Account__c) && (lobRecord.nrg__Sales_Rep__c != lobRecordRecent.nrg__Sales_Rep__c) && (lobRecordRecent.nrg__Sales_Rep__c != null )){
                
                delete accTeamMemb;
                AccountTeamMember accTeamupdate = new AccountTeamMember();
                accTeamupdate.AccountId = lobRecord.nrg__Account__c;
                accTeamupdate.UserId = lobRecordRecent.nrg__Sales_Rep__c;
                accTeamupdate.AccountAccessLevel = 'edit';
                accTeamupdate.CaseAccessLevel = 'edit';
                accTeamupdate.OpportunityAccessLevel = 'edit';
                accTeamupdate.TeamMemberRole = 'Sales Rep';
                accTeamMembList.add(accTeamupdate);
            }
            else if(lobRecordList.size() > 1 && (lobRecord.nrg__Account__c == lobRecordRecent.nrg__Account__c) && (lobRecord.nrg__Sales_Rep__c != lobRecordRecent.nrg__Sales_Rep__c) && (lobRecordRecent.nrg__Sales_Rep__c != null )){
                AccountTeamMember accTeamInsertRecentVal = new AccountTeamMember();
                accTeamInsertRecentVal.AccountId = lobRecord.nrg__Account__c;
                accTeamInsertRecentVal.UserId = lobRecordRecent.nrg__Sales_Rep__c;
                accTeamInsertRecentVal.AccountAccessLevel = 'edit';
                accTeamInsertRecentVal.CaseAccessLevel = 'edit';
                accTeamInsertRecentVal.OpportunityAccessLevel = 'edit';
                accTeamInsertRecentVal.TeamMemberRole = 'Sales Rep';
                accTeamMembList.add(accTeamInsertRecentVal);

                
                AccountTeamMember accTeamInsertOldVal = new AccountTeamMember();
                accTeamInsertOldVal.AccountId = lobRecord.nrg__Account__c;
                accTeamInsertOldVal.UserId = lobRecord.nrg__Sales_Rep__c;
                accTeamInsertOldVal.AccountAccessLevel = 'edit';
                accTeamInsertOldVal.CaseAccessLevel = 'edit';
                accTeamInsertOldVal.OpportunityAccessLevel = 'edit';
                accTeamInsertOldVal.TeamMemberRole = 'Sales Rep';
                accTeamMembList.add(accTeamInsertOldVal);
            }
            else if(lobRecordList.size() > 1 && (lobRecord.nrg__Account__c == lobRecordRecent.nrg__Account__c) && (lobRecord.nrg__Sales_Rep__c != lobRecordRecent.nrg__Sales_Rep__c) && (lobRecordRecent.nrg__Sales_Rep__c == null )){
                
            }
            else if(lobRecordList.size() == 1 && (lobRecord.nrg__Account__c != lobRecordRecent.nrg__Account__c) ){

                delete accTeamMemb;
                AccountTeamMember accTeamupdate = new AccountTeamMember();
                accTeamupdate.AccountId = lobRecordRecent.nrg__Account__c;
                accTeamupdate.UserId = lobRecordRecent.nrg__Sales_Rep__c;
                accTeamupdate.AccountAccessLevel = 'edit';
                accTeamupdate.CaseAccessLevel = 'edit';
                accTeamupdate.OpportunityAccessLevel = 'edit';
                accTeamupdate.TeamMemberRole = 'Sales Rep';
                accTeamMembList.add(accTeamupdate);
            }
            else if(lobRecordList.size() > 1 && (lobRecord.nrg__Account__c != lobRecordRecent.nrg__Account__c)){

                AccountTeamMember accTeamInsertRecentVal = new AccountTeamMember();
                accTeamInsertRecentVal.AccountId = lobRecordRecent.nrg__Account__c;
                accTeamInsertRecentVal.UserId = lobRecordRecent.nrg__Sales_Rep__c;
                accTeamInsertRecentVal.AccountAccessLevel = 'edit';
                accTeamInsertRecentVal.CaseAccessLevel = 'edit';
                accTeamInsertRecentVal.OpportunityAccessLevel = 'edit';
                accTeamInsertRecentVal.TeamMemberRole = 'Sales Rep';
                accTeamMembList.add(accTeamInsertRecentVal);
            }
            
            else if(lobRecordList.size() == 1 && (lobRecordRecent.nrg__Sales_Rep__c == null)){
               system.debug('testst');
                delete accTeamMemb;
            }
            else if(lobRecordRecent.nrg__Sales_Rep__c != null && lobRecord.nrg__Sales_Rep__c == null){
                AccountTeamMember accTeamInsertRecentVal = new AccountTeamMember();
                accTeamInsertRecentVal.AccountId = lobRecordRecent.nrg__Account__c;
                accTeamInsertRecentVal.UserId = lobRecordRecent.nrg__Sales_Rep__c;
                accTeamInsertRecentVal.AccountAccessLevel = 'edit';
                accTeamInsertRecentVal.CaseAccessLevel = 'edit';
                accTeamInsertRecentVal.OpportunityAccessLevel = 'edit';
                accTeamInsertRecentVal.TeamMemberRole = 'Sales Rep';
                accTeamMembList.add(accTeamInsertRecentVal);
            }
        }
        if(accTeamMembList.size() >0){
             insert accTeamMembList;
        }
    }
}