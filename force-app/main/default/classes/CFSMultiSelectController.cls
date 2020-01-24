/*

CR# : 04
Developer : Nagarjuna
Date : Jan 11th 2019
Description : 1. Create a button in result object which popups a Visualforce page 
			  2. In Visualforce page, It should display picklist value of branches of CFS Institution. 
			  3. After selecting any one of the branches click on a button which displays class section where a radio button 
			     should be display asking to select 8 or 9 or 10 and display selected button in the same section.
			  4. After clicking it, should display the student details of that particular class and in that branch.

*/

public class CFSMultiSelectController {
    public string classValue {get;set;}
    public list<Results__c> results {get;set;}
    Set<String> institutes = new Set<String>();
    
    
    
    Public List<string> leftSelected{get;set;}
    Public List<string> rightSelected{get;set;}
    Set<string> leftValues = new Set<string>();
    Set<string> rightValues = new Set<string>();
    
    public CFSMultiSelectController(){
        String branch1 = System.Label.BlrBranch;
        String branch2 = System.Label.DelhiBranch;
        String branch3 = System.Label.MumbaiBranch;
        institutes.add(branch1);
        institutes.add(branch2); 
        institutes.add(branch3); 
        leftselected = new List<String>();
        rightselected = new List<String>();
        leftvalues.addAll(institutes);
    }
    
    public PageReference selectClick(){
        rightSelected.clear();
        for(String s : leftSelected){
            leftValues.remove(s);
            rightValues.add(s);
        }
        return null;
    }
    
    public PageReference unSelectclick(){
        leftSelected.clear();
        for(String s : rightSelected){
            rightValues.remove(s);
            leftValues.add(s);
        }
        return null;
    }
    
    public List<SelectOption> getUnSelectedValues(){
        List<SelectOption> options = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(leftValues);
        tempList.sort();
        for(string s : tempList)
            options.add(new SelectOption(s,s));
        return options;
    }
    
    public List<SelectOption> getSelectedValues(){
        List<SelectOption> options1 = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(rightValues);
        tempList.sort();
        for(String s : tempList)
            options1.add(new SelectOption(s,s));
        return options1;
    }
    /*
    public PageReference add() {
        //           slctoption.addall(fields);
        return null;
    }
    
    public PageReference remove() {
        return null;
    }
    
     */ 
    public void save(){
        
       list<nrg__Branch__c> branches=[select id, nrg__Branch_Name__c from nrg__Branch__c];
        
        delete branches;
        
        list<nrg__Branch__c> branch = new list<nrg__Branch__c> ();
        for(string value:rightvalues){
            nrg__Branch__c cfsBranch=new nrg__Branch__c();
            cfsBranch.nrg__Branch_Name__c = value;
            
           branch.add(cfsBranch);
             
        }
        insert Branch;
       
    }
  
    
    public void submit(){
       
        if(rightvalues.contains('Bangalore')){
            if(classValue == 'VIII Standard'){
                results=[select nrg__Student__r.Branch__c, nrg__Student__r.Name,nrg__student__r.Standard__c,nrg__Percentage__c,nrg__Total_Marks__c,nrg__Result__c from nrg__Results__c where nrg__Student__r.Standard__c='VIII' and nrg__Student__r.branch__c = 'Bangalore']; 
            } 
            else if(classValue == 'IX Standard'){
                results=[select nrg__Student__r.Branch__c, nrg__Student__r.Name,nrg__student__r.Standard__c,nrg__Percentage__c,nrg__Total_Marks__c,nrg__Result__c from nrg__Results__c where nrg__Student__r.Standard__c='IX' and nrg__Student__r.branch__c = 'Bangalore'];
            }
            else if(classValue == 'X Standard'){
                results=[select nrg__Student__r.Branch__c, nrg__Student__r.Name,nrg__student__r.Standard__c,nrg__Percentage__c,nrg__Total_Marks__c,nrg__Result__c from nrg__Results__c where nrg__Student__r.Standard__c='X' and nrg__Student__r.branch__c = 'Bangalore'];
            }
            
        }
        
        if(rightvalues.contains('Delhi')){
            if(classValue == 'VIII Standard'){
                results=[select nrg__Student__r.Branch__c, nrg__Student__r.Name,nrg__student__r.Standard__c,nrg__Percentage__c,nrg__Total_Marks__c,nrg__Result__c from nrg__Results__c where nrg__Student__r.Standard__c='VIII' and nrg__Student__r.branch__c = 'Delhi']; 
            } 
            else if(classValue == 'IX Standard'){
                results=[select nrg__Student__r.Branch__c, nrg__Student__r.Name,nrg__student__r.Standard__c,nrg__Percentage__c,nrg__Total_Marks__c,nrg__Result__c from nrg__Results__c where nrg__Student__r.Standard__c='IX' and nrg__Student__r.branch__c = 'Delhi'];
            }
            else if(classValue == 'X Standard'){
                results=[select nrg__Student__r.Branch__c, nrg__Student__r.Name,nrg__student__r.Standard__c,nrg__Percentage__c,nrg__Total_Marks__c,nrg__Result__c from nrg__Results__c where nrg__Student__r.Standard__c='X' and nrg__Student__r.branch__c = 'Delhi'];
            }
            
        }
        
        if(rightvalues.contains('Mumbai')){
            if(classValue == 'VIII Standard'){
                results=[select nrg__Student__r.Branch__c, nrg__Student__r.Name,nrg__student__r.Standard__c,nrg__Percentage__c,nrg__Total_Marks__c,nrg__Result__c from nrg__Results__c where nrg__Student__r.Standard__c='VIII' and nrg__Student__r.branch__c = 'Mumbai']; 
            } 
            else if(classValue == 'IX Standard'){
                results=[select nrg__Student__r.Branch__c, nrg__Student__r.Name,nrg__student__r.Standard__c,nrg__Percentage__c,nrg__Total_Marks__c,nrg__Result__c from nrg__Results__c where nrg__Student__r.Standard__c='IX' and nrg__Student__r.branch__c = 'Mumbai'];
            }
            else if(classValue == 'X Standard'){
                results=[select nrg__Student__r.Branch__c, nrg__Student__r.Name,nrg__student__r.Standard__c,nrg__Percentage__c,nrg__Total_Marks__c,nrg__Result__c from nrg__Results__c where nrg__Student__r.Standard__c='X' and nrg__Student__r.branch__c = 'Mumbai'];
            }
            
        }
        
        
    }
}