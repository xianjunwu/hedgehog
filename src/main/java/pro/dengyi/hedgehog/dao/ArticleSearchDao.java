package pro.dengyi.hedgehog.dao;

import pro.dengyi.hedgehog.model.dto.ArticleSearchDto;

import org.springframework.data.solr.repository.SolrCrudRepository;

/**
 *文章搜索dao
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-08 22:02
 */
public interface ArticleSearchDao extends SolrCrudRepository<ArticleSearchDto, Long> {
}
