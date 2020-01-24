public class Chebtrail {
    
    
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
    
    
    public List<String> Accrecord { get; set; }
    
    public List<String> accrecord3 { get; set; }
    
    
    public Boolean AccCheck{get;set;}
    public Boolean ConCheck{get;set;}
    public Boolean OppCheck{get;set;}
    public Boolean CsCheck{get;set;}
    public Boolean LdCheck{get;set;}
    
    
    public Chebtrail(){
        AccCheck=false;
        ConCheck = false;
        OppCheck = false;
        CsCheck = false;
        LdCheck = false;
    }
    
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
            ConCheck = true;
            displayInputputTextCon = true;
        }
        else{
            displayInputputTextCon = false;
            ConCheck = false;
        }
        return null;
        
    }
    
    public PageReference clickCs(){ 
        if(chkBxCS){
            CsCheck = true;
            displayInputputTextCS = true;
        }
        else{
            displayInputputTextCs = false;
            CsCheck = false;
        }
        return null;
        
    }
    
    
    public PageReference clickOpp(){ 
        if(chkBxOpp){
            OppCheck = true;
            displayInputputTextOpp = true;
        }
        else{
            displayInputputTextOpp = false;
            OppCheck = false;
        }
        return null;
        
    }
    
    public PageReference clickLd(){ 
        if(chkBxLd){
            LdCheck = true;
            displayInputputTextLd = true;
        }
        else{
            displayInputputTextLd = false;
            LdCheck = false;
        }
        return null;
        
    }
    
    public List<selectoption> getAccRecs()
    { 
        list<selectoption> optionsAccRec = new list<selectoption>(); 
        try
        { 
            //Product Name is a MultiSelect Picklist 
            Schema.DescribeFieldResult fieldResult = Account..fields.Rating.getDescribe();
            
            list<schema.picklistentry> values = fieldResult.getPickListValues(); 
            for (Schema.PicklistEntry a : values)
            { 
                optionsAccRec.add(new SelectOption(a.getLabel(), a.getValue()));
            } 
        } 
        catch (Exception e)
        { 
            ApexPages.addMessages(e); 
        }
        system.debug('## Product Name Options'+ optionsAccRec); 
        return optionsAccRec;
    }
    
    
    
    
    public List<selectoption> getConRecs()
    { 
        list<selectoption> optionsConRec = new list<selectoption>(); 
        try
        { 
            //Product Name is a MultiSelect Picklist 
            Schema.DescribeFieldResult fieldResult = contact..fields.CleanStatus.getDescribe();
            
            list<schema.picklistentry> values = fieldResult.getPickListValues(); 
            for (Schema.PicklistEntry a : values)
            { 
                optionsConRec.add(new SelectOption(a.getLabel(), a.getValue()));
            } 
        } 
        catch (Exception e)
        { 
            ApexPages.addMessages(e); 
        }
        system.debug('## Product Name Options'+ optionsConRec); 
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
        list<selectoption> optionsOppStg = new list<selectoption>(); 
        try
        { 
            //Product Name is a MultiSelect Picklist 
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
    
    
    
    public List<selectoption> getaccRecord3()
    { 
        list<selectoption> options3 = new list<selectoption>(); 
        try
        { 
            list<recordtype> accRectypes=new list<recordType>();
            accRectypes=[select id,name from RecordType where sObjectType='Account']; 
            system.debug('lead recordtype==='+ accRectypes.size()); 
            
            for(Recordtype rec: accRectypes){
                options3.add(new SelectOption(rec.name, rec.name));
                
            }
            
        } 
        catch (Exception e)
        { 
            ApexPages.addMessages(e); 
        }
        system.debug('lead recordtype==='+ options3.size()); 
        
        
        
        return options3;
    }
    
    
    public void save(){
        
        
        system.debug('1323==='+accRec);
        system.debug('1323==='+ConRec);
        system.debug('1323==='+CsStatus);
        system.debug('1323==='+OppStg);
        system.debug('1323==='+LdStatus);
        
    }
    
    public void cancel(){
    }
}