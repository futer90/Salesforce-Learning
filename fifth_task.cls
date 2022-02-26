public class AccountToTask {
    @InvocableMethod(label='TaskCreation' description='TaskCreation')
    
    public static void  TaskCreation(List<Account> acc){
        List <Task> tsk = new List <Task>();
        for(Account accObj : acc){
        	Task newtsk = new Task(Subject='Negotiations with' + accObj.Name, WhatId=accObj.id);
        	tsk.add(newtsk);
        }
        
        if(tsk.size()>0){
            insert tsk;               
        }
    }

	
}

//       for (Account acc: [SELECT Id, Name FROM Account ]){