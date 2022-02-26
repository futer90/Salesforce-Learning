public class UpdateAccountwIterable implements Database.Batchable<sObject>{

    public Iterable<sObject> start(Database.BatchableContext info){
            return [Select Id from Contact where Is_Synced__c = False];
            
    }
    
    /*public static void executeBatch(Database.Batchable batch) {
    
            Database.BatchableContext BC = new Database.BatchableContext();
            Iterable<sObject> iterator = batch.start(BC);
            List<Object> items = new List<Object>();
            while(iterator.hasNext()) {
                items.add(iterator.next());
                if(items.size()==batchLimit) {
                    batch.execute(BC,items);
                    items.clear();
                }
            }
            batch.finish(BC);
        }*/
        
        public void execute(Database.BatchableContext info, List<Contact> scope){
           List<Contact> ConsToUpdate = new List<Contact>();
           for(Contact con : scope){ 
               con.MailingStreet = con.Account.BillingStreet; 
               con.MailingCity = con.Account.BillingCity; 
               con.MailingState = con.Account.BillingState;
               con.MailingPostalCode = con.Account.BillingPostalCode;
               con.MailingCountry = con.Account.BillingCountry;
               con.Is_Synced__c = True;
               con.Account.Updated_By_Contact__c = True;
               ConsToUpdate.add(con); 
           } 
           update ConsToUpdate; 
       }
        
       public void finish(Database.BatchableContext info){  
            AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
                JobItemsProcessed,
                TotalJobItems, CreatedBy.Email
                FROM AsyncApexJob
                WHERE Id = :info.getJobId()];
       } 
    }