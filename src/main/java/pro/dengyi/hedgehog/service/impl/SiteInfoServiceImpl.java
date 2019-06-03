package pro.dengyi.hedgehog.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import lombok.extern.slf4j.Slf4j;
import pro.dengyi.hedgehog.dao.SiteInfoDao;
import pro.dengyi.hedgehog.model.entity.SiteInfo;
import pro.dengyi.hedgehog.service.SiteInfoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

/**
 *
 *网站基本信息service实现类
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 18:25
 */
@Slf4j
@Service
public class SiteInfoServiceImpl implements SiteInfoService {
	@Autowired
	protected SiteInfoDao siteInfoDao;

	@Override
	public SiteInfo saveOrUpdate(SiteInfo siteInfo) {
		if (siteInfo.getId() == null) {
			//新增
			siteInfo.setCreateTime(LocalDateTime.now());
		} else {
			//更新
			siteInfo.setUpdateTime(LocalDateTime.now());
		}
		return siteInfoDao.save(siteInfo);
	}

	@Override
	public SiteInfo findSiteInfo() {
		List<SiteInfo> all = siteInfoDao.findAll();

		return !CollectionUtils.isEmpty(all) ? all.get(0) : null;
	}
}
