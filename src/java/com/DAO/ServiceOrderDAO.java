package com.DAO;

import java.util.List;

import com.entity.Service_Order;

public interface ServiceOrderDAO {
	
	
	public boolean saveOrder(List<Service_Order> b);
	
	public List<Service_Order> getService(String email);
	
	public List<Service_Order> getAllOrder();

}
