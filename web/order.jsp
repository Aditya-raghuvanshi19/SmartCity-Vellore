<%@page import="com.entity.Service_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ServiceOrderImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Service Service</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-1">

		<h3 class="text-center text-primary">Your Bookings</h3>
		<div class="card">
			<div class="card-body">
				<table class="table table-striped mt-3">
					<thead class="bg-primary text-white">
						<tr>
							<th scope="col">Order Id</th>
							<th scope="col">Name</th>
							<th scope="col">Service Name</th>
							<th scope="col">Location</th>
							<th scope="col">Phone No</th>
							<th scope="col">Price</th>
							<th scope="col">Payment Type</th>
							<th scope="col">Status</th>
						</tr>
					</thead>
					<tbody>
						<%
						User u = (User) session.getAttribute("userobj");
						ServiceOrderImpl dao = new ServiceOrderImpl(DBConnect.getConn());
						List<Service_Order> blist = dao.getService(u.getEmail());
						for (Service_Order b : blist) {
						%>
						<tr>
							<th scope="row"><%=b.getOrderId()%></th>
							<td><%=b.getUserName()%></td>
							<td><%=b.getServiceName()%></td>
							<td><%=b.getLocation()%></td>
							<td><%=b.getPhone()%></td>
							<td><%=b.getPrice()%></td>
							<td><%=b.getPaymentType()%></td>
							<td>
								<%
								if ("Order delivered".equals(b.getOrderStatus())) {
								%>
								<button class="btn btn-sm btn-success ml-2">
									<i class="fa fa-check-circle" aria-hidden="true"></i>
									<%=b.getOrderStatus()%></button> <%
 } else {
 %> <%=b.getOrderStatus()%>
							</td>
						</tr>
						<%
						}
						}
						%>




					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>