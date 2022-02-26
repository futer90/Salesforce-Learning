public class UpdateAccountwLocator implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
           return Database.getQueryLocator( [Select Id from Task where Is_Synced__c = False]
           );
    }
       public void execute(Database.BatchableContext bc, List<Task> scope){
           List <Task> updtasks = new List <Task>();
           for (Task task: scope){
              
               task.Account_Owner__c = task.Account.Owner.Name;
               task.Is_Synced__c = True;
               task.Account.Updated_By_Task__c = True;
               updtasks.add(task);
           }
           update updtasks;
       }
          
           
        public void finish(Database.BatchableContext bc){
           AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
               JobItemsProcessed,
               TotalJobItems, CreatedBy.Email
               FROM AsyncApexJob
               WHERE Id = :bc.getJobId()];
       }
   }