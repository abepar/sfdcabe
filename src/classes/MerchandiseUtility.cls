public class MerchandiseUtility{
        public static void mainProcessing(){
            try {
                insertMerchandise();
            } catch(MerchandiseException me) {
                System.debug('Message: ' + me.getMessage());
                system.debug('Cause: ' + me.getCause());
                system.debug('Line number: ' + me.getLineNumber());
                System.debug('Stacktrace: ' + me.getStackTraceString());
            }
        }
        public static void insertMerchandise() {
            try {
                //Insert merchandise without required fields
                Merchandise__c m = new Merchandise__c ();
                insert m;
            } catch(DmlException e) {
                throw new MerchandiseException(
                    'Merchandise item could not be inserted.', e);
            }
        }

}