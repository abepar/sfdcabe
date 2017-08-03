public with sharing class LeadActivityCount{
    
    public static Boolean didRun = false;
    public static string leadPrefix = Lead.sObjectType.getDescribe().getKeyPrefix();
    
    // Takes a set of Lead ID's, queries those opportunities, and updates the activity count if appropriate

    public static void updateLeadCounts(Set<ID> leadIds) {
        
        if (didRun == false) {//this operation should run only once per transaction
            didRun = true;
            
            List<Lead> leads = [Select Id, Activity_Count__c, (Select Id from Tasks), (Select Id from Events) From Lead Where ID IN :leadIds];
            List<Lead> updatedLeads = new List<Lead>();
            
            for (Lead l : leads) {
                Integer count = l.tasks.size() + l.events.size();
                
                if (l.activity_count__c != count) {
                    l.activity_count__c = count;
                    updatedLeads.add(l); //only the opps which have changed need to be updated, no need to modify the others
                }
            }
            //update the appropriate leads
            try {
                update updatedLeads;
            }	catch (Exception e) {
            }
        }
    }
    

}