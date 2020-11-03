public with sharing class TriggerHandler implements ITriggerHandler {
    private static TriggerHandler selfInstance = null;

    public static TriggerHandler getInstatnce(){
        if(selfInstance == null){
            selfInstance = new TriggerHandler();
        }
        return selfInstance; 
    }
    public Boolean isDisable(String handlerAPIName){
        return [SELECT isActive__C FROM Trigger_Setting__mdt WHERE Trigger_Handler_API_Name__c =: handlerAPIName LIMIT 1].isActive__C;
    }

    public void beforeInsert(List<sObject> newList){
        System.debug('Before Insert Exicute');
    }

    public void beforeUpdate(Map<Id, sObject> newItem, Map<Id, sObject> oldItem){
        System.debug('Before update Exicute');
    }

    public void beforeDelete(Map<Id, sObject> oldItem){
        System.debug('Before delete Exicute');
    }

    public void afterInsert(Map<Id, sObject> newItem){
        System.debug('After Insert Exicute');
    }

    public void afterUpdate(Map<Id, sObject> newItem, Map<Id, sObject> oldItem){
        System.debug('After update Exicute');
    }

    public void afterDelete(Map<Id, sObject> oldItem){
        System.debug('After delete Exicute');
    }

    public void afterUndelete(Map<Id, sObject> oldItem){
        System.debug('After undelete Exicute');
    }
}
