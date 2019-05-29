package pro.dengyi.hedgehog.service;

import java.util.List;

import pro.dengyi.hedgehog.model.entity.Article;
import pro.dengyi.hedgehog.model.vo.DataGridBo;

public interface ArticleService {

    /**
     * 查询文章的数量
     * <br/>
     *
     * @param
     * @return java.lang.Integer
     * @author 邓艺
     * @date 2019/5/15 13:34
     */
    Integer findTheNumberOfArticle();

    /**
     * 保存或更新文章
     * <br/>
     *
     * @param article
     * @return void
     * @author 邓艺
     * @date 2019/5/15 15:52
     */
    Article saveOrUpdate(Article article);

    DataGridBo<Article> pageQuery(Integer pageNumer, Integer pageSize);

	Article findOne(Long id);

    List<Article> conditionPageQuery(String categoryName, Integer pageNumber, Integer pageSize);
}
