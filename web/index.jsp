<%@page import="com.entity.User"%>
<%@page import="com.entity.ServiceDtls"%>
<%@page import="com.entity.Article"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.ServiceDAOImpl"%>
<%@page import="com.DAO.ArticleDAOImptl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Vellore</title>
        <%@include file="all_component/allCss.jsp"%>
        <style type="text/css">
            .back-img {
                background: linear-gradient(rgba(0, 0, 0, .1), rgba(0, 0, 0, .1)),
                    url("img/b.jpg");
                height: 50vh;
                width: 100%;
                background-size: cover;
                background-repeat: no-repeat;
            }

            .crd-ho:hover {
                background-color: #fcf7f7;
            }

            .paint-card {
                box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7;">

        <%
            User u = (User) session.getAttribute("userobj");
        %>

        <%@include file="all_component/navbar.jsp"%>

    <body data-bs-spy="scroll" data-bs-target="#header" tabindex="0">

        <section id="billboard">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="main-slider pattern-overlay">
                            <div class="slider-item">
                                <div class="banner-content">
                                    <h2 class="banner-title">Welcome to Smart City Vellore</h2>
                                    <h3>
                                        Innovation for a Better Future 
                                    </h3>
                                    <p>Vellore is evolving into a smart, sustainable city with digital solutions that improve everyday life. Vellore is creating a future where growth and environmental care go hand in hand. our city is leading the way in urban transformation.</p>
                                    <div class="btn-wrap">
                                        <a href="#" class="btn btn-outline-accent btn-accent-arrow">Let's Explore!<i
                                                class="icon icon-ns-arrow-right"></i></a>
                                    </div>
                                </div><!--banner-content-->
                                <img class="w-50 h-auto" src="images/main-banner1.jpg" alt="banner" class="banner-image">
                            </div><!--slider-item-->
                        </div><!--slider-->
                    </div>
                </div>
            </div>
        </section>

        <section class="mb-2" >
            <div style="object-fit: cover; object-fit: contain;">
                <div class="row">
                    <div>
                        <img src ="images/vellore_fort.jpg" width="100%" />
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="bg-secondary d-flex justify-content-center align-items-center text-center mb-4" style="height: 5rem">
                <h2 class="text-white">Vellore Provides</h2>
            </div>

        </section>
        <section>
            <div class="container">

                <h3 class="text-center">Latest Services</h3>
                <div class="row">
                    <%                  ServiceDAOImpl dao2 = new ServiceDAOImpl(DBConnect.getConn());
                        List<ServiceDtls> list2 = dao2.getRecentServices();
                        for (ServiceDtls b : list2) {
                    %>
                    <div class="col-md-4">
                        <div class="card crd-ho paint-card">
                            <div class="card-body text-center">
                                <img alt="" src="service/<%=b.getPhotoName()%>"
                                     style="width: 150px; height: 200px" class="img-thumblin">
                                <p><%=b.getServiceName()%></p>
                                <p style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width: 375px;"><%=b.getLocation()%></p>
                                <p>
                                    Categories:<%=b.getCategory()%></p>
                                <div class="row">
                                    <a id="but" href="view_services.jsp?bid=<%=b.getServiceId()%>"
                                       class="btn btn-success btn-sm ">
                                        <% if(b.getCategory().equals("Tourism")){
                                            out.print("Book Now");
                                            }else{
                                            out.print("View Details");
                                            }
                                        %>
                                        
                                    </a> 
                                        
                                    <a href="view_services.jsp?bid=<%=b.getServiceId()%>" class="btn btn-danger btn-sm ">
                                        <i class="fas fa-rupee-sign"></i><%=b.getPrice()%>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
                <div class="text-center mt-1">
                    <a href="all_recent_service.jsp"
                       class="btn btn-danger btn-sm text-white">View All</a>
                </div>
            </div>
        </section>
        <!------ Include the above in your HEAD tag ---------->

        <!-- Team -->
        <section id="team" class="pb-5">
            <div class="container">
                <h5 class="section-title h1">SMART CITY SERVICES</h5>
                <div class="row">
                    <!-- Team member -->
                    <div class="col-xs-12 col-sm-6 col-md-4">
                        <div class="image-flip" >
                            <div class="mainflip flip-0">
                                <div class="frontside">
                                    <div class="card">
                                        <div class="card-body text-center">
                                            <p><img class=" img-fluid" src="images/tourism.svg" alt="card image"></p>
                                            <h4 class="card-title">Tourism</h4>
                                            <p class="card-text">Discover local attractions, cultural heritage, and guided city tours.</p>
                                            <a href="catogory_service.jsp?ca=Tourism" class="btn btn-primary btn-sm"><i class="fa fa-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="backside">
                                    <div class="card">
                                        <div class="card-body text-center mt-4">
                                            <h4 class="card-title">Hospitals</h4>
                                            <p class="card-text">State-of-the-art healthcare facilities with specialized departments and patient care.</p>
                                            <ul class="list-inline">
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="all_recent_service.jsp">
                                                        <i class="fa fa-faceservice"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="all_recent_service.jsp">
                                                        <i class="fa fa-twitter"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-skype"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-google"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ./Team member -->
                    <!-- Team member -->
                    <div class="col-xs-12 col-sm-6 col-md-4">
                        <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                            <div class="mainflip">
                                <div class="frontside">
                                    <div class="card">
                                        <div class="card-body text-center">
                                            <p><img class=" img-fluid" src="images/hotel.svg" alt="card image"></p>
                                            <h4 class="card-title">Hotels</h4>
                                            <p class="card-text">State-of-the-art healthcare facilities with specialized departments and patient care.</p>
                                            <a href="catogory_service.jsp?ca=Hotels" class="btn btn-primary btn-sm"><i class="fa fa-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="backside">
                                    <div class="card">
                                        <div class="card-body text-center mt-4">
                                            <h4 class="card-title">Hotels</h4>
                                            <p class="card-text">This is basic card with image on top, title, description and button.This is basic card with image on top, title, description and button.This is basic card with image on top, title, description and button.</p>
                                            <ul class="list-inline">
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-faceservice"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-twitter"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-skype"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-google"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ./Team member -->
                    <!-- Team member -->
                    <div class="col-xs-12 col-sm-6 col-md-4">
                        <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                            <div class="mainflip">
                                <div class="frontside">
                                    <div class="card">
                                        <div class="card-body text-center">
                                            <p><img class=" img-fluid" src="images/education.svg" alt="card image"></p>
                                            <h4 class="card-title">Education</h4>
                                            <p class="card-text">Quality educational institutions from schools to universities fostering learning and development.</p>
                                            <a href="catogory_service.jsp?ca=Education" class="btn btn-primary btn-sm"><i class="fa fa-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="backside">
                                    <div class="card">
                                        <div class="card-body text-center mt-4">
                                            <h4 class="card-title">Sunlimetech</h4>
                                            <p class="card-text">This is basic card with image on top, title, description and button.This is basic card with image on top, title, description and button.This is basic card with image on top, title, description and button.</p>
                                            <ul class="list-inline">
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-faceservice"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-twitter"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-skype"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-google"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ./Team member -->
                    <!-- Team member -->
                    <div class="col-xs-12 col-sm-6 col-md-4">
                        <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                            <div class="mainflip">
                                <div class="frontside">
                                    <div class="card">
                                        <div class="card-body text-center">
                                            <p><img class=" img-fluid" src="images/emergency.jpg" alt="card image"></p>
                                            <h4 class="card-title">Emergency</h4>
                                            <p class="card-text">Quick-response teams providing 24/7 emergency services across the city.</p>
                                            <a href="catogory_service.jsp?ca=Emergency" class="btn btn-primary btn-sm"><i class="fa fa-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="backside">
                                    <div class="card">
                                        <div class="card-body text-center mt-4">
                                            <h4 class="card-title">Sunlimetech</h4>
                                            <p class="card-text">This is basic card with image on top, title, description and button.This is basic card with image on top, title, description and button.This is basic card with image on top, title, description and button.</p>
                                            <ul class="list-inline">
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-faceservice"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-twitter"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-skype"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-google"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ./Team meber -->
                    <!-- Team member -->
                    <div class="col-xs-12 col-sm-6 col-md-4">
                        <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                            <div class="mainflip">
                                <div class="frontside">
                                    <div class="card">
                                        <div class="card-body text-center">
                                            <p><img class=" img-fluid" src="images/cafe.jpg" alt="card image"></p>
                                            <h4 class="card-title">Cafe & Restaurants</h4>
                                            <p class="card-text">Cozy cafes offering a variety of beverages, snacks, and a welcoming atmosphere.</p>
                                            <a href="catogory_service.jsp?ca=Cafe" class="btn btn-primary btn-sm"><i class="fa fa-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="backside">
                                    <div class="card">
                                        <div class="card-body text-center mt-4">
                                            <h4 class="card-title">Sunlimetech</h4>
                                            <p class="card-text">This is basic card with image on top, title, description and button.This is basic card with image on top, title, description and button.This is basic card with image on top, title, description and button.</p>
                                            <ul class="list-inline">
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-faceservice"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-twitter"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-skype"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-google"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ./Team member -->
                    <!-- Team member -->
                    <div class="col-xs-12 col-sm-6 col-md-4">
                        <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                            <div class="mainflip">
                                <div class="frontside">
                                    <div class="card">
                                        <div class="card-body text-center">
                                            <p><img class=" img-fluid" src="images/hospital.svg" alt="card image"></p>
                                            <h4 class="card-title">Hospital</h4>
                                            <p class="card-text">Fast. Reliable. Ready for You.</p>
                                            <a href="catogory_service.jsp?ca=Hospitals" class="btn btn-primary btn-sm"><i class="fa fa-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="backside">
                                    <div class="card">
                                        <div class="card-body text-center mt-4">
                                            <h4 class="card-title">Sunlimetech</h4>
                                            <p class="card-text">This is basic card with image on top, title, description and button.This is basic card with image on top, title, description and button.This is basic card with image on top, title, description and button.</p>
                                            <ul class="list-inline">
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-faceservice"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-twitter"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-skype"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                        <i class="fa fa-google"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ./Team member -->

                </div>
            </div>
        </section>      

        <section id="quotation" class="align-center pb-5 mb-5">
            <div class="inner-content">
                <h2 class="section-title divider">Quote of the day</h2>
                <blockquote>
                    <q>A Smart City, A Brighter Tomorrow.: Innovating the Future, Preserving the Legacy.</q>
                    <div class="location-name">Dr. Seuss</div>
                </blockquote>
            </div>
        </section>

        <section id="latest-blog" class="py-5 my-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-header align-center">
                            <div class="title">
                                <span>Read our articles</span>
                            </div>
                            <h2 class="section-title">Latest Articles</h2>
                        </div>
                        <div class="row">
                            
                            <!---LIST Articles ----->
                            <% 
                            ArticleDAOImptl adao = new ArticleDAOImptl(DBConnect.getConn());
                            List<Article> artList = adao.getAllArticles();
                            for (Article a : artList) {
                            %>
                            <div class="col-md-4">
                                <article class="column">
                           
                                    <figure>
                                        <a href="article.jsp?aid=<%=a.getAid()%>" class="image-hvr-effect">
                                            <img src="service/<%= a.getImage() %>" alt="post" class="post-image">
                                        </a>
                                    </figure>
                                    <div class="post-item">
                                        <div class="meta-date"><%=a.getPublished_date()%></div>
                                        <h3><a href="article.jsp?aid=<%=a.getAid()%>"><%=a.getTitle()%></a></h3>
                                        <div class="links-element">
                                            <div class="categories">Blogs</div>
                                            <div class="social-links">
                                                <ul>
                                                    <li>
                                                        <a href="#"><i class="icon icon-faceservice"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#"><i class="icon icon-twitter"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#"><i class="icon icon-behance-square"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div><!--links-element-->
                                    </div>
                                       
                                </article>
                            </div>
                            <% } %>
                            
                        
                    </div>
                </div>
            </div>
        </section>

        <hr>

        <%@include file="all_component/footer.jsp"%>

    </body>
</html>