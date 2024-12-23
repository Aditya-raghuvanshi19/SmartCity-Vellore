<%@page import="com.entity.User"%>
<%@page import="com.entity.ServiceDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ServiceDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Services</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body>
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			String ch = request.getParameter("ch");
			ServiceDAOImpl dao2 = new ServiceDAOImpl(DBConnect.getConn());
			List<ServiceDtls> list2 = dao2.getServiceBySerch(ch);
			for (ServiceDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="service/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px" class="img-thumblin">
						<p><%=b.getServiceName()%></p>
						<p><%=b.getLocation()%></p>
						<p>

							<%
							if (b.getCategory().equals("Old")) {
							%>
							Categories:<%=b.getCategory()%></p>
						<div class="row">
							<a href="view_services.jsp?bid=<%=b.getServiceId()%>"
								class="btn btn-success btn-sm m-0">View Details</a> <a href=""
								class="btn btn-danger btn-sm mt-1"><%=b.getPrice()%><i
								class="fas fa-rupee-sign"></i></a>
						</div>
						<%
						} else {
						%>
						Categories:<%=b.getCategory()%></p>
						<div class="row">

						
							<a href="view_services.jsp?bid=<%=b.getServiceId()%>"
								class="btn btn-success btn-sm m-0">View Details</a> <a href=""
								class="btn btn-danger btn-sm mt-1"><%=b.getPrice()%><i
								class="fas fa-rupee-sign"></i></a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>