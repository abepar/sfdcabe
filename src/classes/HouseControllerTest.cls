@isTest
private class HouseControllerTest {
    static testMethod void myTest() {
        HousePagedResult result = HouseController.findAll('', 0, 2000000, 1);
        System.assert(result != null);
     }
}