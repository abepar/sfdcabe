trigger handleproductpricechange on Merchandise__c (after update) {// update invoice line items associated with open invoices  
    
List<Line_Item__c> openLineItems =
       [SELECT j.Unit_Price__c, j.Merchandise__r.Price__c
     FROM Line_Item__c j 
     WHERE j.Invoice_Statement__r.Status__c = 'Negotiating'  
     AND j.Merchandise__r.id IN :Trigger.new 
     FOR UPDATE]; 
     
         for (Line_Item__c li: openLineItems) {
        if ( li.Merchandise__r.Price__c < li.Unit_Price__c ){
        li.Unit_Price__c = li.Merchandise__r.Price__c;
        }
    }
    update openLineItems;

}