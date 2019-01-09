public with sharing class ASFDC_TriggerFactory {

    public static void createAndExecuteHandler(Type handlerType) {
        ASFDC_TriggerHandler handler = getHandler(handlerType);
        handler.process();
    }

    private static ASFDC_TriggerHandler getHandler(Type handlerType) {
        Object handler = handlerType.newInstance();
        return (ASFDC_TriggerHandler) handler;
    }

}