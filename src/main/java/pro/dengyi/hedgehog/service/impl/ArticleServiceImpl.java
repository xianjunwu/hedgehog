package pro.dengyi.hedgehog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pro.dengyi.hedgehog.dao.ArticleDao;
import pro.dengyi.hedgehog.entity.Article;
import pro.dengyi.hedgehog.entity.DataGridBo;
import pro.dengyi.hedgehog.entity.DataGridPager;
import pro.dengyi.hedgehog.service.ArticleService;

import java.time.LocalDateTime;
import java.util.List;

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
            article.setLastUpdateTime(LocalDateTime.now());
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
}
