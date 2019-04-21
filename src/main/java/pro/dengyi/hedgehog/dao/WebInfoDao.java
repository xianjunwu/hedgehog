package pro.dengyi.hedgehog.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pro.dengyi.hedgehog.entity.WebSite;

public interface WebInfoDao extends JpaRepository<WebSite, Long> {

}
