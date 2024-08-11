trigger Contact on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if(Trigger.isAfter && Trigger.isInsert){
        List<Account> listOfContacts = new List<Account>();
        for(Contact con:Trigger.new){
            if(con.AccountId == null){
                Account acc = new Account();
                acc.Name = con.LastName + ' || Created from Contact Trigger';
                acc.CurrencyIsoCode = 'INR';
                listOfContacts.add(acc);
                System.debug(acc + '##############');
            }
            
        }
        System.debug(listOfContacts + '&&&&&&&&&&&&&&&');
        insert listOfContacts;
    }
}