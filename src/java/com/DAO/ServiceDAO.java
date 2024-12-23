package com.DAO;

import java.util.ArrayList;
import java.util.List;

import com.entity.ServiceDtls;
import com.entity.Feedback;

public interface ServiceDAO {

	public boolean addServices(ServiceDtls b);

	public List<ServiceDtls> getAllServices();

	public ServiceDtls getServiceById(int id);

	public boolean updateEditServices(ServiceDtls b);

	public boolean deleteServices(int id);

	public List<ServiceDtls> getNewService();

	public List<ServiceDtls> getRecentServices();

	public List<ServiceDtls> getOldServices();

	public List<ServiceDtls> getAllRecentService();

	public List<ServiceDtls> getAllNewService(String cat);

	public List<ServiceDtls> getAllOldService();

	public List<ServiceDtls> getServiceByOld(String email, String cate);

	public boolean oldServiceDelete(String email, String cat, int id);

	public List<ServiceDtls> getServiceBySerch(String ch);

	public List<Feedback> getAllFeedbackByService(int serviceId);

}
