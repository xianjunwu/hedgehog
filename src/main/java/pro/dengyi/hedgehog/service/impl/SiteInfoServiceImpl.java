package pro.dengyi.hedgehog.service.impl;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.util.List;
import java.util.Optional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import pro.dengyi.hedgehog.dao.SiteInfoDao;
import pro.dengyi.hedgehog.model.entity.SiteInfo;
import pro.dengyi.hedgehog.service.SiteInfoService;

/**
 * 网站基本信息service实现类
 *
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
  @Transactional
  public SiteInfo saveOrUpdate(SiteInfo siteInfo) {
    if (siteInfo.getId() == null) {
      //新增
      siteInfo.setCreateTime(LocalDateTime.now());
    } else {
      //更新
      Optional<SiteInfo> byId = siteInfoDao.findById(siteInfo.getId());
      siteInfo.setCreateTime(byId.get().getCreateTime());
      siteInfo.setUpdateTime(LocalDateTime.now());
    }
    return siteInfoDao.save(siteInfo);
  }

  @Override
  public SiteInfo findSiteInfo() {
    List<SiteInfo> all = siteInfoDao.findAll();

    return !CollectionUtils.isEmpty(all) ? all.get(0) : null;
  }

  @Override
  public int findInstallDays() {
    List<SiteInfo> all = siteInfoDao.findAll();
    if (!CollectionUtils.isEmpty(all)) {
      SiteInfo siteInfo = all.get(0);
      LocalDateTime createTime = siteInfo.getCreateTime();
      Period between = Period.between(createTime.toLocalDate(), LocalDate.now());
      return between.getDays();
    }
    return 0;
  }

  @Override
  @Transactional
  public void addPv() {
    List<SiteInfo> all = siteInfoDao.findAll();
    if (all != null) {
      SiteInfo siteInfo = all.get(0);
      long pvNum = siteInfo.getPv() + 1;
      siteInfo.setPv(pvNum);
      siteInfoDao.save(siteInfo);

    }
  }

  @Override
  public Long findPvNumber() {
    List<SiteInfo> all = siteInfoDao.findAll();
    return all.get(0).getPv();
  }
}
