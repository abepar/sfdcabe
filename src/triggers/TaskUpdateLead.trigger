trigger TaskUpdateLead on Task (after delete, after insert, after undelete, after update) {

    Set<Id> leadIds = new Set<Id>();
    String prefix = LeadActivityCount.leadPrefix;
    
    if (Trigger.new != null) {
        for (Task t : Trigger.new) {
            if (t.WhatId != null && String.valueOf(t.whatId).startsWith(prefix) ){
                leadIds.add(t.whatId);
            }
        }
            }
        
        if (leadIds.size() > 0)
            LeadActivityCount.updateLeadCounts (leadIds);
    
}