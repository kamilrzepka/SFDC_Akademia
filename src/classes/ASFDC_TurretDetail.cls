/**
 * Created by rzepkak on 2017-08-16.
 */
public class ASFDC_TurretDetail {
 	private final ASFDC_Turret__c turret;

	public String ids {get;set;}


	public ApexPages.StandardSetController setCon{
		get{
			if (setCon == null) {
				if(ids == null) {
					setCon = new ApexPages.StandardSetController(
							Database.getQueryLocator([SELECT Id,Name,ASFDC_Tank__r.Name FROM ASFDC_Turret__c]));
				}else{
					setCon = new ApexPages.StandardSetController(
							Database.getQueryLocator([SELECT Id,Name,ASFDC_Tank__r.Name FROM ASFDC_Turret__c ]));
				}
			}
			return setCon;
		}
		set;
	}
	public ASFDC_TurretDetail(){


	}


	public List<ASFDC_Turret__c> getTurretList(){
		return (List<ASFDC_Turret__c>) setCon.getRecords();
	}
	public PageReference goDetail(){
		PageReference detailPage = Page.TurretOneDetail;
		detailPage.getParameters().put('id',ids);

		System.debug(ids);
		return detailPage;

	}

}