package days09;

import java.text.DecimalFormat;

public class FormatUtil {
	//static 메서드 선언
	public static String staticNumber(long price, String pattern) {
		
	 	DecimalFormat df = new DecimalFormat(pattern);
	 	return df.format(price);
	};
	//인스턴스 메서드 선언
	public static String instanceNumber(long price, String pattern) {
		
		DecimalFormat df = new DecimalFormat(pattern);
		return df.format(price);
	};
}
