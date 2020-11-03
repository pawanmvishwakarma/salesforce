trigger OpportunityTrigger on Opportunity (before insert, before update, after insert, after update) {
    TriggerDispatcher.run(TriggerHandler.getInstatnce());
}