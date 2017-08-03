public class MerchandiseOperations{
    
    public static Id invoice ( String pName, Integer pSold, String pDesc) {
        //Retrieve the pencils sample merchandise
        Merchandise__c m = [Select Price__c, Total_Inventory__c From Merchandise__c Where Name= :pName limit 1];
        //break if no merchandise is found
        System.assertNotEquals (null, m);
        //Add a new invoice
        Invoice_Statement__c i = new Invoice_Statement__c (
            Description__c = pDesc);
            insert i;
// Add a new line item to the invoice
            Line_Item__c li = new Line_Item__c(
                Name = '1',
                Invoice_Statement__c = i.Id,
                Merchandise__c = m.Id,
                Unit_Price__c = m.Price__c,
                Units_Sold__c = pSold);
            insert li;
            
            //Update the inventory of the merchandise item
            m.Total_Inventory__c -= pSold;
            update m;
            return i.Id;
	}
	}