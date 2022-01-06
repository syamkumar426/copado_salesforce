trigger trigger_advance on Opportunity (After Insert) 
{
contact c = new contact();
for(opportunity f : Trigger.new)
{
c.AccountID = f.AccountID;
 c.Firstname ='steve';
 c.Lastname = 'jobs';
 insert c;
}
}