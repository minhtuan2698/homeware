package Other;

import java.security.MessageDigest;

public class MD5 {
	public String md5(String MD5) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(MD5.getBytes());
			byte[] b = md.digest();
			StringBuffer sb = new StringBuffer();
			for (byte x : b) {
				sb.append(Integer.toHexString(x & 0xff).toString());
			}
			return sb.toString();
		} catch (Exception e) {
			return "123";
		}

	}
	public static void main(String[] args) {
		MD5 md5 = new MD5();
		String a = md5.md5("teamvietdev.com");
		System.out.print(a);
	}
}
