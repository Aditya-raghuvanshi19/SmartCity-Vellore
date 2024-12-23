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

.paint-card {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			ServiceDAOImpl dao = new ServiceDAOImpl(DBConnect.getConn());
			List<ServiceDtls> list = dao.getAllOldService();
			for (ServiceDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho paint-card">
					<div class="card-body text-center">
						<img alt="" src="service/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px" class="img-thumblin">
						<p><%=b.getServiceName()%></p>
						<p><%=b.getLocation()%></p>
						<p>
							Categories:<%=b.getCategory()%></p>
						<div class="row">
							<a href="view_services.jsp?bid=<%=b.getServiceId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fas fa-rupee-sign"></i></a>
						</div>
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