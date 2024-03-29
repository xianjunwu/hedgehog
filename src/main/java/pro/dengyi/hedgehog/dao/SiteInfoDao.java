package pro.dengyi.hedgehog.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pro.dengyi.hedgehog.model.entity.SiteInfo;

/**
 * 网站基本信息dao
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 18:26
 */
public interface SiteInfoDao extends JpaRepository<SiteInfo, Long> {

  @Query(nativeQuery = true, value = "select @@basedir as baseDir from dual")
  String queryBaseDir();

}
