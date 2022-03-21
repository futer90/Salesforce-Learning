@IsTest
public class TaskLinkAccountTest {
	
    @IsTest
    static void createAccountForTest(){
        
        List<Account> accounts = new List<Account> {
            new Account(Name='Rary')
                };
        
        insert accounts;
        Test.startTest();
        TaskLinkAccount.TaskCreation(accounts);
        Test.stopTest();
        
        Task tsk = [Select Id FROM Task limit 1];
        System.assertNotEquals(null, tsk);
        System.assertEquals(accounts[0].Id, tsk.WhatId);
        
        
    }
}