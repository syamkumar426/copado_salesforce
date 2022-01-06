trigger trigger_basic on Opportunity (Before Insert, Before Update) {
for(opportunity  a: Trigger.new)
{
   if (a.Amount < 501)
   a.adderror ('The Amount should be grater than 500');
}
}