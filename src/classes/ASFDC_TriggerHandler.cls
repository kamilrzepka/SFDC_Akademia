public virtual class ASFDC_TriggerHandler {

	private static final String TRIGGER_HANDLER_CLASS_NAME_SUFFIX = 'Handler';

    protected virtual void onBeforeInsert(List<SObject> recordsNew) {
    }
    protected virtual void onBeforeUpdate(Map<Id, SObject> recordsOld, Map<Id, SObject> recordsNew) {
    }
    protected virtual void onBeforeDelete(Map<Id, SObject> recordsOld) {
    }

    protected virtual void onBeforeFinally(Map<Id, SObject> recordsOld, Map<Id, SObject> recordsNew) {
    }

    protected virtual void onAfterInsert(Map<Id, SObject> recordsNew) {
    }
    protected virtual void onAfterUpdate(Map<Id, SObject> recordsOld, Map<Id, SObject> recordsNew) {
    }
    protected virtual void onAfterDelete(Map<Id, SObject> recordsOld) {
    }

    protected virtual void onAfterFinally(Map<Id, SObject> recordsOld, Map<Id, SObject> recordsNew) {
    }

    public void process() {
        if (validateRun()) {
            if (Trigger.isBefore) {
                if (Trigger.isInsert) {
                    this.onBeforeInsert(Trigger.new);
                } else if (Trigger.isUpdate) {
                    this.onBeforeUpdate(Trigger.oldMap, Trigger.newMap);
                } else if (Trigger.isDelete) {
                    this.onBeforeDelete(Trigger.oldMap);
                }
            } else if (Trigger.isAfter) {
                if (Trigger.isInsert) {
                    this.onAfterInsert(Trigger.newMap);
                } else if (Trigger.isUpdate) {
                    this.onAfterUpdate(Trigger.oldMap, Trigger.newMap);
                } else if (Trigger.isDelete) {
                    this.onAfterDelete(Trigger.oldMap);
                }
            }
        }
    }

    private Boolean validateRun() {
        Boolean triggerSettingsEnabled;
        Boolean triggerExecuting;

        //trigger name = ASFDC_ContactTrigger
        //trigger handler name = ASFDC_ContactTriggerHandler

        String triggerName = String.valueOf(this).substring(0, String.valueOf(this).indexOf(':')).replace(TRIGGER_HANDLER_CLASS_NAME_SUFFIX, '');

        // check ASFDC_Triggers__c Custom Setting
//        triggerSettingsEnabled = ASFDC_Triggers__c.getValues(triggerName).Enable__c;

        // check if Trigger is being executed
        triggerExecuting = Trigger.isExecuting;

        return triggerSettingsEnabled
                && triggerExecuting;
    }

}