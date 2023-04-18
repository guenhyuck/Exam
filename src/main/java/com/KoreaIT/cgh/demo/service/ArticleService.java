package com.KoreaIT.cgh.demo.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.KoreaIT.cgh.demo.repository.ArticleRepository;
import com.KoreaIT.cgh.demo.util.Ut;
import com.KoreaIT.cgh.demo.vo.Article;
import com.KoreaIT.cgh.demo.vo.ResultData;

@Service
public class ArticleService {
	@Autowired
	private ArticleRepository articleRepository;

	public ArticleService(ArticleRepository articleRepository) {
		this.articleRepository = articleRepository;
	}

	// 서비스 메서드
	public ResultData<Integer> writeArticle(String title, String body) {

		articleRepository.writeArticle(title, body);

		int id = articleRepository.getLastInsertId();
		
		return ResultData.from("S-1", Ut.f("%번글이 생성 되었습니다", id),id);

	}

	public Article getArticle(int id) {

		return articleRepository.getArticle(id);
	}

	public ResultData<Integer> deleteArticle(int id) {
		articleRepository.deleteArticle(id);

		
		return ResultData.from("S-1", Ut.f("%d번게시글을 삭제했습니다",id),id);
	}

	public void modifyArticle(int id, String title, String body) {
		articleRepository.modifyArticle(id, title, body);
	}

	public List<Article> articles() {
		return articleRepository.getArticles();
	}
}