public class checkvalue {
public Boolean displayInputputTextAcc{get;set;}
public Boolean displayInputputTextCon{get;set;}
public Boolean displayInputputTextCs{get;set;}
public Boolean displayInputputTextOpp{get;set;}
public Boolean displayInputputTextLd{get;set;}

public Boolean chkBxAcc{get;set;}
public Boolean chkBxCon{get;set;}
public Boolean chkBxCs{get;set;}
public Boolean chkBxOpp{get;set;}
public Boolean chkBxLd{get;set;}
 
public String inputAcc{get;set;}
public String inputCon{get;set;}
public String inputCS{get;set;}
public String inputOpp{get;set;}
public String inputLd{get;set;}

    public List<String> AccRec { get; set; }
    public List<String> ConRec{ get; set; } 
    public List<String> CsStatus { get; set; }
    public List<String> OppStg { get; set; }
    public List<String> LdStatus { get; set; }
    
    
    public List<String> selectedAccRec { get; set; }
    public List<String> selectedConRec{ get; set; } 
    public List<String> selectedCsStatus { get; set; }
    public List<String> selectedOppStg { get; set; }
    public List<String> selectedLdStatus { get; set; }
    
      public List<String> selectedCsRecord { get; set; }
    public List<String> selectedOppRecord { get; set; }
    public List<String> selectedLdRecord { get; set; }
   
    public List<String> CsRecord { get; set; }
    public List<String> OppRecord { get; set; }
    public List<String> LdRecord { get; set; }



public List<String> Accrecord { get; set; }

public String accrecord3 { get; set; }


public Boolean AccCheck{get;set;}
public Boolean conCheck{get;set;}
public Boolean csCheck{get;set;}
public Boolean oppCheck{get;set;}
public Boolean ldCheck{get;set;}


public Boolean AccCheck123{get;set;}

public checkvalue(){
     AccCheck=false;
     conCheck=false;
     csCheck=false;
     oppCheck=false;
     ldCheck=false;
     AccCheck123=false;
}
   private ApexPages.StandardController controller;
 

public PageReference clickAcc(){    
     if(chkBxAcc){
      AccCheck=true;
         displayInputputTextAcc = true;
     }
     else{
         displayInputputTextAcc = false;
         AccCheck=false;
     }
     return null;
     
 }
 
 
  public PageReference clickCon(){    
     if(chkBxCon){
     conCheck=true;
         displayInputputTextCon = true;
     }
     else{
     
     
         displayInputputTextCon = false;
         conCheck=false;
     }
     return null;
     
 }
 
  public PageReference clickCs(){    
     if(chkBxCS){
     csCheck=true;
         displayInputputTextCS = true;
     }
     else{
     
         displayInputputTextCs = false;
         csCheck=false;
     }
     return null;
     
 }
 
 
  public PageReference clickOpp(){    
     if(chkBxOpp){
     oppCheck=true;
         displayInputputTextOpp = true;
     }
     else{
     
         displayInputputTextOpp = false;
         oppCheck=false;
     }
     return null;
     
 }
 
 public PageReference clickLd(){    
     if(chkBxLd){
     ldCheck=true;
         displayInputputTextLd = true;
     }
     else{
     
         displayInputputTextLd = false;
         ldCheck=false;
     }
     return null;
     
 }
 
  public List<selectoption> getcheckacc()
    {return null;
    }
 
 
  public List<selectoption> getAccRecs()
     {          
            list<selectoption> optionsAcc = new list<selectoption>();           
            try
            {              
            list<recordtype> accRectypes=new list<recordType>();
        accRectypes=[select id,name from RecordType where sObjectType='Account']; 
         system.debug('Account recordtype==='+ accRectypes.size()); 
      
        for(Recordtype rec: accRectypes){
            optionsAcc.add(new SelectOption(rec.name, rec.name));
          } 
                system.debug('Account recordtype==='+ optionsAcc.size());
            if(optionsAcc.size()==1){
     AccCheck123=true;
                system.debug('AccCheck123=='+AccCheck123);
     }  
     else{
     AccCheck123=true;
     }
          }
            catch (Exception e)
            {            
            ApexPages.addMessages(e);          
            }
            system.debug('Account recordtype==='+ optionsAcc.size()); 
            return optionsAcc;
        }
    
    
    
    
     public List<selectoption> getConRecs()
    {          
        list<selectoption> optionsConRec = new list<selectoption>();           
        try
        {              
            list<recordtype> conRectypes=new list<recordType>();
        conRectypes=[select id,name from RecordType where sObjectType='Contact']; 
         system.debug('Contact recordtype==='+ conRectypes.size()); 
      
        for(Recordtype rec: conRectypes){
            optionsConRec.add(new SelectOption(rec.name, rec.name));
          } 
          
           if(optionsConRec.size()==0){
     conCheck=false;
     }
          }
            catch (Exception e)
            {            
            ApexPages.addMessages(e);          
            }
            system.debug('Contact recordtype==='+ optionsConRec.size()); 
            return optionsConRec;
            
           
        }
    
    
     public List<selectoption> getCsStatuss()
    {          
        list<selectoption> optionsCsStatus = new list<selectoption>();           
        try
        {              
        //Product Name is a MultiSelect Picklist              
        Schema.DescribeFieldResult fieldResult = case..fields.status.getDescribe();

        list<schema.picklistentry> values = fieldResult.getPickListValues();              
        for (Schema.PicklistEntry a : values)
        {                 
        optionsCsStatus.add(new SelectOption(a.getLabel(), a.getValue()));
        }          
        } 
        catch (Exception e)
        {            
        ApexPages.addMessages(e);          
        }
        system.debug('## Product Name Options'+ optionsCsStatus);         
        return optionsCsStatus;
    }
    
    
    
