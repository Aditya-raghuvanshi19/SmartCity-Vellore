<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ServiceOrderImpl"%>
<%
	String st = request.getParameter("st");
	if (st != null) {
		int id = Integer.parseInt(request.getParameter("id"));
		ServiceOrderImpl dao2 = new ServiceOrderImpl(DBConnect.getConn());
		boolean f = dao2.updateStatus(st, id);
		if (f) {
			session.setAttribute("succMsg", "order status updated");
			response.sendRedirect("orders.jsp");
		}
	}
	%>