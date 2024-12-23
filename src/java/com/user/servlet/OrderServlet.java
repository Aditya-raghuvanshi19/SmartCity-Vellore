package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.ServiceDAOImpl;
import com.DAO.ServiceOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.ServiceDtls;
import com.entity.Service_Order;
import com.entity.Cart;
import com.mysql.cj.Session;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			HttpSession session = req.getSession();

			int id = Integer.parseInt(req.getParameter("id"));

			String name = req.getParameter("username");

			String email = req.getParameter("email");

			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");
			String totalPrice = req.getParameter("totalPrice");
			String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pincode;
			if ("COD".equals(paymentType)) {

				/* System.out.println(name+" "+email+" "+phno+" "+fullAdd+" "+paymentType); */

				CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
				ServiceDAOImpl daox=new ServiceDAOImpl(DBConnect.getConn());
				List<Cart> blist = dao.getServiceByUser(id);

				if (blist.isEmpty()) {
					session.setAttribute("failedMsg", "Add Item");
					resp.sendRedirect("checkout.jsp");
				} else {
					ServiceOrderImpl dao2 = new ServiceOrderImpl(DBConnect.getConn());

					Service_Order o = null;

					ArrayList<Service_Order> orderList = new ArrayList<Service_Order>();
					Random r = new Random();
					for (Cart c : blist) {
						o = new Service_Order();
						ServiceDtls b=daox.getServiceById(c.getBid());
						o.setOrderId("BOOK-ORD-00" + r.nextInt(1000));
						o.setUserName(name);
						o.setEmail(email);
						o.setPhno(phno);
						o.setFulladd(fullAdd);
						o.setServiceName(c.getServiceName());
						o.setLocation(c.getLocation());
						o.setPrice(c.getPrice() + "");
						o.setPaymentType("COD");
						o.setPhone(b.getPhone());
						orderList.add(o);

					}

					if ("noselect".equals(paymentType)) {
						session.setAttribute("failedMsg", "Choose Payment Method");
						resp.sendRedirect("checkout.jsp");
					} else {
						boolean f = dao2.saveOrder(orderList);

						if (f) {
							resp.sendRedirect("order_success.jsp");
						} else {
							session.setAttribute("failedMsg", "Your Order Failed");
							resp.sendRedirect("checkout.jsp");
						}
					}
				}
			} else if ("noselect".equals(paymentType)) {
				session.setAttribute("failedMsg", "Choose Payment Method");
				resp.sendRedirect("checkout.jsp");
			}

			else {
				resp.sendRedirect("cardpayment.jsp?un=" + name + "&&em=" + email + "&&ph=" + phno + "&&ad=" + fullAdd
						+ "&&ta=" + totalPrice);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
