public class AccountToTask {
    @InvocableMethod(label='TaskCreation' description='TaskCreation')
    public static void  TaskCreation(){
        
        List <Task> tsk = new List <Task>();
        for (Account acc: [SELECT Id FROM Account where id=: account_id]){
              Task newtsk = new Task(Subject='Negotiations with' + acc.Name, WhatId=acc.id);
              tsk.add(newtsk);
            }
        
        if(tsk.size()>0){
            insert tsk;
                
        }
    }

	@InvocableMethod(label='AssignUserToTask' description='AssignUserToTask')
    
    public static void  AssignUserToTask(List<Account> lst){
        List<Account> upd = new List<Account>();
        List<Task> tskLst = [Select Id From Task Where WhatId IN:acc_id];
        if (tskLst.size() >3 ){
                Integer count = [SELECT COUNT() FROM User];
				Integer rand = Math.floor(Math.random() * count).intValue();
				User usr = [SELECT Name FROM User LIMIT 1 OFFSET :rand];
            	for (Task tsk: tskLst){
                
                    tsk.OwnerId = usr.Name;
                
            }
		 update tskLst;               
        }
        
        
	}
}