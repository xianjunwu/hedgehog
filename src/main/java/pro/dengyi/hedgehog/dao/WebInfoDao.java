package pro.dengyi.hedgehog.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pro.dengyi.hedgehog.entity.SiteInfo;

public interface WebInfoDao extends JpaRepository<SiteInfo, Long> {

}
