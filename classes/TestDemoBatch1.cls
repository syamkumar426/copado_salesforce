//we can chain the batches one after the other like queable use this syntax "Database.executebatch (new secondbatch());"
      //we have to reduse the batch records because we have some exceptions like //callouts //complex logic // update-records
        //so we can reduse 2000 to 1000/200/100
        //min-1
        //max-2000
        //default-200
public class TestDemoBatch1 implements Database.Batchable<sobject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        //1 million ...10000000 records to execute
        return Database.getQueryLocator('SELECT id,lastname from Contact'); //it will not run even don't have 1million records
            }
    public void execute(Database.BatchableContext bc,List<contact> contactList){
     //Logic to process all 2000 records
        for(Contact con: contactList){
                        con.lastname = con.Name;
        }
        UPDATE contactList;
  
    }
    public void finish(Database.BatchableContext bc){
        system.debug('@@@ Batch Job Completed @@@');
     
    }
}