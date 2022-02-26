trigger AccountTriggerHandler on Account (before insert, before update) {
    UpdatingConWFuture job1 = new UpdatingConWFuture(Trigger.New, Trigger.Old);
    UpdateContactQ job2 = new UpdateContactQ ();
    
    /* Before Insert */
    if(Trigger.isInsert && Trigger.isBefore){      
        job1.futuristic();
        System.enqueueJob(job2);
    }
    
    /* Before Update */
    else if(Trigger.isUpdate && Trigger.isBefore){
        FutureExmpl.futuristic();
    }
            
    
       
}