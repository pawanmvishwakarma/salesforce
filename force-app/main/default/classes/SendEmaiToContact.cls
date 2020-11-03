public with sharing class SendEmaiToContact implements  Database.Batchable<sObject>{
    private Id emailTemplateId;
    public SendEmaiToContact() {
        emailTemplateId = [SELECT Id FROM EmailTemplate LIMIT 1].id;
        System.debug('Constructor exicuted');
    }

    public Database.QueryLocator start(Database.BatchableContext bc) {
       String query = '';
       DateTime DT = dateTime.now().adddays(-1);
       query = 'SELECT Id, Email FROM Contact WHERE Email != NULL AND createddate>:DT';
       return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<Contact> conList) {
        List<Messaging.singleEmailMessage> emailList = new List<Messaging.singleEmailMessage>();
        for (Contact con : conList) {
            Messaging.singleEmailMessage sendEmail = new Messaging.singleEmailMessage();
            sendEmail.setTemplateId(this.emailTemplateId);
            sendEmail.setTargetObjectId(con.Id);
            emailList.add(sendEmail);
        }
        if(emailList.size()>0){
            Messaging.sendEmail(emailList);
        }

    }

    public void finish(Database.BatchableContext bc) {}

}
