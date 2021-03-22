package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Connection.DBConnection;
import Other.MD5;


public class ForgotPasswordDAO {
	public boolean changePassword(String emailString, String passString) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		MD5 md5 = new MD5();
		Statement statement = (Statement)ketNoi.createStatement();
		String sqlString="update Account set Password='"+md5.md5(passString)+"' where email= '"+emailString+"'";
		int result = statement.executeUpdate(sqlString);
			if (result>=0) {
				return true;
				
			}
		
		return false;
	}
	public boolean checkEmailExits(String email) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement = (Statement) ketNoi.createStatement();
		String sqString="select * from Account where email='"+email+"'";
		ResultSet resultSet= statement.executeQuery(sqString);
		if (resultSet.next()) {
			return true;
			
		}
		return false;
		
	}
}


