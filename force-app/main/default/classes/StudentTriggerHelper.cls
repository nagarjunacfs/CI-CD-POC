/*

CR# : 01
Developer : Nagarjuna
Date : Jan 7th 2019
Description : Create a field in Staff object called “no of students”, 
			  And calculate no of students associated to the particular staff and store that in the above field.

*/


public class StudentTriggerHelper {
    public static List<Student__c> students = new List<Student__c>();
    public static   List<Staff__c> staffList1 = new List<Staff__c>();
    public static void totalStudents(List<Student__c> studentsList){
        Set<id> staffIds = new Set<id>();
        for(Student__c stdnt : studentsList){
            staffIds.add(stdnt.Class_Teacher__c);
        }
        List<Staff__c> staffList = [select id, name, (select id, name from Students__r) from Staff__c where id in : staffIds];
        
        for(Staff__c staff : staffList){
            // stdnts.add();
            staff.Number_Of_Students__c = staff.Students__r.size();
            staffList1.add(staff);
        }
        update staffList1;
    }
    
    
    
    
    
    /*
      public static void StudentsAfterOldUpdate(List<Student__c> students)
    {
        totalStudents(students);
    }
    
     public static void StudentsAfterNewUpdate(List<Student__c> students)
    {
        totalStudents(students);
    }
*/
    
    /*
    public static void StudentsAfterInsert(List<Student__c> students)
    {
        totalStudents(students);
    }
        
    public static void StudentsAfterDelete(List<Student__c> students)
    {
        totalStudents(students);
    }
    */
   
    /*
     public static void StudentsAfterUndelete(List<Student__c> students)
    {
        totalStudents(students);
    }
*/
}