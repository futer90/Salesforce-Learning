@IsTest
public class UpdateAccountwLocatorTest {
	@IsTest
    static void shyr(){
       
    //    List <Task> tasks = [Select Id from Task where Is_Synced__c = False];
        List <Account> accounts = new List<Account>();
        List <Task> newtasks = new List<Task>();
        for (Integer i =0;i<10; i++){
            accounts.add(new Account (OwnerId = '0057Q0000022s5vQAA'));
                }
        insert accounts;
            
         
         for(Account accObj : accounts){
            newtasks.add(new Task (Is_Synced__c = False, WhatId =accObj.Id ));
        }
        insert newtasks;
        
        Test.startTest();
        UpdateAccountwLocator uaw = new UpdateAccountwLocator();
        Id batchId = Database.executeBatch(uaw);
        Test.stopTest();
        
        System.assertEquals(10, [select count () from Task where Account_Owner__c = 'Bebrik']);
        
        
        
    }
}