trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if(Trigger.isInsert && Trigger.isBefore){
        //Updating the Shipping Address similar to Billing Address while creation of account.
        for(Account acc: Trigger.new){
            if(acc.BillingStreet != null){
                acc.ShippingStreet = acc.BillingStreet;
            }
            if(acc.BillingCity != null){
                acc.ShippingCity = acc.BillingCity;
            }
            if(acc.BillingState != null){
                acc.ShippingState = acc.BillingState;
            }
            if(acc.BillingPostalCode != null){
                acc.ShippingPostalCode = acc.BillingPostalCode;
            }
            if(acc.BillingCountry != null){
                acc.ShippingCountry = acc.BillingCountry;
            }   
        }
    }

    if(Trigger.isAfter && Trigger.isUpdate){
        //Updating Status of Opportunity to Closed Lost if Created Date is less than 30 days.
        Set<Id> accountIds = new Set<Id>();
        for(Account acc: Trigger.new){
            accountIds.add(acc.Id);
        }

        List<Opportunity> oppListToUpdate=new List<Opportunity>();
        DateTime day30=system.now()-30;
        List<Opportunity> oppList = new List<Opportunity>([SELECT Id, AccountId, StageName, CreatedDate, CloseDate FROM Opportunity WHERE AccountId IN:accountIds]);
        if(oppList.size()>0){
            for(Opportunity opp: oppList){
                if(opp.CreatedDate<day30 && opp.StageName != 'Closed Won'){
                    opp.StageName = 'Closed Lost';
                    oppListToUpdate.add(opp);
                }
            }
        }
        if(oppListToUpdate.size() > 0){
            update oppListToUpdate;
        }
    }

    if(Trigger.isAfter && Trigger.isInsert){

        //To send the email upon Account Creation.
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        User userObj=[SELECT Id,Profile.Name,Email from User WHERE Profile.Name='System Administrator' AND FirstName = 'Jubin'];

        for(Account acc:Trigger.new){
            if(userObj.Email != null){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                //EmailTemplate template = [SELECT Id FROM EmailTemplate WHERE DeveloperName = 'Jubin Chugh' LIMIT 1];
                mail.toAddresses = new String[]{userObj.Email};
                mails.add(mail);
            }
        }

        if(mails.size()>0){
            //Messaging.SendEmailResult[] results = Messaging.sendEmail(mails);
        }

        //Contact Gets created upon account creation with the name as Account
        List<Contact> listOfContactsToBeInserted = new List<Contact>();
        Set<Account> setOfAccountToBeInserted = new Set<Account>();
        Map<Id, Account> mapVariable = new Map<Id, Account>();
        Set<Id> accId = new Set<Id>();
        for(Account acc: Trigger.new){
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = acc.Name;
            listOfContactsToBeInserted.add(con);
        }

        if(listOfContactsToBeInserted.size()>0){
            insert listOfContactsToBeInserted;
        }

    }
}