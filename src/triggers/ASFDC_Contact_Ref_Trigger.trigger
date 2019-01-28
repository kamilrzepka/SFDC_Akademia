trigger ASFDC_Contact_Ref_Trigger on Contact(after insert,after update) {

	if(MonitorTriggerClass.bolFlag.contains('ASFDC_Contact_Ref_Trigger'))
	return;
	MonitorTriggerClass.bolFlag.add('ASFDC_Contact_Ref_Trigger');

	Map <Id,Contact> clearContact = new Map<Id, Contact>([SELECT Id, Ref_Contact__c FROM Contact WHERE Ref_Contact__c =: Trigger.newMap.keySet()]);
	for(Contact c : clearContact.values()){
		c.Ref_Contact__c = null;
	}



	List<Id> contactIds = new List<Id>();
	for (Contact c : Trigger.new){
		if (c.Ref_Contact__c != null){
			contactIds.add (c.Ref_Contact__c);
			System.debug('wszło');
		}
	}

	Map<id, Contact> contacts = new Map<id, Contact>([SELECT Id FROM Contact WHERE id =: contactIds]);

	for (Contact c : Trigger.new){
		if (c.Ref_Contact__c != null && contacts.get(c.Ref_Contact__c) != null){
			contacts.get(c.Ref_Contact__c).Ref_Contact__c = c.id;
			clearContact.remove(c.Ref_Contact__c);
			System.debug('wszlo2');
		}

	}

	List<Contact> allContacts = new List<Contact>();
	allContacts.addAll(clearContact.values());
	allContacts.addAll(contacts.values());
//test jenkins test
	update allContacts;
}
