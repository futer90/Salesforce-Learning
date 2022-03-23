global class CreateTodoFromEmail implements Messaging.InboundEmailHandler {
 
  global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, 
                                                         Messaging.InboundEnvelope env){
                                                             
    Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
    //Contact newcon = new Contact(); 
    List <Todo__c> newTodo = new List <Todo__c> ();                                                         
    List <Contact> sender = [SELECT Id, Name, Email from Contact where Email = :email.fromAddress LIMIT 1];
    if(sender.size() == 0 ){
        
        sender.add(new Contact(LastName = email.fromName, Email = email.fromAddress));
        insert sender;
        //newcon.Email = email.fromAddress;         
     }       
                                                             
                                                             
	newTodo.add(new Todo__c(
    			Name = email.plainTextBody,
        		Category__c = 'Later',
        		Priority__c = 'medium',
        		Status__c = 'draft',
        		Contact__c = sender[0].Id
        
    ));
                                                             
	insert newTodo;                                                             
                                                             
    result.success = true;
	return result;                                                    
   }
    
	
}