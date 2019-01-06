package pro.dengyi.hedgehog.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pro.dengyi.hedgehog.entity.WebLog;

public interface WebLogDao extends JpaRepository<WebLog, Long> {

}
