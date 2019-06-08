package pro.dengyi.hedgehog.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pro.dengyi.hedgehog.model.entity.User;

/**
 * 用户dao
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-04 21:49
 */
public interface UserDao extends JpaRepository<User, Long> {

}
