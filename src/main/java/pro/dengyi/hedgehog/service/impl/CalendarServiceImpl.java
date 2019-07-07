package pro.dengyi.hedgehog.service.impl;

import java.util.Date;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pro.dengyi.hedgehog.dao.CalendarDao;
import pro.dengyi.hedgehog.model.entity.CalendarEvent;
import pro.dengyi.hedgehog.service.CalendarService;

/**
 * 日历接口实现类
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-25 16:59
 */
@Slf4j
@Service
public class CalendarServiceImpl implements CalendarService {

  @Autowired
  private CalendarDao calendarDao;


  @Override
  public List<CalendarEvent> getAllEvents() {
    return calendarDao.findAll();
  }

  @Override
  @Transactional
  public CalendarEvent saveOrUpdateEvent(CalendarEvent calendarEvent) {
    if (calendarEvent.getId() == null) {
      calendarEvent.setCreateTime(new Date());
    } else {
      calendarEvent.setUpdateTime(new Date());
    }
    CalendarEvent save = calendarDao.save(calendarEvent);
    return save;
  }
}
