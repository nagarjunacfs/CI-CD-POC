/*

CR# : 02
Developer : Nagarjuna
Date : Jan 9th 2019
Description : Without creating attachment to the opportunity user should not change the status to "closed won" or "closed lost".

*/


public class OpportunityTriggerHelper {
    public static void createAttachment(List<Opportunity> opp){
        Set<id> oppIds = new Set<id>();
        for(Opportunity opp1 : opp) oppIds.add(opp1.Id);
        List<Opportunity> oppLst = [SELECT Id,(SELECT Id FROM Attachments) FROM Opportunity WHERE Id IN :oppIds];
        for(Opportunity opp2 : oppLst){
            if(opp2.Attachments.size() == 0){
                opp2.StageName.addError('Must attach a file before changing to ClosedLost');
            }
        }   
    }
}