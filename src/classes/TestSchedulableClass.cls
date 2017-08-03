@isTest
public class TestSchedulableClass{
    
    //CRON EXPRESSION: midnight on March 15.
    //Because this is a test, job executes immediately after Test.stopTest().
    public static String CRON_EXP= '0 0 0 15 3 ? 2022';
    
    static testmethod void test() {
        Test.starttest();
        //Schedule the test job
        String jobId = System.schedule('ScheduleApexClassTest',
                                       CRON_EXP,
                                       new MySchedulableClass());
        
        //Get the information from the CronTrigger API object
        CronTrigger ct = [Select Id, CronExpression, TimesTriggered, NextFireTime From CronTrigger Where id = :jobId];
        
        //Verify the job has not run
        System.assertEquals(0, ct.TimesTriggered);
        
        //Verify the next time the job will run
        System.assertEquals('2022-03-15 00:00:00',
                            String.valueOf(ct.NextFireTime));
        //Verify the scheduled job hasn't run yet.
        Merchandise__c[] ml = [Select Id From Merchandise__c Where Name = 'Schedule Job Item'];
        
        System.assertEquals(ml.size(),0);
        Test.stopTest();
        
        //Now that the schedule job has executed after Test.stopTest(), 
        // fetch the new merchandise that got added.
        ml = [Select Id From Merchandise__c Where Name = 'Scheduled Job Item'];
        System.assertEquals(ml.size(), 1);
    }

}