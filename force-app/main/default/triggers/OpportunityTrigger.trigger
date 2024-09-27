trigger OpportunityTrigger on Opportunity (after update, before update, after insert, before insert, after delete, after undelete, before delete) {
    if(Trigger.isAfter && Trigger.isUpdate){

        List<Account> accList = new List<Account>();
        List<Opportunity> oldOpp = new List<Opportunity>();
        List<Account> accToUpdate = new List<Account>();

        for(Opportunity opp:Trigger.new){
            if(opp.Series__c != opp.Account.Series__c){
                Account acc = new Account();
                acc.Id = opp.AccountId;
                acc.Series__c = opp.Series__c;
                accToUpdate.add(acc);
            }
        }
        if(accToUpdate != null){
            update accToUpdate;
        }
    }
}