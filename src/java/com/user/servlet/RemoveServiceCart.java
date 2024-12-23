package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

@WebServlet("/remove_service")
public class RemoveServiceCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bid=Integer.parseInt(req.getParameter("bid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		int cid=Integer.parseInt(req.getParameter("cid"));
		 CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
		 boolean f=dao.deleteService(bid,uid,cid);
		 HttpSession session=req.getSession();
		 
		 
		 if(f)
		 {
			 session.setAttribute("succMsg","Service Removed from Cart");
			 resp.sendRedirect("checkout.jsp");
		 }else {
			 session.setAttribute("failedMsg","Something wrong on server");
			 resp.sendRedirect("checkout.jsp");
		 }
		
	}

	
	
	
}
