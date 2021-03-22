package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Connection.DBConnection;
import Model.Brand;
import Model.Category;


public interface BrandDAO {
	// load danh sach danh muc cha
		public ArrayList<Brand> getListParentBrand();
		
		//load danh sach danh muc con
		public ArrayList<Brand> getListSubBrand(String ID_Brand);
		
		public Brand getIdBrand(String ID_Brand);
		
		public Brand getBrand(String ID_Brand);
		public ArrayList<Brand> getListParentBrand1();
}
