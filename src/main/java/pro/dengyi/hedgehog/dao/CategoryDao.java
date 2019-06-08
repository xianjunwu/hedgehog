package pro.dengyi.hedgehog.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pro.dengyi.hedgehog.model.entity.Category;

/**
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-20 13:58
 */
public interface CategoryDao extends JpaRepository<Category, Long> {

}
