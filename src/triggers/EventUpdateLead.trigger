trigger EventUpdateLead on Event (after delete, after insert, after undelete, after update) {

    Set<Id> leadIds = new Set<Id>();
    string prefix = LeadActivityCount.leadPrefix;
    
    if (Trigger.new != null) {
        for (Event e : Trigger.new) {
            if (e.WhatId != null && String.valueOf(e.whatId).startsWith(prefix)){
                leadIds.add(e.whatId);
            }
        }
    }
    
    if (Trigger.old != null) {
        for (Event e: Trigger.old) {
            if (e.WhatId != null && String.valueOf(e.WhatId).startsWith(prefix) ){
                leadIds.add(e.whatId);
            }
        }
    }
    
    if (leadIds.size() > 0)
        LeadActivityCount.updateLeadCounts(leadIds);
        
    
}