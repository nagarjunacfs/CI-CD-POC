public class AccountBatchClassScheduler implements Schedulable  {
    public  list<orderitem> orderItemList=new list<orderitem>();
    public  list<order> ordr=new list<order>();
    public void execute(System.SchedulableContext sc){
      map<string,string> pricebookEntry = new map<string,string>();
        for(pricebookentry pbEntry : [select id ,product2.id ,pricebook2.id,pricebook2id from pricebookentry where  pricebook2.name='standard' and (product2.name='Cilia' or product2.name='Fragellum')]){
      pricebookEntry.put(pbEntry.id ,pbEntry.product2.id);
        }
        for(order odr:[select id,name,pricebook2id,effectivedate,status from order]){
            for(id entry :pricebookEntry.keyset()){
            Orderitem ordrItm = new Orderitem();
            ordrItm.OrderId = odr.id;
            ordrItm.PricebookEntryId = entry;
            ordrItm.Product2Id=pricebookEntry.get(entry);
            ordrItm.UnitPrice = 1024;
            ordrItm.Quantity = 3;
            orderItemList.add(ordrItm);   
            
        }
        }
        insert orderItemList;
    }
}