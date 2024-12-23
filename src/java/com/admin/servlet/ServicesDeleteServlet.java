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

@WebServlet("/delete")
public class ServicesDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));

			ServiceDAOImpl dao = new ServiceDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteServices(id);
			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Service Delete Successfully..");
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
