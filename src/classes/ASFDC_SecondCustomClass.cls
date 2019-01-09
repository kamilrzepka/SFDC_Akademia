/**
 * Created by rzepkak on 2017-08-09.
 */
public class ASFDC_SecondCustomClass extends ASFDC_CustomClass{

	public override void userMethod(){
		userMethod();
	}


	public class ASFDC_InnerClass implements FirstInterface,SecondInterface{

		private void innerMethod(){
			/* Nie mozna zrobic metody statycznej w klasie wewnetrznej */
		}

		public Double price() {
			return null;
		}

		public String fullName() {
			return null;
		}
	}
}