package pro.dengyi.hedgehog.service;

import pro.dengyi.hedgehog.entity.Article;
import pro.dengyi.hedgehog.entity.DataGridBo;

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
}
