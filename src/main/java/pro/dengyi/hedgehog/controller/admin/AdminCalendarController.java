package pro.dengyi.hedgehog.controller.admin;

import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pro.dengyi.hedgehog.model.dto.ListResult;
import pro.dengyi.hedgehog.model.dto.SingleResult;
import pro.dengyi.hedgehog.model.entity.CalendarEvent;
import pro.dengyi.hedgehog.service.CalendarService;

/**
 * 日历controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 21:16
 */
@Slf4j
@RestController
@RequestMapping("/admin/calendar")
public class AdminCalendarController {

  @Autowired
  private CalendarService calendarService;

  @GetMapping("/getAllEvents")
  public ListResult<CalendarEvent> getAllEvents() {
    List<CalendarEvent> list = calendarService.getAllEvents();
    return new ListResult<>("success", "查询成功", list);
  }

  @PostMapping("/saveOrUpdateEvent")
  public SingleResult<CalendarEvent> saveOrUpdateEvent(CalendarEvent calendarEvent) {
    CalendarEvent calendarEventAdded = calendarService.saveOrUpdateEvent(calendarEvent);
    return new SingleResult<>("success", "新增成功", calendarEventAdded);
  }

}
