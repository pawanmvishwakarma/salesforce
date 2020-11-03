public with sharing class ContactTrigger {
    private List<Contact> allContacts = new List<Contact>();
    private List<Id> allContactsId = new List<Id>();
    private Map<Id, List<Id>> accountContactMap = new Map<Id, List<Id>>();
    private Map<Id, List<Id>> conAddMap = new Map<Id, List<Id>>();
    private List<Id> conId = new List<Id>();
    
    public ContactTrigger() {}
    
    public void getAllContactAdd(List<Contact_Address__c> addList){
        System.debug(addList);
        
        for(Contact_Address__c conadd : addList){
            if(conadd.Contact__c != null)
                conId.add(conadd.Contact__c);
        }
        this.getAccIds(conId);
    }

    private Void getAccIds(List<Id> conIds){
        List<Id> accIds = new List<Id>();
        for(Contact con : [SELECT Id, AccountId FROM Contact WHERE Id IN:conIds]){
            accIds.add(con.AccountId);
        }
        for(Contact con :[SELECT Id, Name, AccountId FROM Contact WHERE AccountId IN:accIds]){
            allContactsId.add(con.Id);
            allContacts.add(con);
        }

        this.getAccountContactMap();
        
    }

    private void getAccountContactMap(){
        System.debug('allContacts ==>>'+allContacts);
        for(Contact con :allContacts){
            List<Id> tempConList = new List<Id>();
            if (accountContactMap.containsKey(con.AccountId)) {
                tempConList = accountContactMap.get(con.AccountId);
                tempConList.add(con.Id);
                accountContactMap.put(con.AccountId, tempConList);
            }else{
                tempConList.add(con.Id);
                accountContactMap.put(con.AccountId, tempConList);
            }
        }
        System.debug('accountContactMap ==> '+accountContactMap);

        this.getConAddMap();
    } 

    private void getConAddMap(){

        for(Contact_Address__c conADD : [SELECT Id, Contact__c FROM Contact_Address__c WHERE Contact__c IN: allContactsId]){
            List<Id> tempConADD = new List<Id>();
            if (conAddMap.containsKey(conADD.Contact__c)) {
                tempConADD = conAddMap.get(conADD.Contact__c);
                tempConADD.add(conADD.Id);
                conAddMap.put(conADD.Contact__c, tempConADD);
            }else{
                tempConADD.add(conADD.Id);
                conAddMap.put(conADD.Contact__c, tempConADD);
            }
        }
        System.debug('conAddMap ==> '+conAddMap);
        this.updateAcc();
    }

    private void updateAcc(){
        List<Account> accList = new List<Account>();
        System.debug('accountContactMap.keySet() ===>> '+accountContactMap.keySet());
        System.debug('conAddMap ===>> '+conAddMap);
        for(Id accId : accountContactMap.keySet()){
            Integer addCount = 0;
            for(String conId:accountContactMap.get(accId))
            {
                System.debug('conId'+conId);
                if(conAddMap.containsKey(conId))
                {
                    addCount = addCount+conAddMap.get(conId).size();
                }
            }

            accList.add(new Account(
                id = accId,
                demoCount__c = String.valueOf(addCount)
            ));
        }
        System.debug('accList ==> '+accList);

        update accList;
    }
}
