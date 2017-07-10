package tlkj.util;

import java.security.MessageDigest;

public class MD5Util {
//	public final static String MD5(String s) {
//		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
//				'A', 'B', 'C', 'D', 'E', 'F' };
//
//		try {
//			byte[] btInput = s.getBytes();
//			// 获得MD5摘要算法的 MessageDigest 对象
//			MessageDigest mdInst = MessageDigest.getInstance("MD5");
//			// 使用指定的字节更新摘要
//			mdInst.update(btInput);
//			// 获得密文
//			byte[] md = mdInst.digest();
//			// 把密文转换成十六进制的字符串形式
//			int j = md.length;
//			char str[] = new char[j * 2];
//			int k = 0;
//			for (int i = 0; i < j; i++) {
//				byte byte0 = md[i];
//				str[k++] = hexDigits[byte0 >>> 4 & 0xf];
//				str[k++] = hexDigits[byte0 & 0xf];
//			}
//			return new String(str);
//		} catch (Exception e) {
//			e.printStackTrace();
//			return null;
//		}
//	}
//	
//	public static void main(String[] args) {
//		System.out.println(MD5("pddserver01"));
//	}
//	private static Logger logger = Logger.getLogger(MD5Util.class);
	 
    /***
     * MD5加密 生成32位md5码
     *
     * @return 返回32位md5码
     */
    public static String md5Encode(String inStr) throws Exception {
        MessageDigest md5 = null;
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (Exception e) {
            //logger.error(e);
            System.out.println(e.toString());
            e.printStackTrace();
            return "";
        }
 
        byte[] byteArray = inStr.getBytes("UTF-8");
        byte[] md5Bytes = md5.digest(byteArray);
        StringBuffer hexValue = new StringBuffer();
        for (int i = 0; i < md5Bytes.length; i++) {
            int val = ((int) md5Bytes[i]) & 0xff;
            if (val < 16) {
                hexValue.append("0");
            }
            hexValue.append(Integer.toHexString(val));
        }
        return hexValue.toString();
    }
 
    public static String string2MD5(String inStr) {
        MessageDigest md5 = null;
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (Exception e) {
           // logger.error(e);
            System.out.println(e.toString());
            e.printStackTrace();
            return "";
        }
        char[] charArray = inStr.toCharArray();
        byte[] byteArray = new byte[charArray.length];
 
        for (int i = 0; i < charArray.length; i++)
            byteArray[i] = (byte) charArray[i];
        byte[] md5Bytes = md5.digest(byteArray);
        StringBuffer hexValue = new StringBuffer();
        for (int i = 0; i < md5Bytes.length; i++) {
            int val = ((int) md5Bytes[i]) & 0xff;
            if (val < 16)
                hexValue.append("0");
            hexValue.append(Integer.toHexString(val));
        }
        return hexValue.toString();
 
    }
 
    /**
     * 加密解密算法 执行一次加密，两次解密
     */
    public static String convertMD5(String inStr) {
 
        char[] a = inStr.toCharArray();
        for (int i = 0; i < a.length; i++) {
            a[i] = (char) (a[i] ^ 't');
        }
        String s = new String(a);
        return s;
 
    }
 
    public static String md5Decode(String str) {
        return convertMD5(convertMD5(str));
    }
 
    // 测试主函数
    public static void main(String args[]) {
        String s = new String("123456");
        System.out.println(md5Decode("a6aeb3ffa55fc7d664406af9c3bd0f1b"));
        System.out.println("原始：" + s);
        System.out.println("MD5后：" + string2MD5(s));
        System.out.println("加密的：" + convertMD5(s));
        System.out.println("解密的：" + convertMD5(convertMD5(s)));
 
    }
}
