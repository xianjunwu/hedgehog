package pro.dengyi.hedgehog.dao;

import pro.dengyi.hedgehog.model.entity.Notice;

import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-07 21:17
 */
public interface NoticeDao extends JpaRepository<Notice, Long> {
}
