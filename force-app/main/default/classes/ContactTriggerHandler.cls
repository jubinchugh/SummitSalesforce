public without sharing class ContactTriggerHandler implements TriggerHandler {
    private boolean triggerIsExecuting;
    private integer triggerSize;
    public ContactTriggerHelper helper;
    public ContactTriggerHandler(boolean triggerIsExecuting, integer triggerSize) {
        this.triggerIsExecuting = triggerIsExecuting;
        this.triggerSize = triggerSize;
        this.helper = new ContactTriggerHelper();
    }
    public void beforeInsert(List<Contact> newContacts) {
        helper.firstLastNameDissimilarity(newContacts);
        // helper.doTask2();
    }
    public void beforeUpdate(List<Contact> oldContacts, List<Contact> newContacts, Map<ID, SObject> oldContactMap, Map<ID, SObject> newContactMap) {
        // helper.doTask3();
        // helper.doTask4();
    }
    public void beforeDelete(List<Contact> oldContacts, Map<ID, SObject> oldContactMap) {
        // helper.doTask5();
        // helper.doTask1();
    }
    public void afterInsert(List<Contact> newContacts, Map<ID, SObject> newContactMap) {
        // helper.doTask2();
        // helper.doTask3();
    }
    public void afterUpdate(List<Contact> oldContacts, List<Contact> newContacts, Map<ID, SObject> oldContactMap, Map<ID, SObject> newContactMap) {
        // helper.doTask4();
        // helper.doTask5();
    }
    public void afterDelete(List<Contact> oldContacts, Map<ID, SObject> oldContactMap) {
        // helper.doTask3();
        // helper.doTask1();
    }
    public void afterUndelete(List<Contact> newContacts, Map<ID, SObject> newContactMap) {
        // helper.doTask4();
        // helper.doTask2();
    }
}