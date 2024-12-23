<%@page import="com.entity.ServiceDtls"%>
<%@page import="com.DAO.ServiceDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Service_Order"%>
<%@page import="com.DAO.ServiceOrderImpl"%>
<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.User"%>
<%
String username1 = request.getParameter("username");
String email1 = request.getParameter("email");
String phno1 = request.getParameter("phno");
String address1 = request.getParameter("address");

User u = (User) session.getAttribute("userobj");

CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());

List<Cart> blist = dao.getServiceByUser(u.getId());

ServiceOrderImpl dao2 = new ServiceOrderImpl(DBConnect.getConn());
ServiceDAOImpl daox = new ServiceDAOImpl(DBConnect.getConn());
Service_Order o = null;

ArrayList<Service_Order> orderList = new ArrayList<Service_Order>();
Random r = new Random();
for (Cart c : blist) {
	o = new Service_Order();
	ServiceDtls b = daox.getServiceById(c.getBid());
	o.setOrderId("BOOK-ORD-00" + r.nextInt(1000));
	o.setUserName(username1);
	o.setEmail(email1);
	o.setPhno(phno1);
	o.setFulladd(address1);
	o.setServiceName(c.getServiceName());
	o.setLocation(c.getLocation());
	o.setPrice(c.getPrice() + "");
	o.setPaymentType("Online Payment");
	o.setPhone(b.getPhone());
	orderList.add(o);

}

boolean f = dao2.saveOrder(orderList);

if (f) {
	response.sendRedirect("order_success.jsp");
} else {
	session.setAttribute("failedMsg", "Your Order Failed");
	response.sendRedirect("checkout.jsp");
}
%>