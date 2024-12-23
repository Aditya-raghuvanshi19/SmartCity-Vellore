package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.ServiceDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete_old_service")
public class DeleteOldService extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String em = req.getParameter("em");
			int id=Integer.parseInt(req.getParameter("id"));
			
			
			ServiceDAOImpl dao = new ServiceDAOImpl(DBConnect.getConn());

			boolean f = dao.oldServiceDelete(em, "Old",id);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Old Service Delete Sucessfully");
				resp.sendRedirect("old_service.jsp");
			} else {
				session.setAttribute("succMsg", "Something wrong on server");
				resp.sendRedirect("old_service.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
