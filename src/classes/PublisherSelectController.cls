public with sharing class PublisherSelectController {
    public ID[] lstVendorIds{get; set;}
    public IgniteVendorService.Wrapper[] lstVendorWrappers{get; set;}
    public ID[] lstSelectedVendorIds{get; set;}
    
    public PublisherSelectController(ApexPages.StandardSetController stdSetCtrl){
        // Initialize lists
        this.lstVendorWrappers = new IgniteVendorService.Wrapper[]{};
        this.lstVendorIds = new ID[]{};
        this.lstSelectedVendorIds = new ID[]{};
        
        SObject[] lstRecords = stdSetCtrl.getRecords();
        for(SObject sObj : lstRecords){
            this.lstVendorIds.add((ID)sObj.get('Id'));
        }
        Ignite_Vendor__c[] lstVendors = [SELECT Id, Name, Ignite_Platform__r.Id, Ignite_Platform__r.Name, Ignite_Term__r.Id,  Ignite_Term__r.Name 
                                         FROM Ignite_Vendor__c WHERE Id IN :this.lstVendorIds];
        
        for(Ignite_Vendor__c iVendor : lstVendors){
            IgniteVendorService.Wrapper wrap = new IgniteVendorService.Wrapper();
            wrap.vendorId = iVendor.Id;
            wrap.vendorName = iVendor.Name;
            wrap.platform = iVendor.Ignite_Platform__r;
            wrap.igniteTerm = iVendor.Ignite_Term__r;
            this.lstVendorWrappers.add(wrap);
        }
    }
    
    public PageReference selectVendors(){
        this.lstSelectedVendorIds = new ID[]{};
        for(IgniteVendorService.Wrapper wrap : this.lstVendorWrappers){
            if(wrap.selected) this.lstSelectedVendorIds.add(wrap.vendorId);
        }
        ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.INFO, 'Selected Vendor IDs: ' + String.join(this.lstSelectedVendorIds, ', ')));
        return null;
    }
}