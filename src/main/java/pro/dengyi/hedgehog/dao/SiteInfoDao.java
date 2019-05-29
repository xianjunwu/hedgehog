package pro.dengyi.hedgehog.dao;

import pro.dengyi.hedgehog.model.entity.SiteInfo;

import org.springframework.data.jpa.repository.JpaRepository;

/**
 *网站基本信息dao
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 18:26
 */
public interface SiteInfoDao extends JpaRepository<SiteInfo, Long> {
}
