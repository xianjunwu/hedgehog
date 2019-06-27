package pro.dengyi.hedgehog.model.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.time.LocalDateTime;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import pro.dengyi.hedgehog.base.BaseEntity;

/**
 * 日历实体类
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 21:18
 */
@Data
@Entity
@Table(name = "t_calendar_event")
public class CalendarEvent extends BaseEntity {

  @Override
  public Long getId() {
    return super.getId();
  }

  @Override
  public void setId(Long id) {
    super.setId(id);
  }

  /**
   * 标题
   */
  private String title;

  /**
   * 描述
   */
  @JsonProperty("desc")
  private String calendarDesc;


  /**
   * 是否是全天事件
   */
  private Boolean allDay = true;

  /**
   * 开始时间
   */
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
  @Column(columnDefinition = "date")
  private Date start;

  /**
   * 截止时间
   */
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
  @Column(columnDefinition = "date")
  private Date end;


  @Override
  @JsonIgnore
  public LocalDateTime getCreateTime() {
    return super.getCreateTime();
  }

  @Override
  @JsonIgnore
  public LocalDateTime getUpdateTime() {
    return super.getUpdateTime();
  }
}
