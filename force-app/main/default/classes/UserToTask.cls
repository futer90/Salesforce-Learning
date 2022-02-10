public class UserToTask {
	@InvocableMethod(label='AssignUserToTask' description='AssignUserToTask')
    
    public static void AssignUserToTask(List<Account> upd){
        Set<ID> accidset = new Set<ID>();
        for(Account acc: upd) {
           accidset.add(acc.Id);
   		} 
        List<Task> tskLst = [Select Id From Task Where WhatId IN:accidset];
        
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