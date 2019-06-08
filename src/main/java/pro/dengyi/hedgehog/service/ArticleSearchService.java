package pro.dengyi.hedgehog.service;

import pro.dengyi.hedgehog.model.dto.ArticleSearchDto;

/**
 * 文章搜索service接口
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-08 22:00
 */
public interface ArticleSearchService {

  /**
   * 新增或者更新索引
   *
   * @param articleSearchDto 文章搜索数据传输实体
   * @return java.lang.Boolean
   * @author 邓艺
   * @date 2019/6/8 22:04
   */
  Boolean saveOrUpdate(ArticleSearchDto articleSearchDto);
}
