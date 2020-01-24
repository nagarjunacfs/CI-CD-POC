/*

CR# : 03
Developer : Nagarjuna
Date : Jan 10th 2019
Description : 1.	Create 10 accounts in account object and create 50 orders for each account.
			  2.	Create 2 products and add these 2 products to the each and every order automatically when order is created.


*/

public class AccountBatchClass implements Database.Batchable<sObject>{
    public database.QueryLocator start(Database.BatchableContext bcon){
        return Database.getQueryLocator([select id, name from Account where name like '%TestAccount']);
    }
    public void execute(Database.BatchableContext con, List<SObject> objs){
        list<order> orderList = new list<order>();
    	List<Product2> prodcts = new List<Product2>();
         pricebook2 pb = [SELECT ID,NAME FROM PRICEBOOK2 WHERE  NAME='STANDARD'];
       for(schema.account acclist: [select id from Account where id in : objs]){
       		for(integer i= 1;i <= 50;i++){
               order accOrder = new order(name='order'+ i, accountid = acclist.id, EffectiveDate=system.today(), Status='Draft', Pricebook2Id =pb.Id);
              orderList.add(accOrder);
             
   			}
            upsert orderList;   
        }
  	}
    
    public void finish(Database.BatchableContext bcon){    
    }
}