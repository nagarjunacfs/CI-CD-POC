/*

CR# : 02
Developer : Nagarjuna
Date : Jan 9th 2019
Description : Without creating attachment to the opportunity user should not change the status to "closed won" or "closed lost".

*/


trigger OpportunityTrigger on Opportunity (before update, before insert) {
    if(trigger.isUpdate || trigger.isInsert){
        for(Opportunity opp : trigger.new){
            if(opp.StageName == 'Closed Won' || opp.StageName == 'Closed Lost'){
                OpportunityTriggerHelper.createAttachment(trigger.new);
            }
        } 
    }
}
    /*
        if(trigger.isInsert)
        {
        for(Opportunity opp : trigger.new)
        {
        if(opp.StageName == 'Closed Lost' && opp.StageName == 'Closed Won' )
        {
        List<Opportunity> lstOpp = trigger.new;
        for(Opportunity opp4 : lstOpp)opp4.StageName.addError('Must attach a file before changing to ClosedLost');
        }
        }
        }
        */