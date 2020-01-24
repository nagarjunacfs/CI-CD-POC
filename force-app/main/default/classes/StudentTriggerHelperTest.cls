/*

CR# : 01
Developer : Nagarjuna
Date : Jan 7th 2019
Description : Create a field in Staff object called “no of students”, 
        And calculate no of students associated to the particular staff and store that in the above field.

*/


@isTest
public class StudentTriggerHelperTest{
  static testmethod void associatedStudents(){
        list<Student__c> stu=new list<Student__c>();
        Staff__c staff = new Staff__c();
        staff.Name = 'Ramesh';
        staff.Staff_ID__c = 47565;
        staff.Class_Teacher_To__c = 'X Standard';
        insert staff;
        
        Staff__c staff2 = new Staff__c();
        staff2.Name = 'Jaswanth';
        staff2.Staff_ID__c = 756521;
        staff2.Class_Teacher_To__c = 'IX Standard';
        insert staff2;
        
        Staff__c staff3 = new Staff__c();
        staff3.Name = 'Ameer Desai';
        staff3.Staff_ID__c = 714905;
        staff3.Class_Teacher_To__c = 'IX Standard';
        insert staff3;
        
        Student__c s1 = new Student__c();
        s1.Name = 'Jagadeesh kumar';
        s1.Joining_Date__c = system.today()+30;
        s1.Standard__c = 'X';
        s1.Student_Email__c = 'nagarjun.gudi94@gmail.com';
        s1.Parent_Email__c = 'nagarjun.gudi94@gmail.com';
        s1.Emergency_Contact_Number__c = '4384335';
        s1.Parent_Mobile_Number__c = '434366343';
        s1.Roll_Number__c = 783423;
        s1.Class_Teacher__c = staff.Id;
        //insert s1;
        
        Student__c s2 = new Student__c();
        s2.Name = 'Roopa';
     s2.Joining_Date__c = system.today()+30;
        s2.Standard__c = 'IX';
        s2.Student_Email__c = 'nagarjun.gudi94@gmail.com';
        s2.Parent_Email__c = 'nagarjun.gudi94@gmail.com';
        s2.Emergency_Contact_Number__c = '43843345';
        s2.Parent_Mobile_Number__c = '503366343';
        s2.Roll_Number__c = 783439;
        s2.Class_Teacher__c = staff2.Id;
       // insert s2;
        
        Student__c s3 = new Student__c();
        s3.Name = 'Shalini';
       s3.Joining_Date__c = system.today()+30;
        s3.Standard__c = 'X';
        s3.Student_Email__c = 'nagarjun.gudi94@gmail.com';
        s3.Parent_Email__c = 'nagarjun.gudi94@gmail.com';
        s3.Emergency_Contact_Number__c = '43843345';
        s3.Parent_Mobile_Number__c = '503366343';
        s3.Roll_Number__c = 783439;
        s3.Class_Teacher__c = staff.Id;
       // insert s3;
        stu.add(s1);
        stu.add(s2);
        stu.add(s3);
        insert stu;
      s3.Class_Teacher__c = staff2.Id;
        //update stu;
        //update stu;
        stu[2].Class_Teacher__c=staff2.id;
       update stu[2];
       
       // system.debug(staff2.Number_Of_Students__c);
        delete stu[1];
        undelete stu[1];
        
        
        
    }
}