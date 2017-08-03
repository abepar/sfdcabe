trigger RestrictInvoiceDeletion on Invoice_Statement__c (before delete) {
    
    //With each of the invoice statements targeted by the trigger
    // and that have line items, ad an error to prevent them
    // from being deleted.
    
    for (Invoice_Statement__c invoice :
         [SELECT Id
          From Invoice_Statement__c
          Where Id in (Select Invoice_Statement__c From Line_Item__c) And
          Id in :Trigger.old]){
              Trigger.oldMap.get(invoice.Id).addError(
                  'Cannot delete invoice statement with line items');
          }

}