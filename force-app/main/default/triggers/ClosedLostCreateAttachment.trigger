trigger ClosedLostCreateAttachment on Opportunity (before update) {
    
    if(trigger.isUpdate)
    {
     Map<Id,Opportunity> oppAttchmnts = new Map<Id,Opportunity>(
        [SELECT Id,(SELECT Id FROM Attachments) FROM Opportunity WHERE Id IN :Trigger.new]);
      
       for(Opportunity opp : trigger.old)
       {
           if((opp.StageName == 'Closed Won' || opp.StageName == 'Closed Lost') && (oppAttchmnts.get(opp.Id).Attachments == null)
             )
             {
               opp.StageName.addError('Must attach a file before changing to ClosedLost');    
             }
       }
    }

}