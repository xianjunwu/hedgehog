package pro.dengyi.hedgehog.service;

import java.util.List;
import pro.dengyi.hedgehog.model.entity.CalendarEvent;

/**
 * 日历service接口
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-25 16:59
 */
public interface CalendarService {

  /**
   * 获取所有的事件集合用于在日历上的实现
   *
   * @return java.util.List<pro.dengyi.hedgehog.model.entity.CalendarEvent>
   * @author 邓艺
   * @date 2019/6/25 17:03
   */
  List<CalendarEvent> getAllEvents();

  CalendarEvent saveOrUpdateEvent(CalendarEvent calendarEvent);

}
