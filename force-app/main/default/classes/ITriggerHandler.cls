public interface ITriggerHandler {
    
    void beforeInsert(List<sObject> newList);

    void beforeUpdate(Map<Id, sObject> newItem, Map<Id, sObject> oldItem);

    void beforeDelete(Map<Id, sObject> oldItem);

    void afterInsert(Map<Id, sObject> newItem);

    void afterUpdate(Map<Id, sObject> newItem, Map<Id, sObject> oldItem);

    void afterDelete(Map<Id, sObject> oldItem);

    void afterUndelete(Map<Id, sObject> oldItem);

    Boolean isDisable(String handlerName);
}
