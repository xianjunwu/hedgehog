package pro.dengyi.hedgehog.service;

import pro.dengyi.hedgehog.model.entity.Seo;

/**
 *
 *seo service接口
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 18:31
 */
public interface SeoService {
	Seo saveOrUpdate(Seo seo);

	Seo findSeo();
}
