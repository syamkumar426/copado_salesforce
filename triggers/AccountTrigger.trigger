trigger AccountTrigger on Account(before insert, after insert, before update,after update,before delete,after delete,after undelete)
{
    if (trigger.isBefore)
    {
        if(trigger.isInsert)
        {
            AccountTriggerHandler.beforeInsertHandler(trigger.new);
        }
        if(trigger.isUpdate)
        {
            AccountTriggerHandler.beforeUpdateHandler(trigger.new,trigger.newMap,trigger.old,trigger.oldMap);
        }
        
    }
    if (trigger.isAfter)
    {
        if(trigger.isInsert)
        {
            AccountTriggerHandler.afterInsertHandler(trigger.new,trigger.newMap);
        }
        if(trigger.isUpdate)
        {
            AccountTriggerHandler.afterUpdateHandler(trigger.new,trigger.newMap,trigger.old,trigger.oldMap);
        }
        
    }
}