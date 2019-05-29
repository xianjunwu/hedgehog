package pro.dengyi.hedgehog.service.impl;

import lombok.extern.slf4j.Slf4j;
import pro.dengyi.hedgehog.dao.SeoDao;
import pro.dengyi.hedgehog.model.entity.Seo;
import pro.dengyi.hedgehog.service.SeoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *seo service接口实现类
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
	public Seo saveOrUpdate(Seo seo) {
		if (seo.getId() == null) {
			//新增
		} else {
			//更新
		}
		return seoDao.save(seo);
	}
}
