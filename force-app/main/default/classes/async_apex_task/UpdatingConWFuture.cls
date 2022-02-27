public class UpdatingConWFuture {
    @future
        public static void futuristic(){
            Set <Id> updatedAcc = new Set <Id> ();
            for(Integer i=0; i < Trigger.new.size(); i++){
                Account newAcc = Trigger.New[i];
                Account oldAcc = Trigger.Old[i];
                if (newAcc.BillingStreet != oldAcc.BillingStreet ||
                    newAcc.BillingCity != oldAcc.BillingCity ||
                    newAcc.BillingState != oldAcc.BillingState ||
                    newAcc.BillingPostalCode != oldAcc.BillingPostalCode ||
                    newAcc.BillingCountry != oldAcc.BillingCountry) {
                       
                        updatedAcc.add(newAcc.Id);
                    }
                
            }
           // List<Account> accounts = [Select Id, (select Id from Contacts ) from Account Where Id IN :updatedAcc];
            List<Contact> contacts = [Select Id from Contact where AccountId IN : updatedAcc];
            //for (Account account : account) {
                for (Contact contact : contacts) {
                    contact.Is_Synced__c = False;
                    contact.Processed_By_Future__c = True;
                      
        }
              update contacts;  
    }
    }