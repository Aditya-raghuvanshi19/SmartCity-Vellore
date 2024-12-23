package com.admin.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.ServiceDAOImpl;
import com.DB.DBConnect;
import com.entity.ServiceDtls;

@WebServlet("/editservices")
public class EditServicesServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String serviceName = req.getParameter("bname");
			String location = req.getParameter("location");
			String price = req.getParameter("price");
			String status = req.getParameter("status");
			String category = req.getParameter("categories");
			String phone = req.getParameter("phone");
			
			ServiceDtls b = new ServiceDtls();
			b.setServiceId(id);
			b.setServiceName(serviceName);
			b.setLocation(location);
			b.setPrice(price);
			b.setStatus(status);
			b.setCategory(category);
			b.setPhone(phone);

			ServiceDAOImpl dao = new ServiceDAOImpl(DBConnect.getConn());
			boolean f = dao.updateEditServices(b);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Service Updated Successfully..");
				resp.sendRedirect("admin/all_services.jsp");
			} else {
				session.setAttribute("failedMsg", "Something wrong on server");
				resp.sendRedirect("admin/all_services.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
