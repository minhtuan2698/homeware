package Dao;

import java.util.ArrayList;

import Model.Brand;
import Model.ImageDetail;


public interface ImageDetailDAO {
	public ImageDetail getImageDetail(String ID_Product);
	public ArrayList<ImageDetail> getListImageDetail(int ID_Image);
	public ArrayList<ImageDetail> getListParentImageDetail();
	public ImageDetail getIdImage(String ID_Product);

}
