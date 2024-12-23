<%@page import="com.DAO.ServiceOrderDAO"%>
<%@page import="com.entity.Service_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ServiceOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Orders</h3>
	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">${succMsg}</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<div class="container-fluid">
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">User Information</th>
					<th scope="col">Service Name</th>
					<th scope="col">Price</th>
					<th scope="col">Payment type</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				ServiceOrderImpl dao = new ServiceOrderImpl(DBConnect.getConn());
				List<Service_Order> blist = dao.getAllOrder();
				for (Service_Order b : blist) {
				%>
				<tr>
					<th scope="row"><%=b.getOrderId()%></th>
					<td><%=b.getUserName()%><br><%=b.getEmail()%><br><%=b.getPhno()%><br><%=b.getFulladd()%></td>
					<td><%=b.getServiceName()%><br>Author: <%=b.getLocation()%><br>ISBN: <%=b.getPhone() %></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>
					<td><%=b.getOrderStatus()%></td>
					<td>
						<form action="order_status.jsp">
							<input type="hidden" value="<%=b.getId()%>" name="id">
							<div class="row">
								<select name="st" class="form-control form-control-sm col-md-6">
									<option>--select--</option>
									<option>Order Processing</option>
									<option>Order Recieved</option>
									<option>Order Packed</option>
									<option>Out for delivery</option>
									<option>Order delivered</option>
								</select>
								<%
								if ("Order delivered".equals(b.getOrderStatus())) {
								%>
								<button class="btn btn-sm btn-success ml-2" disabled>update</button>
								<%
								} else {
								%>
								<button class="btn btn-sm btn-primary ml-2">update</button>
								<%
								}
								%>
								
							</div>
						</form>
					</td>
				</tr>
				<%
				}
				%>



			</tbody>
		</table>
	</div>
	<div style="margin-top: 130px;">
		<%@include file="footer.jsp"%></div>

	
</body>
</html>