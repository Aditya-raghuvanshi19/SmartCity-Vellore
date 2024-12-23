
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


<link rel="stylesheet" type="text/css" href="../icomoon/icomoon.css">


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
                


            </div>
        </div>
    </div><!--top-content-->

    <header id="header">
        <div class="container-fluid">
            <div class="row">

                <div class="col-md-2">
                    <div class="main-logo">
                        <a href="home.jsp"><img src="../images/main-logo.png" alt="logo"></a>
                    </div>

                </div>

                <div class="col-md-10">

                    <nav id="navbar">
                        <div class="main-menu stellarnav">
                            <ul class="menu-list">

                                <c:if test="${not empty userobj}">

                                    <%
                                        User us = (User) session.getAttribute("userobj");
                                        CartDAOImpl daoy = new CartDAOImpl(DBConnect.getConn());
                                        int i = daoy.countCart(us.getId());
                                    %>

                                    <div class="d-flex align-items-center justify-content-end ">
                                        <div class="col-md-4">
                                        <a href="home.jsp" class="nav-link btn btn-outline-dark rounded-pill"> Hello Admin!</a>
                                        </div>
                                            <a href="../logout" class="nav-link btn btn-outline-dark rounded-pill"><i class="fas fa-sign-in-alt"></i> Logout</a>
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