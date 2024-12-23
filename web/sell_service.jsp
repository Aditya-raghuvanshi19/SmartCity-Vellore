<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Post Article</title>
        <%@include file="all_component/allCss.jsp"%>
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
            }
        </style>
    </head>
    <body style="background-color: #f0f1f2;">
        <c:if test="${empty userobj }">
            <c:redirect url="login.jsp" />
        </c:if>

        <%@include file="all_component/navbar.jsp"%>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card paint-card mx-auto m-4">
                        <div class="card-body">
                            <h5 class="text-center text-primary p-1">Post Article</h5>

                            <c:if test="${not empty succMsg }">
                                <p class="text-center text-success">${succMsg }</p>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>

                            <c:if test="${not empty failedMsg }">
                                <p class="text-center text-danger">${failedMsg }</p>
                                <c:remove var="failedMsg" scope="session" />
                            </c:if>

                            <form action="AddArticle" method="post" enctype="multipart/form-data">
                                <input type="hidden" value="${userobj.email}" name="user">

                                <div class="form-group">
                                    <label for="title">Title</label> 
                                    <input name="title" type="text" class="form-control" id="title">
                                </div>

                                <div class="form-group">
                                    <label for="publisher">Author Name*</label> 
                                    <input name="publisher" type="text" class="form-control" id="publisher">
                                </div>

                                <div class="form-group">
                                    <label for="description">Description</label> 
                                    <textarea name="description" class="form-control" id="description"></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="content">Content</label> 
                                    <textarea name="content" class="form-control" id="content"></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="image">Upload Photo</label> 
                                    <input name="image" type="file" class="form-control-file" id="image">
                                </div>

                                <button type="submit" class="btn btn-primary btn-block">Publish</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </body>
</html>