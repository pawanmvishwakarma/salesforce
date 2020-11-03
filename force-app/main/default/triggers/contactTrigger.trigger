trigger contactTrigger on Contact_Address__c (after insert) {
    if(Trigger.isAfter && Trigger.isinsert){
        ContactTrigger conObj = new ContactTrigger();
        conObj.getAllContactAdd(Trigger.new);
    }
}