/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Article;


import java.sql.Connection;

import java.sql.PreparedStatement;

public class ArticleDAOImptl {
    private Connection conn;

	public ArticleDAOImptl(Connection conn) {
		super();
		this.conn = conn;
	}
        
        public boolean addArticles(Article a) {
		boolean f = false;
		try {
			String sql = "insert into articles(image,title,description,content,publisher) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, a.getImage());
			ps.setString(2, a.getTitle());
			ps.setString(3, a.getDescription());
			ps.setString(4, a.getContent());
			ps.setString(5, a.getPublisher());
			
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
        public List<Article> getAllArticles() {

		List<Article> list = new ArrayList<>();
		Article a = null;

		try {
			String sql = "select * from articles";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				a = new Article();
				a.setAid(rs.getInt(1));
				a.setImage(rs.getString(2));
				a.setPublished_date(rs.getString(3));
				a.setTitle(rs.getString(4));
				a.setDescription(rs.getString(5));
				a.setContent(rs.getString(6));
				a.setPublisher(rs.getString(7));
				list.add(a);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Article getArticleById(int id) {

		Article a = null;
		try {
			String sql = "select * from articles where aid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				a = new Article();
				a.setAid(rs.getInt(1));
				a.setImage(rs.getString(2));
				a.setPublished_date(rs.getString(3));
				a.setTitle(rs.getString(4));
				a.setDescription(rs.getString(5));
				a.setContent(rs.getString(6));
				a.setPublisher(rs.getString(7));
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}
        
        
        
        /*
            public List<Article> getArticleByEmail(String email) {
            List<Article> list = new ArrayList<>();
		Article a = null;
		
		try {
			String sql = "select * from articles where publisher=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				a = new Article();
				a.setAid(rs.getInt(1));
				a.setImage(rs.getString(2));
				a.setPublished_date(rs.getString(3));
				a.setTitle(rs.getString(4));
				a.setDescription(rs.getString(5));
				a.setContent(rs.getString(6));
				a.setPublisher(rs.getString(7));
				list.add(a);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean updateEditArticles(Article a) {
		boolean f = false;
		try {
			String sql = "update articles set image=?,published_date=?,title=?,description=?,content=?,publisher=? where aid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, a.getImage());
			ps.setString(2, a.getPublished_date());
			ps.setString(3, a.getTitle());
			ps.setString(4, a.getDescription());
			ps.setString(5, a.getContent());
			ps.setString(6, a.getPublisher());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteArticles(int id) {
		boolean f = false;
		try {
			String sql = "delete from article where aid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
*/
        
}
