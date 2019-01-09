/**
 * Created by rzepkak on 2017-08-17.
 */
public class ASFDC_TurretOneDetail {

	public String turretId = ApexPages.currentPage().getParameters().get('id');
	public String gunId {get;set;}
	public List<ASFDC_Gun__c> turretListRelated;

	public List<ASFDC_Gun__c> getRelatedList(){
		turretListRelated = [SELECT Name FROM ASFDC_Gun__c WHERE ASFDC_Turret_del__c =: turretId] ;
		return turretListRelated;
	}


	public ApexPages.StandardSetController setCon{
		get{
			if (setCon == null) {
				if(turretId == null) {

				}else{
					setCon = new ApexPages.StandardSetController(
							Database.getQueryLocator([SELECT Id,Name,ASFDC_Tank__r.Name  FROM ASFDC_Turret__c WHERE Id =: turretId ]));

													}
			}
			return setCon;
		}
		set;
	}

	public List<ASFDC_Turret__c> getTurretList(){
		return (List<ASFDC_Turret__c>) setCon.getRecords();
	}

}