package pro.dengyi.hedgehog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pro.dengyi.hedgehog.dao.ArticleDao;
import pro.dengyi.hedgehog.entity.Article;
import pro.dengyi.hedgehog.service.ArticleService;

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
        return articleDao.save(article);
    }
}
