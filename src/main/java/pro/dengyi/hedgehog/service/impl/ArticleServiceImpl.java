package pro.dengyi.hedgehog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pro.dengyi.hedgehog.dao.ArticleDao;
import pro.dengyi.hedgehog.model.entity.Article;
import pro.dengyi.hedgehog.model.vo.DataGridBo;
import pro.dengyi.hedgehog.model.vo.DataGridPager;
import pro.dengyi.hedgehog.service.ArticleService;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class ArticleServiceImpl implements ArticleService {
	@Autowired
	private ArticleDao articleDao;

	@Override
	public Integer findTheNumberOfArticle() {
		return articleDao.findAll().size();
	}

	@Override
	@Transactional
	public Article saveOrUpdate(Article article) {
		//新增
		if (article.getId() == null) {
			article.setCreateTime(LocalDateTime.now());
		} else {
			article.setUpdateTime(LocalDateTime.now());
		}
		return articleDao.save(article);
	}

	@Override
	public DataGridBo<Article> pageQuery(Integer pageNumer, Integer pageSize) {
		Pageable pageable = PageRequest.of(pageNumer - 1, pageSize);
		Page<Article> articles = articleDao.findAll(pageable);
		List<Article> content = articles.getContent();
		long totalElements = articles.getTotalElements();
		int number = articles.getNumber();
		return new DataGridBo<>(content, new DataGridPager(number + 1, totalElements, pageSize));
	}

	@Override
	public Article findOne(Long id) {
		Optional<Article> byId = articleDao.findById(id);
		return byId.orElse(null);
	}

	@Override
	public List<Article> conditionPageQuery(String categoryName, Integer pageNumber, Integer pageSize) {
		Pageable pageable = PageRequest.of(pageNumber-1,pageSize);
		// TODO: 2019/5/29 封装类型
//		Example example = Example.of()
		Page<Article> all = articleDao.findAll(pageable);
		return null;
	}
}
