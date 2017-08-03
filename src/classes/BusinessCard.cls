public class BusinessCard {
    
    public User user;
    
    public BusinessCard(ApexPages.StandardController con)
    {
        user = [Select Id, FirstName, LastName, Email, Title, Phone From User WHere Id = :userinfo.getUserId()];
    }

}