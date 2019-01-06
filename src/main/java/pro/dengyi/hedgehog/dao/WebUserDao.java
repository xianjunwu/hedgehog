package pro.dengyi.hedgehog.dao;


import org.springframework.data.jpa.repository.JpaRepository;
import pro.dengyi.hedgehog.entity.WebUser;

public interface WebUserDao extends JpaRepository<WebUser, Long> {

}
