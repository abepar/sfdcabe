@isTest
public class TestDataFactory {
    
    public static Invoice_Statement__c createOneInvoiceStatement(
        Boolean withLineItem) {
            //Create one invoice statement
            Invoice_Statement__c testInvoice = createInvoiceStatement();
            
            if (withLineItem == true) {
                //Create a merchandise item
                Merchandise__c m = createMerchandiseItem('Orange juice');
                //Create one line item and associate it with the invoice statement.
                
                AddLineItem (testInvoice, m);
            }
            return testInvoice;
        }
    //Helper methods
    //
    private static Merchandise__c createMerchandiseItem (String merchName) {
        Merchandise__c m = new Merchandise__c (
            Name=merchName,
            Description__c='Fresh juice',
            Price__c=2,
            Total_Inventory__c=1000);
        insert m;
        return m;
    }
    
    private static Invoice_Statement__c createInvoiceStatement() {
        Invoice_Statement__c inv = new Invoice_Statement__c(
            Description__c='Test Invoice');
        insert inv;
        
        return inv;
    }
    
    private static Line_Item__c AddLineItem(Invoice_Statement__c inv,
                                            Merchandise__c m) {
        Line_Item__c lineItem = new Line_Item__c(
            Invoice_Statement__c = inv.Id,
            Merchandise__c = m.Id,
            Unit_Price__c = m.Price__c,
            Units_Sold__c = (Double)(10*Math.random()+1));
                                                
                                                insert lineItem;
                                                
                                                return lineItem;
                                                
                                            }
}

//This class contains one public method called createOneInvoiceStatement- that creats an invoice statement and a
//merchandise item to be used as test data in test methods in the next lesson. It takes a Boolean arguement that 
//indicates whether a line item is to be added to the invoice.

//It also contained three helper methods that are used by createOneInvoiceStatement. These methods are all private 
//and are used only within this class

//Even though any Apex class can contain public methods for test data creation, this common utility class is defined with 
//the @isTest annotation. The added benefit is that this class will not count againset the 3mb organization code size limit. The public 
//moethods in this can only be called by test code.