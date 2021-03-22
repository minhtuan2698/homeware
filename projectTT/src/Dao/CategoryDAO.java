package Dao;

import java.util.ArrayList;

import Model.Account;
import Model.Category;


public interface CategoryDAO {
	// load danh sach danh muc cha
	public ArrayList<Category> getListParentCategory();
	
	//load danh sach danh muc con
	public ArrayList<Category> getListSubCategory(String ID_Category);
	
	//lay danh sach danh muc theo list
	public ArrayList<Category> getList();
	
	public Category getIdCate(String ID_Category);
	
	public boolean checkCategory(String ID_Category);
	
	public void insertCategory(Category cate);
	
	public Category getCategory(String ID_Category);
	public void updateNameCategory(Category cate) ;
	public void deleteCategory(String ID_Category);
	
}
