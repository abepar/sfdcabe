public class LightningController {
    
    @AuraEnabled
    public static list<Account> getAccounts(){
        return [Select Id, Name From Account Limit 10];
    }
    
    @AuraEnabled
    public static List<Opportunity> getOpportunities(Id AccountId){
        return [Select Id, Name From Opportunity WHere Accountid = :AccountId];
    }

}