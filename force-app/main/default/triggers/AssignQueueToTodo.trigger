trigger AssignQueueToTodo on Todo__c (before insert) {
    
   Group todayQueue = [Select Id from Group where Type = 'Queue' AND Name = 'Today_Todo' LIMIT 1];
   Group tomorQueue = [Select Id from Group where Type = 'Queue' AND Name = 'Tomorrow_Todo' LIMIT 1];
   Group laterQueue = [Select Id from Group where Type = 'Queue' AND Name = 'Later_Todo' LIMIT 1];
    

   for(Todo__c todos : Trigger.new){
       if (todos.Category__c == 'Today') {
           todos.OwnerId = todayQueue.Id;
       }
		
       if (todos.Category__c == 'Tomorrow') {
           todos.OwnerId = tomorQueue.Id;
       }
       
       if (todos.Category__c == 'Later'){
        	todos.OwnerId = laterQueue.Id;   
           
       }
       
   }
    

}