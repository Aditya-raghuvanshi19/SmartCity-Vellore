package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.Feedback;

@WebServlet("/saveFeedback")
public class SaveFeedback extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int uid = Integer.parseInt(req.getParameter("uid"));
		int bid = Integer.parseInt(req.getParameter("bid"));
		String comment = req.getParameter("comment");

		Feedback f = new Feedback(bid, uid, comment);

		UserDAO dao = new UserDAOImpl(DBConnect.getConn());

		boolean fa = dao.saveFeedback(f);

		HttpSession session = req.getSession();

		if (fa) {
			session.setAttribute("succMsg", "feedback success");
		} else {
			session.setAttribute("succMsg", "something error in server");
		}
		resp.sendRedirect("view_services.jsp?bid=" + bid);

	}

}
