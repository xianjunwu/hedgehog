package pro.dengyi.hedgehog.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pro.dengyi.hedgehog.model.entity.Seo;

/**
 * 网站seo dao
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 18:33
 */
public interface SeoDao extends JpaRepository<Seo, Long> {

}
