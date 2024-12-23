<%@page import="com.entity.ServiceDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ServiceDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Services</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<h3 class="text-center">Service Review</h3>

	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">${succMsg }</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-danger">${failedMsg }</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<div class="container-fluid">
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Image</th>
					<th scope="col">Service Name</th>
					<th scope="col">Location</th>
					<th scope="col">Phone No</th>
					<th scope="col">Price</th>
					<th scope="col">Categories</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				ServiceDAOImpl dao = new ServiceDAOImpl(DBConnect.getConn());
				List<ServiceDtls> list = dao.getAllServices();
				for (ServiceDtls b : list) {
				%>
				<tr>
					<td><%=b.getServiceId()%></td>
					<td><img src="../service/<%=b.getPhotoName()%>"
						style="width: 50px; height: 50Px;"></td>
					<td><%=b.getServiceName()%></td>
					<td><%=b.getLocation()%></td>
					<td><%=b.getPhone()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getCategory()%></td>
					<td><%=b.getStatus()%></td>
					<td><a href="view_feedback.jsp?id=<%=b.getServiceId()%>"
						class="btn btn-sm btn-primary"><i class="fas fa-edit"></i>
							feedback</a></td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>
	</div>
	<div style="margin-top: 430px;">
		<%@include file="footer.jsp"%></div>
</body>
</html>