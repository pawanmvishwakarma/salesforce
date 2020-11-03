public with sharing class TriggerDispatcher {
    public static void run(ITriggerHandler handler){
        if(!handler.isDisable('Opportunity Trigger')){
            return;
        }
        if(Trigger.isBefore && RecursiveTriggerHandler.isFirstTime){
            switch on Trigger.operationType {
                when  BEFORE_INSERT{
                    handler.beforeInsert(Trigger.new);
                }
                when BEFORE_UPDATE {
                    handler.beforeUpdate(Trigger.newMap, Trigger.oldMap); 
                }
                when BEFORE_DELETE {
                    handler.beforeDelete(Trigger.oldMap);
                }
                
            }
        }
        if(Trigger.isAfter && RecursiveTriggerHandler.isFirstTime){
            switch on Trigger.operationType {
                when AFTER_INSERT {
                    handler.afterInsert(Trigger.newMap);
                }
                when AFTER_UPDATE {
                    handler.afterUpdate(Trigger.newMap, Trigger.oldMap);
                }
                when AFTER_DELETE {
                    handler.afterDelete(Trigger.oldMap);
                }
                when AFTER_UNDELETE {
                    handler.afterDelete(Trigger.oldMap);
                }
                
            }
            RecursiveTriggerHandler.isFirstTime = false;
        }
    }
}
