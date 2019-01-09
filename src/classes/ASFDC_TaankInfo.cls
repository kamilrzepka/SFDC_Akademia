/**
 * Created by rzepkak on 2017-08-11.
 */
public class ASFDC_TaankInfo {


	//w dół
	public static List<ASFDC_Turret__c> getTurretInfo(String tankName){
		ASFDC_Tank__c tur = [SELECT Name,Id, (SELECT Name,Id FROM ASFDC_Turret__r) FROM ASFDC_Tank__c WHERE Name =: tankName];
		System.debug(tur.ASFDC_Turret__r);
		return tur.ASFDC_Turret__r;
	}
	//w górę
	public  static  ASFDC_Tank__c getTankInfo(String turretName){
		ASFDC_Turret__c tank = [SELECT Name, ASFDC_Tank__r.Name FROM ASFDC_Turret__c WHERE Name =: turretName Limit 1];
		System.debug(tank.ASFDC_Tank__r);
		return tank.ASFDC_Tank__r;
	}
	public static  List<ASFDC_Gun__c> getGunsInfo(String tankName){
		List<ASFDC_Gun__c> tank = [SELECT Name,ASFDC_Turret_del__r.ASFDC_Tank__r.Name FROM ASFDC_Gun__c WHERE ASFDC_Turret_del__r.ASFDC_Tank__r.Name =: tankName];
		System.debug(tank);
		return tank;
	}
	public static  ASFDC_Tank__c getTankGunInfo(String gunName){
		ASFDC_Gun__c tank = [SELECT Name,Id, ASFDC_Turret_del__r.ASFDC_Tank__r.Name FROM ASFDC_Gun__c WHERE Name =: gunName];
		System.debug(tank.ASFDC_Turret_del__r.ASFDC_Tank__r);
		return tank.ASFDC_Turret_del__r.ASFDC_Tank__r;
	}

}