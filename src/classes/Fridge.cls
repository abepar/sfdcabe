public class Fridge implements KitchenUtility{

    private String modelNumber;
    private Integer numberInStock;
    public static Integer stockThreshold = 5;
    
    public void updateStock(Integer justSold) {
        numberInStock = numberInStock - justSold;
    }
    
    public Integer ecoRating {
        
        get {return ecoRating;}
        set {ecoRating = value; if (ecoRating < 0) ecoRating=0;}
    }
    
    public void setModelNumber(String theModelNumber) {
        modelNumber = theModelNumber;
            }
    public string getModelNumber() {
        return modelNumber;
    }
    public Fridge() {
        modelNumber = 'XX-XX';
        numberInStock= 0;
    }
    public Fridge(String theModelNumber, Integer theNumberInStock) {
        modelNumber=theModelNumber;
        numberInStock = theNumberInStock;
    }
    
    
}