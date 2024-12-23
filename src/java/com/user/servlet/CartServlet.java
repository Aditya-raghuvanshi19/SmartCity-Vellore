package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.ServiceDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.ServiceDtls;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			String ca=req.getParameter("ca");
			ServiceDAOImpl dao=new ServiceDAOImpl(DBConnect.getConn());
			ServiceDtls b=dao.getServiceById(bid);
			
			Cart c=new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setServiceName(b.getServiceName());
			c.setLocation(b.getLocation());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDAOImpl dao2=new CartDAOImpl(DBConnect.getConn());
			boolean f=dao2.addCart(c);
			
			HttpSession session=req.getSession();
			
			if(f)
			{
				session.setAttribute("addCart","Service Added");
				resp.sendRedirect("view_services.jsp?bid="+bid);
				
			}else {
				session.setAttribute("failed","Something Wrong on server");
				resp.sendRedirect("view_services.jsp?bid="+bid);
			}
				
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	

}
