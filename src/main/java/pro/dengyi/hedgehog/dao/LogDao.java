package pro.dengyi.hedgehog.dao;

import pro.dengyi.hedgehog.model.entity.Log;

import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-07 21:12
 */
public interface LogDao extends JpaRepository<Log, Long> {
}
