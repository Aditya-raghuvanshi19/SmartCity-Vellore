package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.ServiceDtls;
import com.entity.Category;
import com.entity.Feedback;

public class ServiceDAOImpl implements ServiceDAO {

	private Connection conn;

	public ServiceDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

        @Override
	public boolean addServices(ServiceDtls b) {
		boolean f = false;
		try {
			String sql = "insert into service_dtls(servicename,location,price,category,status,photo,email,phone) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getServiceName());
			ps.setString(2, b.getLocation());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());
			ps.setString(8, b.getPhone());
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

        @Override
	public List<ServiceDtls> getAllServices() {

		List<ServiceDtls> list = new ArrayList<ServiceDtls>();
		ServiceDtls b = null;

		try {
			String sql = "select * from service_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new ServiceDtls();
				b.setServiceId(rs.getInt(1));
				b.setServiceName(rs.getString(2));
				b.setLocation(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setPhone(rs.getString(9));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public ServiceDtls getServiceById(int id) {

		ServiceDtls b = null;
		try {
			String sql = "select * from service_dtls where serviceId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new ServiceDtls();
				b.setServiceId(rs.getInt(1));
				b.setServiceName(rs.getString(2));
				b.setLocation(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setPhone(rs.getString(9));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	public boolean updateEditServices(ServiceDtls b) {
		boolean f = false;
		try {
			String sql = "update service_dtls set servicename=?,location=?,price=?,category=?,status=?,phone=? where serviceId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getServiceName());
			ps.setString(2, b.getLocation());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getCategory());
			ps.setString(5, b.getStatus());
			ps.setInt(7, b.getServiceId());
			ps.setString(6, b.getPhone());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteServices(int id) {
		boolean f = false;
		try {
			String sql = "delete from service_dtls where serviceId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<ServiceDtls> getNewService() {

		List<ServiceDtls> list = new ArrayList<ServiceDtls>();
		ServiceDtls b = null;
		try {
			String sql = "select * from service_dtls where category=? and status=? order by serviceId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new ServiceDtls();
				b.setServiceId(rs.getInt(1));
				b.setServiceName(rs.getString(2));
				b.setLocation(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setPhone(rs.getString(9));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<ServiceDtls> getRecentServices() {
		List<ServiceDtls> list = new ArrayList<ServiceDtls>();
		ServiceDtls b = null;
		try {
			String sql = "select * from service_dtls where status=? order by serviceId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new ServiceDtls();
				b.setServiceId(rs.getInt(1));
				b.setServiceName(rs.getString(2));
				b.setLocation(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setPhone(rs.getString(9));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<ServiceDtls> getOldServices() {
		List<ServiceDtls> list = new ArrayList<ServiceDtls>();
		ServiceDtls b = null;
		try {
			String sql = "select * from service_dtls where category=? and status=? order by serviceId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new ServiceDtls();
				b.setServiceId(rs.getInt(1));
				b.setServiceName(rs.getString(2));
				b.setLocation(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setPhone(rs.getString(9));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<ServiceDtls> getAllRecentService() {
		List<ServiceDtls> list = new ArrayList<ServiceDtls>();
		ServiceDtls b = null;
		try {
			String sql = "select * from service_dtls where status=? order by serviceId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new ServiceDtls();
				b.setServiceId(rs.getInt(1));
				b.setServiceName(rs.getString(2));
				b.setLocation(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setPhone(rs.getString(9));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<ServiceDtls> getAllNewService(String cat) {
		List<ServiceDtls> list = new ArrayList<ServiceDtls>();
		ServiceDtls b = null;
		try {
			String sql = "select * from service_dtls where category=? and status=? order by serviceId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new ServiceDtls();
				b.setServiceId(rs.getInt(1));
				b.setServiceName(rs.getString(2));
				b.setLocation(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setPhone(rs.getString(9));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<ServiceDtls> getAllOldService() {
		List<ServiceDtls> list = new ArrayList<ServiceDtls>();
		ServiceDtls b = null;
		try {
			String sql = "select * from service_dtls where category=? and status=? order by serviceId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new ServiceDtls();
				b.setServiceId(rs.getInt(1));
				b.setServiceName(rs.getString(2));
				b.setLocation(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setPhone(rs.getString(9));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<ServiceDtls> getServiceByOld(String email, String cate) {

		List<ServiceDtls> list = new ArrayList<ServiceDtls>();
		ServiceDtls b = null;
		try {

			String sql = "select * from service_dtls where category=? and email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new ServiceDtls();
				b.setServiceId(rs.getInt(1));
				b.setServiceName(rs.getString(2));
				b.setLocation(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setPhone(rs.getString(9));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	public boolean oldServiceDelete(String email, String cat, int id) {
		boolean f = false;
		try {
			String sql = "delete from service_dtls where category=? and email=? and serviceId=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, email);
			ps.setInt(3, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<ServiceDtls> getServiceBySerch(String ch) {

		List<ServiceDtls> list = new ArrayList<ServiceDtls>();
		ServiceDtls b = null;
		try {

			String sql = "select * from service_dtls where servicename like ? or location like ? or category like ? and status=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + ch + "%");
			ps.setString(2, "%" + ch + "%");
			ps.setString(3, "%" + ch + "%");
			ps.setString(4, "Active");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new ServiceDtls();
				b.setServiceId(rs.getInt(1));
				b.setServiceName(rs.getString(2));
				b.setLocation(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean addCategory(String categoryName) {
		boolean f = false;
		try {
			String sql = "insert into category(name) values(?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, categoryName);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Category> getAllCategory() {
		List<Category> list = new ArrayList<Category>();
		Category ca = null;
		try {
			String sql = "select * from category";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ca = new Category(rs.getInt(1), rs.getString(2));
				list.add(ca);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Feedback> getAllFeedbackByService(int serviceId) {
		List<Feedback> list = new ArrayList<Feedback>();
		Feedback f = null;
		try {

			String sql = "select * from feedback where serviceId=? order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, serviceId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = new Feedback(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4));
				list.add(f);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
