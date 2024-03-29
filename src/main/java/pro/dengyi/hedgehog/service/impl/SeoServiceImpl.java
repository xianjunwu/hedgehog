package pro.dengyi.hedgehog.service.impl;

import java.util.Date;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import pro.dengyi.hedgehog.dao.SeoDao;
import pro.dengyi.hedgehog.model.entity.Seo;
import pro.dengyi.hedgehog.service.SeoService;

/**
 * seo service接口实现类
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 18:32
 */
@Slf4j
@Service
public class SeoServiceImpl implements SeoService {

  @Autowired
  private SeoDao seoDao;

  @Override
  @Transactional
  public Seo saveOrUpdate(Seo seo) {
    if (seo.getId() == null) {
      //新增
      seo.setCreateTime(new Date());
    } else {
      //更新
      seo.setUpdateTime(new Date());
    }
    return seoDao.save(seo);
  }

  @Override
  public Seo findSeo() {
    List<Seo> all = seoDao.findAll();

    return !CollectionUtils.isEmpty(all) ? all.get(0) : null;
  }
}
