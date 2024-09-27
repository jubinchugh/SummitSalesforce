public with sharing class testQueueable implements Queueable {
    public void execute(QueueableContext context){
        Account acc = new Account(Name = 'Jubin- Queue',Phone = '7357751234');
        insert acc;
    }
}