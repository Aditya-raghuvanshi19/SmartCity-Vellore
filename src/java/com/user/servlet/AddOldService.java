package com.user.servlet;

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

@WebServlet("/add_old_service")
@MultipartConfig
public class AddOldService extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String serviceName = req.getParameter("bname");
			String location = req.getParameter("location");
			String price = req.getParameter("price");
			String categories = "Old";
			String status = "Active";
			Part part = req.getPart("image");
			String fileName = part.getSubmittedFileName();
			String phone = req.getParameter("phone");
			String useremail = req.getParameter("user");

			ServiceDtls b = new ServiceDtls(serviceName, location, price, categories, status, fileName, useremail, phone);

			ServiceDAOImpl dao = new ServiceDAOImpl(DBConnect.getConn());

			boolean f = dao.addServices(b);

			HttpSession session = req.getSession();

			if (f) {

				String path = getServletContext().getRealPath("") + "service";

				File file = new File(path);

				part.write(path + File.separator + fileName);

				session.setAttribute("succMsg", "Service Add Sucessfully");
				resp.sendRedirect("sell_service.jsp");

			} else {
				session.setAttribute("failedMsg", "Something wrong on Server");
				resp.sendRedirect("sell_service.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
