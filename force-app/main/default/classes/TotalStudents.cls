public class TotalStudents {
    	
    	public static List<Student__c> stdnts = new List<Student__c>();
        public static   List<Staff__c> stf = new List<Staff__c>();
    
    public static void afterInsertStudents(List<Student__c> students)
        
    {
        
        Set<id> set2 = new Set<id>();
        for(Student__c stdnt : students)
        {
            set2.add(stdnt.Class_Teacher__c);
        }
        
        
        List<Staff__c> stf2 = [select id, name, (select id, name from Students__r) from Staff__c where id in : set2];
        
       for(Staff__c s1 : stf2)
       {
           
               // stdnts.add();
               s1.Number_Of_Students__c = s1.Students__r.size();
           
           stf.add(s1);
       }
        update stf;
    }
    
    
   
    
    
    public static void afterDeleteStudents(List<Student__c> students)
    {
        Set<id> set2 = new Set<id>();
        for(Student__c stdnt : students)
        {
            set2.add(stdnt.Class_Teacher__c);
        }
        
        List<Staff__c> stf2 = [select id, name, (select id, name from Students__r) from Staff__c where id in : set2];
        
       for(Staff__c s1 : stf2)
       {
           
               // stdnts.add();
               s1.Number_Of_Students__c = s1.Students__r.size();
           
           stf.add(s1);
       }
        update stf;
    }
    
    
    
   public static void afterupdatenewStudents(List<Student__c> students)
        
    {
        system.debug('content of trigger.new' + students.size());
        Set<id> set2 = new Set<id>();
        for(Student__c stdnt : students)
        {
            set2.add(stdnt.Class_Teacher__c);
        }
        
        // List<Student__c> studnts = [select id,name from student where Class_Teacher__c in : set2 ];
        List<Staff__c> stf2 = [select id, name, (select id, name from Students__r) from Staff__c where id in : set2];
        
       for(Staff__c s1 : stf2)
       {
           
               // stdnts.add();
               s1.Number_Of_Students__c = s1.Students__r.size();
           
           stf.add(s1);
       }
        update stf;
    }
    
    public static void afterupdateoldStudents(List<Student__c> students)
        
    {
        system.debug('content of trigger.new' + students.size());
        Set<id> set2 = new Set<id>();
        for(Student__c stdnt : students)
        {
            set2.add(stdnt.Class_Teacher__c);
        }
        
        List<Staff__c> stf2 = [select id, name, (select id, name from Students__r) from Staff__c where id in : set2];
        
       for(Staff__c s1 : stf2)
       {
           
               // stdnts.add();
               s1.Number_Of_Students__c = s1.Students__r.size();
           
           stf.add(s1);
       }
        update stf;
    }
    
    
    public static void afterUndeleteStudents(List<Student__c> students)
    {
        Set<id> set2 = new Set<id>();
        for(Student__c stdnt : students)
        {
            set2.add(stdnt.Class_Teacher__c);
        }
        
        
        List<Staff__c> stf2 = [select id, name, (select id, name from Students__r) from Staff__c where id in : set2];
        
       for(Staff__c s1 : stf2)
       {
           
               // stdnts.add();
               s1.Number_Of_Students__c = s1.Students__r.size();
           
           stf.add(s1);
       }
        update stf;

    }
}