     public List<selectoption> getOppStgs()
    {    
        system.debug('Inside Opp----');
        system.debug('selectedOppStg'+OppStg);
        list<selectoption> optionsOppStg = new list<selectoption>();           
        try
        {              
        //Product Name is a MultiSelect Picklist    
       // system.debug('OppStg==='+OppStg);          
        Schema.DescribeFieldResult fieldResult = Opportunity..fields.stagename.getDescribe();

        list<schema.picklistentry> values = fieldResult.getPickListValues();              
        for (Schema.PicklistEntry a : values)
        {                 
        optionsOppStg.add(new SelectOption(a.getLabel(), a.getValue()));
        }          
        } 
        catch (Exception e)
        {            
        ApexPages.addMessages(e);          
        }
        system.debug('## Product Name Options'+ optionsOppStg);         
        return optionsOppStg;
    }
    
    
    
    
     public List<selectoption> getLdStatuss()
    {          
        list<selectoption> optionsLdStatus = new list<selectoption>();           
        try
        {              
        //Product Name is a MultiSelect Picklist              
        Schema.DescribeFieldResult fieldResult = lead..fields.Status.getDescribe();

        list<schema.picklistentry> values = fieldResult.getPickListValues();              
        for (Schema.PicklistEntry a : values)
        {                 
        optionsLdStatus.add(new SelectOption(a.getLabel(), a.getValue()));
        }          
        } 
        catch (Exception e)
        {            
        ApexPages.addMessages(e);          
        }
        system.debug('## Product Name Options'+ optionsLdStatus);         
        return optionsLdStatus;
    }
    
    
    
        
         public List<selectoption> getCheckCsRec()
        {          
            list<selectoption> optionsCs = new list<selectoption>();           
            try
            {              
            list<recordtype> csRectypes=new list<recordType>();
        csRectypes=[select id,name from RecordType where sObjectType='Case']; 
         
        for(Recordtype rec: csRectypes){
            optionsCs.add(new SelectOption(rec.name, rec.name));
          } 
          }
            catch (Exception e)
            {            
            ApexPages.addMessages(e);          
            }
            system.debug('Case recordtype==='+ optionsCs.size()); 
            return optionsCs;
        }
        
        
         public List<selectoption> getCheckOppRec()
        {          
            list<selectoption> optionsOpp = new list<selectoption>();           
            try
            {              
            list<recordtype> oppRectypes=new list<recordType>();
        oppRectypes=[select id,name from RecordType where sObjectType='Opportunity']; 
        
        for(Recordtype rec: oppRectypes){
            optionsOpp.add(new SelectOption(rec.name, rec.name));
          } 
          }
            catch (Exception e)
            {            
            ApexPages.addMessages(e);          
            }
            system.debug('Opportunity recordtype==='+ optionsOpp.size()); 
            return optionsOpp;
        }
        
        
         public List<selectoption> getCheckLdRec()
        {          
            list<selectoption> optionsLd = new list<selectoption>();           
            try
            {              
            list<recordtype> accRectypes=new list<recordType>();
        accRectypes=[select id,name from RecordType where sObjectType='lead']; 
         system.debug('lead recordtype==='+ accRectypes.size()); 
      
        for(Recordtype rec: accRectypes){
            optionsLd.add(new SelectOption(rec.name, rec.name));
          } 
           system.debug('lead recordtype==='+ optionsLd.size()); 
           if(optionsLd.size()==0){
     conCheck=false;
     }
          }
            catch (Exception e)
            {            
            ApexPages.addMessages(e);          
            }
           
            return optionsLd;
        }
    
   
    public void save(){
        
         system.debug('Opp===='+OppStg);
    }
    
     public void cancel(){
    }
}