public with sharing class ContactController {
    @AuraEnabled(cacheable = True)
    public static List<Contact> getContactsBornAfter(Date birthDate){
        return [
            SELECT Name, Title, Email, Phone
            FROM Contact
            WHERE Birthdate > :birthDate
            WITH SECURITY_ENFORCED
       ];
    }

    @AuraEnabled(cacheable = True)
    public static List<Contact> getContacts(){
        return [
            SELECT FirstName, LastName, Email
            FROM Contact
            WITH SECURITY_ENFORCED
       ];
    }
}