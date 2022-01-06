//summary-without batch class we can run only 10,000 records at a time
//batchable allows you to run 50 million of records runs in backround and best for long running process
//we can chain the batches one after the other like queable use this syntax "Database.executebatch (new secondbatch());"
 //we have to reduse the batch records because we have some exceptions like //callouts //complex logic // update-records
        //so we can reduse 2000 to 1000/200/100
        //min-1
        //max-2000
        //default-200
        
public class TestDemoBatch implements Database.Batchable<sobject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        //1 million ...2000 records to execute
        return Database.getQueryLocator('SELECT id,name from Account'); //it will not hi run even don't have 1million records
            }
    public void execute(Database.BatchableContext bc,List<Account> subListFromStartMethod){
     //Logic to process all 2000 records
        for(Account acc: subListFromStartMethod){
            acc.name =acc.name.removeStart('Update BatchBatch Updated-Batch Updated-Batch Updated-');
        }
        UPDATE subListFromStartMethod;
      
    }
    public void finish(Database.BatchableContext bc){
        system.debug('@@@ Batch Job Completed @@@');
        //this is how you need chain your job
        //   Database.executeBatch(new TestDemoBatch1(),20 );
    }
}