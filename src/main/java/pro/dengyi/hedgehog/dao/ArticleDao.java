package pro.dengyi.hedgehog.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pro.dengyi.hedgehog.model.entity.Article;

/**
 * 文章dao
 *
 * @author 邓艺
 * @date 2019/6/8 23:00
 */
public interface ArticleDao extends JpaRepository<Article, Long> {

}
