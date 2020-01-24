/*

CR# : 02
Developer : Nagarjuna
Date : Jan 9th 2019
Description : Without creating attachment to the opportunity user should not change the status to "closed won" or "closed lost".

*/


@isTest
public class OpportunityTriggerHelperTest{
    public static testmethod void createAttachment(){
        Opportunity op = new Opportunity();
        op.Name = 'Duke';
        op.Amount = 1000;
        op.StageName = 'Prospecting';
        op.CloseDate = system.today() + 4;
        insert op;
        
        op.StageName = 'Closed Won';
        update op;
        
        String content = system.currentPageReference().getParameters().get('fileContents');
        Attachment atchmnt = new Attachment();
        atchmnt.Body = Blob.valueOf(content);
        atchmnt.Name = String.valueOf('Closed Attachment.txt');
        atchmnt.ParentId = op.Id;
        insert atchmnt;
      
        op.StageName = 'Closed Lost';
        update op;
        
    }
}