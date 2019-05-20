package pro.dengyi.hedgehog.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pro.dengyi.hedgehog.entity.Log;

public interface WebLogDao extends JpaRepository<Log, Long> {

}
