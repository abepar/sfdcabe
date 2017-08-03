public with sharing class IgniteVendorService{
    public IgniteVendorService(ApexPages.StandardSetController controller){  }
    public IgniteVendorService(ApexPages.StandardController controller) { }
    
    public class Wrapper{
        public ID vendorId{get; set;}
        public String vendorName{get; set;}
        public Platform__c platform{get; set;}
        public Ignite_Term__c igniteTerm{get; set;}
        public Double totalAmount{get; set;}
        public Boolean selected{get; set;}
    }
}