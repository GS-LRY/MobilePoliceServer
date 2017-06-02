package tlkj.test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TestLocal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//System.out.println(formatter.format(new Date()));
		Calendar calendar=Calendar.getInstance();
		calendar.set(2017, 5, 24, 12, 13,49);
		Date d1 = calendar.getTime();
		System.out.println(d1.getTime());
		calendar.set(2017, 5, 24, 12, 15,49);
		Date d2 = calendar.getTime();
		System.out.println(d2.getTime());
		long seconds = d2.getTime() - d1.getTime();
		System.out.println(seconds/(60*1000));
		
	}

}
