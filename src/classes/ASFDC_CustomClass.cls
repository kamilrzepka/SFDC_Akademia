/**
 * Created by rzepkak on 2017-08-09.
 */
public virtual class ASFDC_CustomClass {
	private Integer numberZmienna = 0;
	private static Integer phone = 0;
	public final static Integer slot = 0;

	public static void metoda2(){
		/* Code */
	}
	protected void metoda(){
		System.debug('Somethink');
	}
	public virtual void userMethod(){
		System.debug(System.UserInfo.getFirstName()+' '+System.UserInfo.getLastName());
	}
}