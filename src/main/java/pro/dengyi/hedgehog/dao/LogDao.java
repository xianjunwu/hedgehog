package pro.dengyi.hedgehog.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pro.dengyi.hedgehog.model.entity.Log;

/**
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-07 21:12
 */
public interface LogDao extends JpaRepository<Log, Long> {

}
