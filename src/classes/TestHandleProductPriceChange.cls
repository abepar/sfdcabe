@isTest 
private class TestHandleProductPriceChange {static testMethod void testPriceChange()  {Invoice_Statement__c invoice = new Invoice_Statement__c(Status__c = 'Negotiating');
insert invoice;
Merchandise__c[] products = new Merchandise__c[]{
    new Merchandise__c(Name = 'item 1', Description__c = 'test product 1', Price__c = 10, Total_Inventory__c = 10),
    new Merchandise__c(Name = 'item 2', Description__c = 'test product 2', Price__c = 11, Total_Inventory__c = 10)
};
insert products;
Line_Item__c[] lineItems = new Line_Item__c[] {
    new Line_Item__c(Invoice_Statement__c = invoice.id, Merchandise__c = products[0].id, Unit_Price__c = 10, Units_Sold__c = 3),
    new Line_Item__c(Invoice_Statement__c = invoice.id, Merchandise__c = products[1].id, Unit_Price__c = 11, Units_Sold__c = 6)
};
insert lineItems;

products[0].price__c = 20; // raise price  
    
products[1].price__c = 5;  // lower price  
    
Test.startTest();
update products;
Test.stopTest();
 
lineItems =
[SELECT id, unit_price__c FROM Line_Item__c WHERE id IN :lineItems];
System.assert(lineItems[0].unit_price__c == 10);  // unchanged  
    
System.assert(lineItems[1].unit_price__c == 5);   // changed!! 




}
}