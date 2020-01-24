/*

CR# : 01
Developer : Nagarjuna
Date : Jan 7th 2019
Description : Create a field in Staff object called “no of students”, 
			  And calculate no of students associated to the particular staff and store that in the above field.

*/

trigger StudentTrigger on Student__c (after insert, after update, after delete, after undelete) {
    if(trigger.isInsert || trigger.isUndelete){
        if(Student__c.Class_Teacher__c != null){
            StudentTriggerHelper.totalStudents(Trigger.new);
        } 
    }
    if(trigger.isUpdate){
       StudentTriggerHelper.totalStudents(Trigger.old);
       StudentTriggerHelper.totalStudents(Trigger.new);
    }
    if(trigger.isdelete ){
       StudentTriggerHelper.totalStudents(Trigger.old);
    }
    
    
    
    /*
    if(trigger.isInsert || trigger.isdelete || trigger.isUndelete)
    {
        AssociatedStudentsToStaff.totalStudents(Trigger.new);    
    }
    
    if(trigger.isUpdate){
        
        AssociatedStudentsToStaff.totalStudents(Trigger.new); 
        AssociatedStudentsToStaff.totalStudents(Trigger.old);
    }
    */
    /*
    if(trigger.isdelete)
    {
        AssociatedStudentsToStaff.StudentsAfterDelete(Trigger.old);    
    }
    
    if(trigger.isUpdate){
        
        AssociatedStudentsToStaff.StudentsAfterNewUpdate(Trigger.new); 
        AssociatedStudentsToStaff.StudentsAfterOldUpdate(Trigger.old);
    }
*/
    /*
    if(trigger.isUndelete)
    {
        AssociatedStudentsToStaff.StudentsAfterDelete(Trigger.old);
    }
*/
}