package pro.dengyi.hedgehog.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pro.dengyi.hedgehog.model.entity.CalendarEvent;

/**
 * dao接口
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-25 17:01
 */
public interface CalendarDao extends JpaRepository<CalendarEvent, Long> {

}
