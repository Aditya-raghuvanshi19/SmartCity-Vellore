package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import com.DAO.ServiceDAOImpl;
import com.DB.DBConnect;
import com.entity.ServiceDtls;

@WebServlet("/add_services")
@MultipartConfig
public class ServicesAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String serviceName = req.getParameter("bname");
			String location = req.getParameter("location");
			String price = req.getParameter("price");
			String categories = req.getParameter("categories");
			String status = req.getParameter("status");
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			String phone = req.getParameter("phone");
			ServiceDtls b = new ServiceDtls(serviceName, location, price, categories, status, fileName, "admin", phone);

			ServiceDAOImpl dao = new ServiceDAOImpl(DBConnect.getConn());
			HttpSession session = req.getSession();
			if (fileName.endsWith(".jpg") || fileName.endsWith(".png")) {
				boolean f = dao.addServices(b);

				if (f) {

					String path = getServletContext().getRealPath("") + "service";

					File file = new File(path);

					part.write(path + File.separator + fileName);

					session.setAttribute("succMsg", "Service Addded Sucessfully");
					resp.sendRedirect("admin/add_services.jsp");

				} else {
					session.setAttribute("failedMsg", "Something wrong on Server");
					resp.sendRedirect("admin/add_services.jsp");
				}
			} else {
				session.setAttribute("failedMsg", "invalid format!! please add jpg or png file");
				resp.sendRedirect("admin/add_services.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
