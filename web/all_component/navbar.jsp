
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ServiceDAOImpl"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid"
     style="height: 5px; background-color: #303f9f"></div>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">


<link rel="stylesheet" type="text/css" href="icomoon/icomoon.css">


<div id="header-wrap">

    <div class="top-content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6">
                    <div class="social-links">
                        <ul>
                            <li>
                                <a href="#"><i class="icon icon-faceservice"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="icon icon-twitter"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="icon icon-youtube-play"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="icon icon-behance-square"></i></a>
                            </li>
                        </ul>
                    </div><!--social-links-->
                </div>
                <br>
                <div class="col-md-6">
                    <div class="right-element">
                        <div class="action-menu d-flex align-items-center justify-content-between">
                            <!-- Search Form -->
                            <form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
                                <input class="form-control form-control-sm mr-sm-2" type="search" name="ch" placeholder="Search" aria-label="Search">
                                <button class="btn btn-primary " type="submit" style="height: min-content;">Search</button>
                            </form>

                            <!-- Settings and Contact Form -->
                            <form class="form-inline my-2 my-lg-0">
                                <a href="setting.jsp" class="btn btn-light my-2 my-sm-0">
                                    <i class="fas fa-cog"></i> Setting
                                </a>
                                <a href="helpline.jsp" class="btn btn-light my-2 my-sm-0 ml-1">
                                    <i class="fas fa-phone-square-alt"></i> Contact Us
                                </a>
                            </form>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div><!--top-content-->

    <header id="header">
        <div class="container-fluid">
            <div class="row">

                <div class="col-md-2">
                    <div class="main-logo">
                        <a href="index.jsp"><img src="images/main-logo.png" alt="logo"></a>
                    </div>

                </div>

                <div class="col-md-10">

                    <nav id="navbar">
                        <div class="main-menu stellarnav">
                            <ul class="menu-list">
                                <li class="menu-item active"><a href="index.jsp">Home</a></li>
                                <li class="menu-item has-sub">

                                <li class="nav-item dropdown"><a
                                        class="nav-link active dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false"> Categories </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item"
                                           href="all_recent_service.jsp">All</a>

                                        <%
                                            ServiceDAOImpl daox = new ServiceDAOImpl(DBConnect.getConn());
                                            List<Category> listx = daox.getAllCategory();
                                            for (Category c : listx) {
                                        %>
                                        <a class="dropdown-item"
                                           href="catogory_service.jsp?ca=<%=c.getCategoryName()%>"><%=c.getCategoryName()%></a>
                                        <%
                                            }
                                        %>

                                    </div></li>

                                <li class="nav-item">
                                    <a class="nav-link" href="catogory_service.jsp?ca=Tourism">
                                        <i class="fas fa-bus"></i>Tour Package</a></li>

                                <li class="menu-item"><a href="#latest-blog" class="nav-link mr-4">Articles</a></li>

                                <c:if test="${not empty userobj}">

                                    <%
                                        User us = (User) session.getAttribute("userobj");
                                        CartDAOImpl daoy = new CartDAOImpl(DBConnect.getConn());
                                        int i = daoy.countCart(us.getId());
                                    %>

                                    <div class="d-flex align-items-center justify-content-end pt-1">
                                        <div class="col-md-4 text-right pr-0">
                                            <span style="font-size: 24px;">(<%=i%>)</span>
                                            <a href="checkout.jsp"><i class="fas fa-cart-plus fa-2x"></i></a>
                                        </div>

                                        <li class="m-0 mx-2">
                                            <a href="#" class="nav-link btn btn-outline-dark rounded-pill"><i class="fas fa-user-plus"></i> ${userobj.name}</a>
                                        </li>

                                        <li class="m-0 mx-2">
                                            <a href="logout" class="nav-link btn btn-outline-dark rounded-pill"><i class="fas fa-sign-in-alt"></i> Logout</a>
                                        </li>
                                    </div>




                                </c:if>



                                <c:if test="${empty userobj }">

                                    <li class="menu-item"><a href="login.jsp" class="nav-link btn btn-outline-dark rounded-pill m-0">
                                            <i class="fas fa-sign-in-alt"></i> Login</a> </li>
                                    <li class="menu-item"> <a href="register.jsp"
                                                              class="nav-link btn btn-outline-dark rounded-pill m-0 "><i class="fas fa-user-plus"></i>
                                            Register</a></li>


                                </c:if>


                            </ul>

                            <div class="hamburger">
                                <span class="bar"></span>
                                <span class="bar"></span>
                                <span class="bar"></span>
                            </div>

                        </div>
                    </nav>

                </div>

            </div>
        </div>
    </header>

</div><!--header-wrap-->