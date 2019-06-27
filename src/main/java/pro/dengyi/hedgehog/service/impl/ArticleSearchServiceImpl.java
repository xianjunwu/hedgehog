package pro.dengyi.hedgehog.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pro.dengyi.hedgehog.dao.ArticleSearchDao;
import pro.dengyi.hedgehog.model.dto.ArticleSearchDto;
import pro.dengyi.hedgehog.service.ArticleSearchService;

/**
 * 文章搜索service接口实现类
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-08 22:01
 */
@Service
@Slf4j
public class ArticleSearchServiceImpl implements ArticleSearchService {

  @Autowired
  private ArticleSearchDao articleSearchDao;

  @Override
  @Transactional
  public Boolean saveOrUpdate(ArticleSearchDto articleSearchDto) {
    ArticleSearchDto save = articleSearchDao.save(articleSearchDto);
    return save != null;
  }
}
