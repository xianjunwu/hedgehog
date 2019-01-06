package pro.dengyi.hedgehog.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pro.dengyi.hedgehog.entity.WebInfo;

public interface WebInfoDao extends JpaRepository<WebInfo, Long> {

}
