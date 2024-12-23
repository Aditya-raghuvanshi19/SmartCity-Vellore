package com.DAO;

import java.util.List;

import com.entity.Article;

public interface ArticleDAO {
    public boolean addArticles(Article b);

	public List<Article> getAllArticles();

	public Article getArticleById(int id);
        
        


	
}
