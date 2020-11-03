public with sharing class AccountManager {
   
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(Integer numberOfRecord){
        List<Account> accountList = new List<Account>();
        if(numberOfRecord>0){
            accountList = [SELECT Id, Name, Phone, Website FROM Account LIMIT: numberOfRecord];
            return accountList;
        }
        return accountList;
    }
}