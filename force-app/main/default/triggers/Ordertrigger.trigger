/*

CR# : 03
Developer : Nagarjuna
Date : Jan 10th 2019
Description : 1.	Create 10 accounts in account object and create 50 orders for each account.
			  2.	Create 2 products and add these 2 products to the each and every order automatically when order is created.


*/

trigger Ordertrigger on Order (after insert) {
    list<orderitem> odritems=new list<orderitem>();
    for(Order order : trigger.new)
    {
        OrderItem ordrItem = new OrderItem();
        ordrItem.PricebookEntryId = '01u0o00000Ax5Nx';
        ordrItem.Product2Id = '01t0o00000824tr';
        ordrItem.OrderId = order.id;
        ordrItem.UnitPrice = 1500;
        ordrItem.Quantity = 1;
        odritems.add(ordritem);
        
      /*  OrderItem ordrItem2 = new OrderItem();
        ordrItem2.PricebookEntryId = '01s0o000007FOwI';
        ordrItem2.Product2Id = '01t0o00000824tr';
        ordrItem2.OrderId = order.id;
        ordrItem2.UnitPrice = 2000;
        ordrItem2.Quantity = 1;*/
    }
insert odritems;
}