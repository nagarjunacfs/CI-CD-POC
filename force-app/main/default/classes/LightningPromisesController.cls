public class LightningPromisesController {
	 @AuraEnabled
    public static String promiseMethod(){
        System.debug('First Promise method');
        return 'First Promise method';
    }
    @AuraEnabled
    Public static void ltngPromise(){
        System.debug('Second Promise method');
    }

}