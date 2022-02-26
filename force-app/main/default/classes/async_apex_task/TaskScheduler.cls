public class TaskScheduler implements Schedulable {
    public void execute(SchedulableContext ctx){
         UpdateAccountwIterable secbatch = New UpdateAccountwIterable();
         UpdateAccountwLocator firstbat = New UpdateAccountwLocator();
         Database.executeBatch(firstbat);
         Database.executeBatch(secbatch);
    }

}

