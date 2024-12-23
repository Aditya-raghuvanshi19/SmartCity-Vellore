package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Service_Order;

public class ServiceOrderImpl implements ServiceOrderDAO {

	private Connection conn;

	public ServiceOrderImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean saveOrder(List<Service_Order> blist) {
		boolean f = false;
		try {

			String sql = "insert into service_order(order_id,user_name,email,address,phno,service_name,location,price,payment,status,phone) values(?,?,?,?,?,?,?,?,?,?,?)";

			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);

			for (Service_Order b : blist) {
				ps.setString(1, b.getOrderId());
				ps.setString(2, b.getUserName());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFulladd());
				ps.setString(5, b.getPhno());
				ps.setString(6, b.getServiceName());
				ps.setString(7, b.getLocation());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPaymentType());
				ps.setString(10, "Order Processing");
				ps.setString(11, b.getPhone());
				ps.addBatch();

			}

			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean updateStatus(String st, int id) {
		boolean f = false;
		try {

			String sql = "update service_order set status=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, st);
			ps.setInt(2, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Service_Order> getService(String email) {
		List<Service_Order> list = new ArrayList<Service_Order>();
		Service_Order o = null;

		try {

			String sql = "select * from service_order where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new Service_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setServiceName(rs.getString(7));
				o.setLocation(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				o.setOrderStatus(rs.getString(11));
				o.setPhone(rs.getString(12));
				list.add(o);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Service_Order> getAllOrder() {
		List<Service_Order> list = new ArrayList<Service_Order>();
		Service_Order o = null;

		try {

			String sql = "select * from service_order ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new Service_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setServiceName(rs.getString(7));
				o.setLocation(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				o.setOrderStatus(rs.getString(11));
				o.setPhone(rs.getString(12));
				list.add(o);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
