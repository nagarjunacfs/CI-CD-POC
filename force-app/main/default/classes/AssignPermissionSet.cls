@restresource(urlMapping='/submitusername/*')
global with sharing class AssignPermissionSet {
    @HttpPost
    global Static String test(String userName2, String permissionSetName) 
    {
        String msg;
        List<user> userId = [select id from user where Username like: userName2];
        system.debug('user id : ' + userId);
        list<PermissionSet> permSetId = [select id from PermissionSet where label like: permissionSetName];
        system.debug('permission set id : ' + permSetId);
        list<PermissionSetAssignment> permissionlist =new list<PermissionSetAssignment>();
        if(userId.size()>0 && permSetId.size()>0){
          for(user us: userId){
                for(PermissionSet per: permSetId){
             PermissionSetAssignment pa = new PermissionSetAssignment(AssigneeId=us.Id,PermissionSetId = per.id);
                    permissionlist.add(pa);
                }
            }
            try
            {
               //pa.AssigneeId =    '0050o00000VInInAAL';
                //pa.Id = '0PS0o000001xuj7GAA';
                insert permissionlist;
                msg='Permission Set successsfully assigned to User';
                system.debug(msg);
            }
            catch(Exception e){
             system.debug('Error is ' + e.getMessage());
                msg=e.getMessage();  
            }
            
        }
        else
        {
            msg='User or Permission Set not found in Salesforce';
            system.debug(msg);
        }
        //Map<id,User> users = [select]
        
        return msg;
    }
    
    @HttpGet
     global static list<sobject> recordRistriction(){
         RestRequest req = RestContext.request;
        String objName = req.requestURI.substring(req.requestURI.lastIndexOf('/') + 1);
        string query='select id,name from '+objName+' limit 3';
        //String query = 'select ' + fields + ' from ' + obj + ' limit 2';
        list<sobject> records= database.query(query);//[       ]
        system.debug('the output is'+ records);
         return records;             
    }
}