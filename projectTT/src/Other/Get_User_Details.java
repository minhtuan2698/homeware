package Other;

import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Version;
import com.restfb.types.User;

import Model.Account;

public class Get_User_Details {

	public Account Get_Profile_info(String accesstoken) {
		
		Account obj_User_Profile=new Account();
		
		FacebookClient facebookClient = new DefaultFacebookClient(accesstoken, Version.VERSION_2_6);
			
		User user = facebookClient.fetchObject("me", User.class);
		 

		System.out.println("User name: " + user.getName());
		 
		obj_User_Profile.setUsername(user.getName());
		
		return obj_User_Profile;

	}

}
