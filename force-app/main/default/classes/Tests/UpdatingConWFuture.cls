@IsTest
public class UpdatingConWFutureTest {
    @IsTest
    static void Dosomesh(){
		Account acc = new Account(Name='Kanzler', BillingStreet='Dumskaya');
        insert acc;
        
		acc.BillingStreet='Razumovskaya';
        update acc;
        
         Contact contacts = [Select Id from Contact where AccountId=:acc.Id];
        System.assertEquals(contacts.Is_Synced__c, False);
        System.assertNotEquals(contacts.Processed_By_Future__c, null);
        
    }
}