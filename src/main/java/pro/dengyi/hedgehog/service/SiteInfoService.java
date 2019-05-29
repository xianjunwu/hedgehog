package pro.dengyi.hedgehog.service;

import pro.dengyi.hedgehog.model.entity.SiteInfo;

/**
 *网站基本信息service接口
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 18:23
 */
public interface SiteInfoService {

	/**
	 * 保存或更新网站基本信息
	 *
	 * @param siteInfo    网站基本信息封装
	 * @return pro.dengyi.hedgehog.model.entity.SiteInfo
	 * @author 邓艺
	 * @date 2019/5/29 18:24
	 */
	SiteInfo saveOrUpdate(SiteInfo siteInfo);
}
