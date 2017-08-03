public with sharing class HouseController {

    @AuraEnabled
    public static HousePagedResult findAll(String searchKey, Decimal minPrice, Decimal maxPrice, Decimal pageNumber) {
        Integer pageSize = 8;
        String key = '%' + searchKey + '%';
        Integer offset = ((Integer)pageNumber - 1) * pageSize;
        
        HousePagedResult r =  new HousePagedResult();
        r.pageSize = pageSize;
        r.page = (Integer) pageNumber;
        r.total = [SELECT count() FROM house__c 
                      WHERE (title__c LIKE :key OR city__c LIKE :key)
                      AND price__c >= :minPrice
                  	  AND price__c <= :maxPrice];
        r.houses = [SELECT Id, title__c, city__c, size__c, description__c, price__c, bathrooms__c, bedrooms__c, Default_Picture_URL__c FROM house__c 
                      WHERE (title__c LIKE :key OR city__c LIKE :key)
                      AND price__c >= :minPrice
					  AND price__c <= :maxPrice
                      ORDER BY price__c LIMIT 8 OFFSET :offset];
        System.debug(r);
        return r;
    }

}