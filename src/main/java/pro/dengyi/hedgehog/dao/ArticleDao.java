package pro.dengyi.hedgehog.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pro.dengyi.hedgehog.entity.Article;

public interface ArticleDao extends JpaRepository<Article, Long> {

}
