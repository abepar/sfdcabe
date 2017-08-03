public with sharing class ContactController {
    
    @AuraEnabled
    public static List<Contact> findAll() {
        return [Select id, name, phone From Contact Limit 50];
    }
    
    @AuraEnabled
    public static List<Contact> findByName(string searchKey) {
        string name = '%' + searchKey + '%';
        return [Select id, name, phone From Contact Where Name Like :name Limit 50];
    }
    
    @AuraEnabled
    public static Contact findById(string contactId) {
        return [Select id, name, title, phone, mobilephone, account.name from contact where id = :contactId];
    }

}