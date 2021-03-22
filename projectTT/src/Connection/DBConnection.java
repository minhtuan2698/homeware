package Connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public static Connection getConnection() {
		Connection con = null;
		try {
			String url = "jdbc:sqlserver://DESKTOP-HHKGK1R\\SQLEXPRESS01:1433;databaseName=tshomeware";
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(url, "admin", "admin");
			System.out.println("Ket noi DB thanh cong");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ket noi DB that bai");
		}
		return con;
	}

	public static void main(String[] arg) {
		getConnection();
	}
}
