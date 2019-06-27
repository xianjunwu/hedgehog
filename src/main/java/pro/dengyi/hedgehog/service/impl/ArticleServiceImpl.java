package pro.dengyi.hedgehog.service.impl;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pro.dengyi.hedgehog.dao.ArticleDao;
import pro.dengyi.hedgehog.dao.ArticleSearchDao;
import pro.dengyi.hedgehog.model.bo.DataGridBo;
import pro.dengyi.hedgehog.model.bo.DataGridPager;
import pro.dengyi.hedgehog.model.bo.NormalPageQueryBo;
import pro.dengyi.hedgehog.model.dto.ArticleSearchDto;
import pro.dengyi.hedgehog.model.entity.Article;
import pro.dengyi.hedgehog.model.entity.Category;
import pro.dengyi.hedgehog.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {

  @Autowired
  private ArticleDao articleDao;

  @Autowired
  private ArticleSearchDao articleSearchDao;

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

    Article articleSaved = articleDao.save(article);
    //开启线程同步数据到搜索引擎,只有发布了的才同步
    if (articleSaved.getArticleStatus()) {
      addToSearchSystem(articleSaved);
    }

    return articleDao.save(article);
  }

  /**
   * 搜索引擎同步线程
   */
  @Async
  public void addToSearchSystem(Article article) {
    ArticleSearchDto articleSearchDto = new ArticleSearchDto();
    BeanUtils.copyProperties(article, articleSearchDto);
    articleSearchDao.save(articleSearchDto);

  }

  @Override
  public DataGridBo<Article> pageQuery(Integer pageNumer, Integer pageSize, String search,
      String sortBy, String order) {

    Pageable pageable = null;

    //判断是否排序
    Sort sort = null;
    if (StringUtils.isNotBlank(sortBy) && StringUtils.isNotBlank(order)) {
      if ("asc".equalsIgnoreCase(order)) {
        sort = new Sort(Direction.ASC, sortBy);
      } else {
        sort = new Sort(Direction.DESC, sortBy);
      }
    }
    if (sort == null) {
      pageable = PageRequest.of(pageNumer - 1, pageSize);
    } else {
      pageable = PageRequest.of(pageNumer - 1, pageSize, sort);
    }
    //是否搜索
    Example<Article> example = null;
    if (StringUtils.isNotBlank(search)) {
      Article queryParams = new Article();
      queryParams.setTitle(search);
      ExampleMatcher matching = ExampleMatcher.matching()
          .withMatcher("title", ExampleMatcher.GenericPropertyMatchers.contains());
      example = Example.of(queryParams, matching);
    }

    Page<Article> articles = null;
    //判断是否需要模糊查询
    if (example == null) {
      articles = articleDao.findAll(pageable);
    } else {
      articles = articleDao.findAll(example, pageable);
    }

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
  public NormalPageQueryBo<Article> conditionPageQuery(String categoryName, Integer pageNumber,
      Integer pageSize) {
    Pageable pageable = PageRequest.of(pageNumber - 1, pageSize);

    Category innerParams = new Category();
    innerParams.setPath(categoryName);
    //创建查询条件封装对象
    Article queryParams = new Article();
    queryParams.setCategory(innerParams);
    //创建
    ExampleMatcher exampleMatcher = ExampleMatcher.matching();
    Example<Article> example = Example.of(queryParams, exampleMatcher);
    Page<Article> all = articleDao.findAll(example, pageable);

    NormalPageQueryBo<Article> articleNormalPageQueryBo = new NormalPageQueryBo<>();
    articleNormalPageQueryBo.setData(all.getContent());
    articleNormalPageQueryBo.setTotalElements(all.getTotalElements());
    articleNormalPageQueryBo.setTotalPages(all.getTotalPages());
    articleNormalPageQueryBo.setPageNumber(pageNumber);
    articleNormalPageQueryBo.setPageSize(all.getSize());
    return articleNormalPageQueryBo;
  }

  @Override
  @Transactional
  public void deleteById(Long id) {
    articleDao.deleteById(id);
    deleteFromSearchSystem(id);
  }

  @Async
  public void deleteFromSearchSystem(Long id) {
    articleSearchDao.deleteById(id);
  }
}
