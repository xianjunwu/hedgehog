package pro.dengyi.hedgehog.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pro.dengyi.hedgehog.model.entity.User;

public interface WebUserDao extends JpaRepository<User, Long> {

}
