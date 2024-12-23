<%@page import="com.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.ServiceDtls"%>
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
<title>Admin: Edit Sevice</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	<div class="caontainer">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Service</h4>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						ServiceDAOImpl dao = new ServiceDAOImpl(DBConnect.getConn());
						ServiceDtls b = dao.getServiceById(id);
						%>

						<form action="../editservices" method="post">
							<input type="hidden" name="id" value="<%=b.getServiceId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Service Name*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getServiceName()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Location*</label> <input
									name="location" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getLocation()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number*</label> <input
									name="phone" type="text" class="form-control"
									value="<%=b.getPhone()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1" value="<%=b.getPrice()%>">
							</div>


							<div class="form-group">
								<label for="inputState">Service Categories</label> <select
									id="inputState" name="categories" class="form-control">
									<option><%=b.getCategory()%></option>
									<%
									List<Category> list = dao.getAllCategory();
									for (Category c : list) {
									%>
									<option value="<%=c.getCategoryName()%>"><%=c.getCategoryName()%></option>
									<%
									}
									%>

								</select>
							</div>

							<div class="form-group">
								<label for="inputState">Service Status</label> <select
									id="inputState" name="status" class="form-control">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>
								</select>
							</div>
							<button class="w-100 btn btn-primary" type="submit" class="btn btn-primary">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>

	</div>

	<div style="margin-top: 40px;">
		<%@include file="footer.jsp"%></div>
</body>
</html>