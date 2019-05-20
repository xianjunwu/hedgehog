package pro.dengyi.hedgehog.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pro.dengyi.hedgehog.entity.Seo;

public interface WebSeoDao extends JpaRepository<Seo, Long> {

}
