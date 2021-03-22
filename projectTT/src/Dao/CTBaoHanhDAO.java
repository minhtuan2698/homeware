package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Connection.DBConnection;
import Model.CTBaoHanh;

public class CTBaoHanhDAO {
	public static List<CTBaoHanh> listCtbh() throws SQLException {

		Connection ketNoi = DBConnection.getConnection();
		List<CTBaoHanh> dsMenu = new ArrayList<>();
		String sqlString = "select * from WarrantyDetail join StatusProduct on WarrantyDetail.ID_StatusProduct = StatusProduct.ID_StatusProduct";
		System.out.print(sqlString);

		Statement stm = ketNoi.createStatement();
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {	
			CTBaoHanh me = new CTBaoHanh(rSet.getInt(1), rSet.getInt(2), rSet.getString(4));
			dsMenu.add(me);

		}
		return dsMenu;
	}
}
