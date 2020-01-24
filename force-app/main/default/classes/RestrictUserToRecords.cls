public class RestrictUserToRecords {
   public static list<schema.sobjecttype> recordRistriction(sObject obj){
        SObjectType objtype = Schema.getGlobalDescribe().get('obj');
        system.debug('yefyewf'+objtype);
       String sObjName = obj.getSObjectType().getDescribe().getName();
         return null;             
    }
    
    public static list<sobject> recordRistriction(string obj){
        
        string query='select id,name from '+obj+' limit 3';
        //String query = 'select ' + fields + ' from ' + obj + ' limit 2';
        list<sobject> result= database.query(query);//[       ]
        system.debug('the out put is'+ result);
         return result;             
    }
    
}