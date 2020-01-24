/*

CR# : 03
Developer : Nagarjuna
Date : Jan 10th 2019
Description : 1.	Create 10 accounts in account object and create 50 orders for each account.
			  2.	Create 2 products and add these 2 products to the each and every order automatically when order is created.


*/

@isTest
public class AccountBatchClassTest {
 static testmethod void batchTest()
    {
        Account acnt = new Account();
        acnt.Name = 'Sabarish';
        insert acnt;
        
        List<Order> orderList = new List<Order>();
         for(integer i= 1;i <= 50;i++){
                order accOrder = new order(name='order'+ i, accountid = acnt.Id, EffectiveDate=date.ValueOf('2019-01-16'), Status='Draft', Pricebook2Id ='01s0o000007FOwI');
                
                orderList.add(accOrder);
               
            }
        insert orderList;
        
        
        test.startTest();
        AccountBatchClass abs=new AccountBatchClass();
        database.executeBatch(abs);
        test.stopTest();
        
    }
}