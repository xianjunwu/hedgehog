package pro.dengyi.hedgehog.service;

import pro.dengyi.hedgehog.model.bo.DataGridBo;
import pro.dengyi.hedgehog.model.bo.NormalPageQueryBo;
import pro.dengyi.hedgehog.model.entity.Article;

/**
 * 文章service接口
 *
 * @author 邓艺
 * @date 2019/6/8 23:01
 */
public interface ArticleService {

  /**
   * 查询文章的数量 <br/>
   *
   * @return java.lang.Integer
   * @author 邓艺
   * @date 2019/5/15 13:34
   */
  Integer findTheNumberOfArticle();

  /**
   * 保存或更新文章 <br/>
   *
   * @return void
   * @author 邓艺
   * @date 2019/5/15 15:52
   */
  Article saveOrUpdate(Article article);

  DataGridBo<Article> pageQuery(Integer pageNumer, Integer pageSize, String search, String sortBy,
      String order);

  Article findOne(Long id);


  NormalPageQueryBo<Article> conditionPageQuery(String categoryName, Integer pageNumber,
      Integer pageSize);

  void deleteById(Long id);
}
