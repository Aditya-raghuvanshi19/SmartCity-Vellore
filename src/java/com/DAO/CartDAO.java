package com.DAO;

import java.util.List;

import com.entity.ServiceDtls;
import com.entity.Cart;

public interface CartDAO {
	
	public boolean addCart(Cart c);
	
	public List<Cart> getServiceByUser(int userId);
	
	public boolean deleteService(int bid,int uid,int cid);
	
	

}
