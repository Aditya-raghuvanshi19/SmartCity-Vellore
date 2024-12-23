package com.user.servlet;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import com.DB.DBConnect;
import com.DAO.ArticleDAOImptl;

import com.entity.Article;
@WebServlet("/add_article")
@MultipartConfig
public class AddArticle extends HttpServlet {

	@Override
	
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
        String title = req.getParameter("title");
        String publisher = req.getParameter("publisher");
        String content = req.getParameter("content");
        String description = req.getParameter("description");

        Part part = req.getPart("image");
        String fileName = part.getSubmittedFileName();

        Article a = new Article(fileName, title, description, content, publisher);
        ArticleDAOImptl dao = new ArticleDAOImptl(DBConnect.getConn());

        

        HttpSession session = req.getSession();
			if (fileName.endsWith(".jpg") || fileName.endsWith(".png")) {
				boolean f = dao.addArticles(a);

				if (f) {

					String path = getServletContext().getRealPath("") + "service";

					File file = new File(path);

					part.write(path + File.separator + fileName);

					session.setAttribute("succMsg", "Service Addded Sucessfully");
					resp.sendRedirect("index.jsp");

				} else {
					session.setAttribute("failedMsg", "Something wrong on Server");
					resp.sendRedirect("sell_service.jsp");
				}
			} else {
				session.setAttribute("failedMsg", "invalid format!! please add jpg or png file");
				resp.sendRedirect("sell_service.jsp");
			}

    } catch (Exception e) {
        e.printStackTrace();
    }
}


}
