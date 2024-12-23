
<%@page import="com.entity.ServiceDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Article"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ServiceDAOImpl"%>
<%@page import="com.DAO.ArticleDAOImptl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User : Old Service</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<div class="container p-5">
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Title</th>
					<th scope="col">Author</th>
					<th scope="col">Description</th>
					<th scope="col">Date</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getName();
				ArticleDAOImptl dao = new ArticleDAOImptl(DBConnect.getConn());
				List<Article> list = dao.getAllArticles();
				for (Article b : list) {
				%>
				<tr>
					<td><%=b.getTitle()%></td>
					<td><%=b.getPublisher()%></td>
					<td><%=b.getDescription()%></td>
					<td><%=b.getPublished_date()%></td>
					
					<td><a
						href="delete_article?em=<%=email%>&&id=<%=b.getAid()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>
				<%
				}
				%>



			</tbody>
		</table>
	</div>


</body>
</html>
                                
                                