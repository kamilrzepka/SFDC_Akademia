/**
 * Created by rzepkak on 2017-08-23.
 */
public class ASFDC_ContactTriggerHandler extends ASFDC_TriggerHandler {

	protected override void onAfterInsert(Map<Id,sObject> recordsNew){

		Messaging.reserveSingleEmailCapacity(2);

		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		String[] toAddresses = new String[] {'kamil.rzepka93@gmail.com'};
		String[] ccAddresses = new String[] {'rudini931@gmail.com'};

		mail.setToAddresses(toAddresses);
		mail.setCcAddresses(ccAddresses);

		mail.setSenderDisplayName('Sales Support');

		mail.setSubject('New Contact Created : ' + Contact.Id);

		mail.setBccSender(false);

		mail.setPlainTextBody('Your Contact was created: '+ Contact.Id+' On day: ' +Contact.CreatedDate+ '.');

		mail.setHtmlBody('<p>Your Contact was created: <b>'+ Contact.Id+'</b> On day: <b>' +Contact.CreatedDate+ '</b>.</p>'+
		'To view click <a href=https://rzepkakamil-dev-ed.my.salesforce.com/'+Contact.Id+'>here.</a>');

		Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});

	}

}