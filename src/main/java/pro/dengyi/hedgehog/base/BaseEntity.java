package pro.dengyi.hedgehog.base;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.time.LocalDateTime;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 基础实体类
 *
 * 一定要记住：MappedSuperclass必须加上，否则在生产表的时候不能生成父类中的字段
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 18:35
 */
@Data
@MappedSuperclass
public class BaseEntity {

  @Id
  @GeneratedValue
  public Long id;

  /**
   * 创建时间
   */
  @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
  @JsonFormat(pattern = "yyyy-MM-dd hh:mm")
  public LocalDateTime createTime;

  /**
   * 更新时间
   */
  @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
  @JsonFormat(pattern = "yyyy-MM-dd hh:mm")
  public LocalDateTime updateTime;

}
